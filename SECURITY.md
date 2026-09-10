# Security Policy

## Reporting a vulnerability

Please report vulnerabilities **privately** via GitHub's private vulnerability
reporting: **on the repository you are reading this in**, open the **Security**
tab and choose **Report a vulnerability**.

Do **not** open a public issue for a security problem.

> **Why private reporting:** a public issue discloses the problem before a fix
> exists. GitHub's private vulnerability reporting keeps the report between
> you and the maintainers until a fix is released, and is enabled for this
> repository.

If you cannot use GitHub, report to the owning organisation's coordination
office (the ownership handover is recorded in
[docs/org-move.md](docs/org-move.md); contact data researched 2026-08-28):

- **Until 2026-12-31 — the MII:** Koordinationsstelle der
  Medizininformatik-Initiative at TMF e.V., Charlottenstr. 42, 10117 Berlin —
  <info@medizininformatik-initiative.de>, +49 30 2200247-0.
- **From 2027-01-01 — NUM-DIZ:** NUM-Koordinierungsstelle at Charité – (head: Ralf Heyder; NUM-DIZ project coordination: Annalena Herzog)
  Universitätsmedizin Berlin, Luisenstraße 13, 10117 Berlin —
  <forschungsnetzwerk-unimedizin@charite.de>.

Please do not open a public issue for a vulnerability in either case.

## Scope

This is a template repository for FHIR Implementation Guide tooling. It
processes **no patient data**. In scope are, in particular:

- the CI/CD workflows in `.github/workflows/` — e.g. injection via untrusted
  inputs, excessive token permissions, unpinned actions;
- the scripts in `scripts/`;
- the dev container definition in `.devcontainer/`;
- supply-chain issues in pinned dependencies (SUSHI, IG Publisher, actions).

Vulnerabilities in a **module created from this template** should be reported
to that module's own repository; report them here as well if the root cause is
in the template.

## What to expect

- Acknowledgement of your report within 14 days.
- Coordinated disclosure: we ask you to keep the report private until a fix or
  mitigation is available.
