# Recipe: first build in the dev container

**Goal.** Go from "I want to author an MII KDS module" to a first local IG build — with
a working, fully equipped FHIR toolchain (Java 17, Node 22, SUSHI,
Ruby/Jekyll, Graphviz) — without installing any of those tools on your own
machine. Everything runs inside a container that VS Code builds for you.

> **Why:** the most common way newcomers get stuck is a broken or
> half-installed toolchain ("wrong Java", "npm not found", "Jekyll build
> error"). The dev container turns ten manual installs into one click:
> **Reopen in Container**. This follows the MII meta wiki page
> ["Dev Container ‐ IG Publisher"](https://github.com/medizininformatik-initiative/kerndatensatz-meta/wiki/Dev-Container-%E2%80%90-IG-Publisher).

**Prerequisites.** Three things on your machine — plus `git` and network
access (the first build downloads the base image and tools):

1. **Docker** — [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   (Windows/macOS) or any Docker engine (Linux). Must be running.
2. **Visual Studio Code** — <https://code.visualstudio.com/>.
3. The VS Code extension **Dev Containers**
   (`ms-vscode-remote.remote-containers`). Install it from the Extensions
   view in VS Code.

## Steps

1. Create your module repository from this template: on
   [the template's GitHub page](https://github.com/medizininformatik-initiative/mii-kds-module-template)
   click **"Use this template" → "Create a new repository"**.
   Mind the warning in the `README.md`: tick **"Include all branches"** (or
   run the first-run bootstrap afterwards) so your repository gets the `dev`
   branch.

   *(You can also run this recipe directly on a clone of the template repo —
   for example to try the toolchain or to contribute to the template
   itself.)*

2. Clone **your new module repository** and switch to the `dev` branch:

   ```sh
   git clone https://github.com/<your-org>/<your-module-repo>.git
   cd <your-module-repo>
   git checkout dev
   ```

   > **Why `dev`:** day-to-day work happens on `dev`; `main` only receives
   > releases. See `CONTRIBUTING.md`.

3. Open the folder in VS Code:

   ```sh
   code .
   ```

4. VS Code detects `.devcontainer/devcontainer.json` and shows a toast:
   *"Folder contains a Dev Container configuration file. Reopen folder to
   develop in a container"*. Click **Reopen in Container**.
   If you missed the toast: press `F1` and run
   **Dev Containers: Reopen in Container**.

5. Wait for the first build to finish. Expect **5–15 minutes**: the base
   image is downloaded, Ruby is compiled from source, and SUSHI, Jekyll and
   Graphviz are installed. Every later "Reopen in Container" reuses the built
   image and takes seconds.

   > **Why so long the first time:** the Ruby dev-container feature builds
   > Ruby 3.3.12 with `ruby-build` (compile, not binary download) so the
   > version is exact and reproducible. This is a one-time cost.

6. Verify the toolchain. Open a terminal inside VS Code
   (`Terminal → New Terminal` — it now runs *inside* the container) and run:

   ```sh
   java -version     # OpenJDK 17.x
   node --version    # v22.23.1
   sushi --version   # SUSHI v3.20.1
   ruby --version    # ruby 3.3.12
   jekyll --version  # jekyll 4.4.1
   dot -V            # graphviz version ...
   ```

   Each command must print the version shown in the comment.

7. **Replace the `{{PLACEHOLDER}}` values first — SUSHI cannot compile
   them.** In a new module, work through the placeholder list in the
   `sushi-config.yaml` header (`id: mii-ig-{{MODULE_SLUG}}` is not a valid id
   until you do). On a clone of the template repo itself there is nothing to
   replace permanently: substitute throwaway values locally and do not commit
   them — CI does the same for its self-check build
   (`.github/workflows/ig-publisher.yml`, workspace-only substitution).

   Then run SUSHI to compile the module's FSH sources into FHIR resources:

   ```sh
   sushi .
   ```

   SUSHI reads `sushi-config.yaml` and `input/fsh/` and writes the generated
   resources to `fsh-generated/`.

8. Run the IG Publisher to build the full IG website locally:

   ```sh
   curl -L -o publisher.jar \
     https://github.com/HL7/fhir-ig-publisher/releases/download/2.3.2/publisher.jar
   echo "07c576024df917cc1f879b6b5a64147cd0222d5b4129688e8f0ad9ccce58b1d5  publisher.jar" | sha256sum --check
   java -Xmx6g -jar publisher.jar -ig ig.ini
   ```

   The rendered IG appears in `output/` — open `output/index.html` in a
   browser and read `output/qa.html` (the QA report).

   > **Why the IG Publisher is not pre-installed in the container:** the
   > publisher version is governed by the repository's CI pin and dependency
   > checker, not by the container image. Baking it in would mean rebuilding
   > and re-pinning the container for every publisher bump. Version
   > `2.3.2` + its SHA-256 above were the latest release when this block
   > was last swept (2026-08-19). **The CI pins are the source of truth** (see
   > [`docs/maintenance.md`](../maintenance.md#where-each-pin-lives-single-source-of-truth))
   > — if they ever differ from the command above, CI wins.

   > **Terminology note (expected, not an error):** without an SU-TermServ
   > client certificate the publisher resolves terminology against the
   > official HL7 server `https://tx.fhir.org` (its default). Some
   > MII-specific value sets may not fully expand there — that surfaces as
   > QA *notes*, not a hard failure. CI behaves the same way: it uses the
   > MII central terminology server (SU-TermServ,
   > `https://ontoserver.mii-termserv.de/fhir`) only when the repository
   > secret with the client certificate is configured, and otherwise falls
   > back to `tx.fhir.org` with a notice. The build must still succeed in
   > fallback mode.

## Expected result

- VS Code runs inside the container (the green remote indicator in the
  bottom-left corner shows the dev container name).
- All six version checks in step 6 print the pinned versions.
- `sushi .` reports `0 Errors` and the publisher produces
  `output/index.html` plus a QA report.
- **Green CI build:** pushing your branch gives you the same build in CI
  (SUSHI + IG Publisher, QA gate) plus a Pages preview under
  `branches/<branch>/`.

## Common errors & fixes

| Symptom | Cause | Fix |
|---|---|---|
| "Docker daemon is not running" / "Cannot connect to the Docker daemon" | Docker is installed but not started. | Start Docker Desktop (or `systemctl start docker` on Linux), then retry **Reopen in Container**. |
| Toast never appears; no "Reopen in Container" command | The Dev Containers extension is missing. | Install `ms-vscode-remote.remote-containers`, then reload VS Code. |
| Container start fails with a bind-mount error mentioning `.fhir` | The container mounts `~/.fhir` (the FHIR package cache) from your host, and your Docker setup refuses to auto-create it. | Create it once on the **host**: `mkdir ~/.fhir` — then rebuild. |
| First build seems stuck at the Ruby feature | Ruby is compiling from source; this is the slow step. | Wait — it can take several minutes. Do not cancel. |
| Publisher dies with `java.lang.OutOfMemoryError: Java heap space` | The IG Publisher needs more heap than the JVM default; KDS builds with many dependencies are memory-hungry. | Run it with an explicit heap limit: `java -Xmx6g -jar publisher.jar -ig ig.ini` (raise to `-Xmx8g` if your machine has the RAM; also raise Docker Desktop's memory limit if the container itself is capped). |
| Publisher hangs or fails while "Fetching" / "Loading" packages; or errors mention a corrupt package | The FHIR package cache (`~/.fhir/packages`) has a truncated download from an interrupted run. | Delete the offending package directory from `~/.fhir/packages` on the host (or the whole `packages` folder in the worst case) and rebuild — the cache repopulates. |
| QA report notes that value sets could not be expanded; log shows a fallback notice about `tx.fhir.org` | No SU-TermServ client certificate configured, so the build used the public HL7 terminology server, which does not carry every MII-specific value set. | Expected fallback behavior, not a failure — see the terminology note in step 8. For full expansion a maintainer configures the SU-TermServ client-certificate secret (Germany-only access). |
| `npm install -g` or `gem install` fails with `EACCES` / "permission denied" during post-create | A stale container image from an older configuration. | Run `F1` → **Dev Containers: Rebuild Container Without Cache**. |
| Downloads fail with TLS/certificate errors | A corporate proxy intercepts TLS. | Configure Docker and VS Code for your proxy (ask your IT for the CA certificate), or build outside the proxied network once. |
| You edited `.devcontainer/devcontainer.json` but nothing changed | The old container is still running. | `F1` → **Dev Containers: Rebuild Container**. |

> **Why the `~/.fhir` mount exists at all:** the IG toolchain caches FHIR
> packages (the KDS module dependencies, base profiles, the MII IG template
> package) under `~/.fhir`. Mounting the host cache into the container — as
> the MII wiki prescribes — means packages are downloaded once and survive
> container rebuilds.
