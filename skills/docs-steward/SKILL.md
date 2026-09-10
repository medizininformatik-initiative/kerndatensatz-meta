---
name: docs-steward
description: >-
  Audits, repairs and trims the documentation of whatever repository it is
  invoked in, in any language, stack or domain. Verifies every link, path and
  factual claim against the repository itself; removes the decision narration an
  AI assistant leaves behind; reduces the docs to what someone actually needs to
  create, modify and maintain the project; checks the language is followable by
  someone new to the subject; and walks the documented path as both a first-time
  and an experienced user. Re-verifies every finding against the repository
  before reporting it, returns the report to whoever ran it rather than
  committing it, offers to open one tracked issue
  per finding a human must resolve, and in apply mode fixes what is verifiably
  safe. Activate after a refactor, before a release, before opening a
  repository to outside readers, or when the docs have been AI-assisted.
license: CC-BY-4.0
---

# docs-steward — check, fix and trim a repository's documentation

Documentation rots in specific, recognisable ways: a path that moved, a number
that was true once, a decision explained in five places, a rule that outlived
the thing it governed. This skill finds those, fixes what can be fixed
mechanically, and turns the rest into tasks someone can act on.

It works on **the repository it is invoked in**, needs no arguments, and assumes
nothing about the language, stack, domain or folder layout. Everything it needs
it discovers in step 0.

## Modes

| Mode | What it does | When |
| --- | --- | --- |
| **report** (default) | Changes nothing in the repository. Returns the report to the person who ran it. | First run; any repo you do not own |
| **apply** | Also fixes what is verifiably safe (see *What may be fixed automatically*) | Once you trust the report |

Always run **report** first on a repository you have not stewarded before.

## Non-negotiable limits

**Every finding carries a severity**, and the report leads with the worst:

| Severity | Test |
| --- | --- |
| **high** | Someone following the documentation is led into a broken or harmful outcome — a command that cannot work, a report routed somewhere unread, a rule stated backwards. |
| **medium** | The documentation is wrong or self-contradictory, but a careful reader survives it. |
| **low** | Correct and usable, but harder to find, follow or trust than it needs to be. |

Nothing is high because it was tedious to find. If a defect cannot hurt a
reader, it is not high, however wrong it is.

**A finding belongs to the step that discovers it**, and later steps do not
re-file what an earlier one already reported. Walking the docs surfaces
inventory and claim problems as a matter of course; report them where they were
found and move on.

Violating any of these is a failure of the run, not a judgement call.

1. **Never rewrite git history.** Not to remove an address, not to reword a
   commit. Report it; a human decides.
2. **Never edit a published, dated artefact** — an existing audit report, a
   changelog entry for a released version, a decision record that has been
   accepted. It records what was true then; a later run supersedes it with new
   output instead of rewriting it. If an old artefact contradicts today's
   repository, that is expected; say so in this run's report.
3. **Never hand-edit generated or vendored files.** Fix the source, or report
   that the copy needs regenerating. Step 0 identifies which these are.
4. **Never weaken a statement of mechanism.** If something genuinely fails a
   build, blocks a merge or deletes data, the docs must keep saying so.
   Softening "the check fails" into "the check suggests" is a regression, not a
   de-escalation.
5. **Never invent a fact to fill a gap.** If something cannot be verified, the
   report says so and what was tried.
6. **Never report an unverified finding.** Every finding is re-checked against
   the repository before it reaches the report (step 11). When in doubt, drop
   it.
7. **Never create issues, branches or commits without being asked.** Proposing
   is the default; acting needs a yes.

## Step 0 — Discover the repository before judging it

Nothing below assumes a layout. Establish these first, and write them into the
report so the reader knows what the run was measured against.

- **Purpose.** Read the entry-point document (`README` or equivalent) and state
  in one sentence what this repository is *for*. Every later judgement about
  "does this earn its place" is measured against that sentence. If you cannot
  write it, that is itself the first finding.
- **Where documentation lives.** Do not assume a `docs/` folder. Look for:
  markdown or reStructuredText anywhere in the tree, a `doc*/` directory under
  any name, a wiki checkout, `*.adoc`, a docs site generator's source
  (`mkdocs.yml`, `docusaurus.config.*`, `_config.yml`, `book.toml`), long-form
  comments at the top of source files, and the forge's own surfaces (issue
  templates, `.github/` or equivalent). Documentation is wherever a reader is
  expected to read.
- **What is generated or vendored.** Check ignore files, lockfiles, sync
  scripts, build outputs, dependency directories and any tree a tool owns.
  These are read-only for this skill.
- **What this repository exports to others** — files copied or synced *out* into
  other projects, if any. Look for sync scripts here or in a consuming repo,
  publish manifests, template directories. Step 6 cannot be applied correctly
  without this list: a file copied elsewhere must stay self-contained, so
  "replace the duplicate with a link" is the wrong fix for it.
- **Where the built or published artefact is**, if the project produces one: a
  pages branch, the publish target named in CI, a configured output directory.
  Step 2 needs it.
- **What has already been decided.** Find the project's backlog, decision
  records, open-questions file or previous audit reports, whatever they are
  called. A finding already recorded as a deliberate decision is **not a
  finding**; re-raising it every run is how a report becomes noise.
- **What the project's own gates are** — its tests, linters, link checkers,
  build. You will need them at the end.

## Step 1 — Inventory

Produce the numbers before the opinions.

- Every documentation file, its size, and its **inbound link count**. A file
  nothing links to is either orphaned or an entry point — decide which. Strip
  code spans and fenced blocks before extracting links, or example text
  produces phantom references; credit a link to a directory to that directory's
  index. Where a project wires pages through a config file rather than links,
  inbound-link count is a weak orphan signal — check the config too.
- Whether each documentation directory has an index. A bare file listing is the
  most common cause of "I could not find it".
- Where one topic is covered by more than one file.

## Step 2 — References: links, paths, filenames, anchors

Resolve every reference. **The most common mistake is checking one namespace and
reporting the others as broken.** Separate them:

| Kind | Resolves against | Trap |
| --- | --- | --- |
| Relative file link | the filesystem | — |
| Anchor (`file#heading`) | the target's real headings | Heading text changes; the anchor does not |
| Forge-relative (`../../issues`) | the hosting platform, by URL depth | Depth differs by the source file's own depth |
| Link inside published content | the **built** artefact, not the source tree | Correct source links can look broken to a naive checker |
| Cross-repository / external | that target existing *now* | A destination that does not exist *yet* is a 404 today |
| Path inside a code example | what the command would actually see | Working directory matters |

Fix where the target is unambiguous; otherwise report with the candidates found.
Verify anchors by extracting the target's real headings and slugging them — do
not assume. Where the repository builds or publishes anything, check the built
artefact too: a link can be valid on disk and dead in what users read.

## Step 3 — Claims: re-derive every number

Prose that counts things goes stale silently, and a stale number is worse than
none, because it gets quoted onward into commit messages, tests and reviews.

For every claim of the form *"N files"*, *"all X are Y"*, *"every Z does W"*,
*"the only place that…"* — **re-derive it now** and correct or delete it.

Mind the *shape* of the claim: a universal is falsified by one counter-example.
Look for the counter-example instead of confirming the rule.

Also verify: **version and dependency pins** quoted in prose against the file
that holds them; **commands quoted in docs** — run the safe ones, since a
command that cannot work as written is a broken doc however well it reads; and
**external citations** — that the source says what is claimed and the URL
resolves. Prefer primary sources and cite them with version and date.

## Step 4 — Remove the assistant's residue

An AI working across a repository leaves explanation where it happened to be
working, not where a reader needs it. Remove:

- **Decision narration** — "we chose X because Y", "this was changed to…",
  "previously this did…". A repository documents *what is*; reasoning that still
  matters belongs in one place, not scattered.
- **Self-referential justification** — a passage explaining why the page it is
  on exists, or why it is as long as it is.
- **Progress and status residue** — "not yet available", "landing in a separate
  change", "(planned)", "TODO(agent)", "confirmed on `<date>`" banners. Check
  each against reality; most describe something that has since shipped.
- **Attribution to an AI** — as author, co-author or reviewer, in files, commit
  templates or contribution templates.
- **Duplicated rationale** — the same "why" restated in every file that touches
  the topic.

Keep rationale a maintainer would otherwise re-litigate: why a pin exists, why
something apparently redundant is deliberate, what a non-obvious constraint
protects. Delete rationale that only records that a decision once happened.

## Step 5 — Authority and personal data

Two failure modes, both of which misrepresent someone.

- **Overclaimed authority.** A repository may state its own rules. It may not
  present them as an organisation's or standard body's rules unless that body
  published them. Check what is actually published — governance documents, the
  body's other repositories, an organisation-level defaults repository, the
  official site — and cite it with version and date, confirming it is current.
  Where nothing is published, say the rule is this repository's own choice.
- **Personal identification.** No individual should be named as contact, owner
  or example unless they have agreed to represent the project. Sweep names,
  usernames, email addresses and handles in file content, ownership files,
  templates, code comments and example data. Report occurrences in
  version-control history too — cite those by revision identifier and where the
  string sits (message body, trailer, author field) — and never rewrite history
  to fix them. Check whether the exposure is *recurring*: something a merge
  setting or template re-adds every time deserves a forward-looking fix even
  when the past is left alone.

## Step 6 — One fact, one home

- Where a fact appears in several files, choose its home and reduce the others
  to a link. Two tables answering the same question will drift, and usually
  already have — check whether they still agree, and say so.
- **Deliberate duplication is allowed, but must be deliberate.** A warning
  repeated where the mistake is made earns its place. Keep one sentence and a
  link, not a second copy of the explanation.
- **Content under the wrong heading** is invisible to whoever needs it.

**Exception:** where a file is *copied* into other projects — a template, a
scaffold, a starter — it must stay self-contained. Do not replace its content
with a link back to the origin.

## Step 7 — Just barely enough

For each page ask: *does this help someone create, modify or maintain what this
repository is for?* If not, it goes — however well written.

Common failures: reference material duplicating upstream documentation that is
better maintained elsewhere (link it); options the project forbids, documented
at length; history nobody acts on; explanation of what the reader can see in the
code.

Prefer deleting to trimming, and trimming to rewriting.

## Step 8 — Language a stranger can follow

Correct documentation can still be unusable. This step is about the words:
someone who does not know this project's subject, tooling or history must be
able to read it without stopping.

**This step has a failure mode the others do not.** The rest of the skill finds
discrete defects — this link is broken, this number is wrong. Readability is a
*condition*, and a naive pass reports every instance of it: dozens of overlong
sentences, dozens of undefined terms. That is an editorial programme, not a
findings list, and nobody works through it — so the two or three genuinely
blocking items are discarded along with the rest.

Sort by consequence, not by category. The three groups are handled differently
on purpose.

### Blocking — report as findings

A reader is *stopped* by these. Each gets a finding and a concrete task.

- **Undefined on first use** — on the page where the reader meets the term.
  Explain it in a clause or link the definition; do not expand it four times on
  one page. A term defined only in a glossary is not defined for someone who
  arrived from a search engine.
- **Hidden actors** — "the file is generated", "it is validated". By what, and
  when? Name the thing that acts, so the reader knows where to look.
- **Instructions that are not instructions** — "the configuration should be
  correct" tells nobody what to type.
- **Assumed knowledge** — "the usual place", "as expected". If understanding the
  sentence requires already knowing the answer, it fails.
- **Fragments in a language other than the page** they sit on.

### Mechanical — fix, do not report

Unambiguous and safe. In apply mode delete them and list them under *Fixed*; in
report mode give the count and the files, not every instance.

- **`simply`, `just`, `obviously`, `of course`, `merely`, `trivially`** — these
  tell a stuck reader the problem is them. Deleting the word almost always
  improves the sentence and never changes its meaning.

### Aggregate — one observation per page, never line items

Smells, not defects. Report a per-page number and **at most three illustrative
examples**, then stop. Never open a finding per sentence.

- **Sentence length** — measure per paragraph or list item, excluding tables,
  code fences and front matter, or the measurement is noise.
- **Term density** — a paragraph introducing more than two new terms.
- **Synonym drift** — one concept under three names. An expert reads through it;
  a newcomer cannot tell whether two words mean two things. Name the concept and
  the competing terms once, and propose the one to keep.

**Budget.** If the blocking group runs past roughly a dozen findings, report the
worst by consequence and say how many were left out. A truncated list that says
so is useful; an exhaustive one is not read at all.

Two things this step must *not* do: it does not blur a precise technical term
into a vague one, and it does not drop a caveat for being hard. Accuracy wins;
the fix for a hard truth is to explain it.

**Check the definitions are real.** Terms a newcomer meets in the first ten
minutes should be findable wherever this project defines things.

## Step 9 — Walk the documented path, twice

Reading documentation is not testing it. Follow it.

**As a first-time user**, from the entry document's first line: can you get from
nothing to a working result using only what is written? Record the exact point
where you would have had to ask someone. That point is the finding.

**As an experienced user new to this repository**: can you find how to make a
change, what the conventions are, what automation will do to your contribution,
and how a release happens?

For both: note where you had to open a file the documentation never mentioned.

**When the documented environment cannot be started** — no container runtime, no
credentials, no network — do not silently fall back to reading. Run the
underlying commands directly where you safely can, record the divergence as a
**skip, not a finding**, and say how far the walk got and what is therefore
unverified. Two runs on the same repository must be comparable; an unrecorded
skip makes them not.

**A walk that succeeds is a result**, not an empty section. Say so, and say how
far you got — "followed the setup recipe to a verified checksum without needing
another page" is worth more to a maintainer than silence.

## Step 10 — Public-repository hygiene

If the repository is public, check for the community files readers and the
hosting platform expect: an entry document, a licence, contribution guidance, a
code of conduct, a security policy, ownership, issue and change-request
templates, a changelog, citation metadata, a support pointer.

**Check the filesystem. A forge's community-profile API is a hint, not an
answer, and taking it as one manufactures false findings.** GitHub's endpoint
reports `issue_template: null` for a `.github/ISSUE_TEMPLATE/` *directory* — the
modern form GitHub itself recommends — and says nothing at all about a security
policy, support pointer or citation file. Every absence in such a payload must
be corroborated against the default-branch tree before it becomes a finding:
absence from the payload is not absence from the repository. If you use the API,
run a control against a repository known to have the file, and confirm the
endpoint reports it.

**Before writing a missing one, check whether the owning organisation already
publishes it**, including in an organisation-level defaults repository, whose
files apply to every repo lacking its own. Adopting an existing policy beats
authoring a competing one. If nothing is published, say so explicitly in the
file, so nobody mistakes a local choice for an official policy.

Cite every source relied on, with a link.

## Step 11 — Verify every finding before reporting it

Do not report the first pass. Findings gathered across a long run are wrong more
often than they feel, and a report that cries wolf gets ignored — after which
the real findings in it are lost too.

Re-check **every** finding against the repository as it stands *now*, and
**default to discarding when uncertain**. A dropped true finding costs one
run; a confident false one costs the reader's trust in all of them.

**First, deduplicate.** Several passes over one repository will surface the same
defect more than once, with different framings, evidence and severities. Merge
them into one finding before verifying: keep the sharpest evidence from each,
and take the **highest** severity offered, since the pass that saw it as serious
usually saw more of it. A report that lists one defect three times is a report
nobody finishes.

Then, for each finding, in this order:

1. **Is the evidence still there?** Quote-match the text again. Line numbers
   move during a run — including because of your own fixes — so search for the
   string, never trust the recorded line.
2. **Does the conclusion follow from the evidence?** These fail separately. The
   quoted text can be exactly as recorded while the inference from it is wrong.
3. **Attack your own universals.** Any finding of the form "all X are Y",
   "nothing does Z", "the only place" is falsified by one counter-example — go
   looking for it rather than re-confirming the rule. If the finding rests on a
   count or a measurement, **derive it a second time by a different method**
   and see whether the two agree.
4. **Was it already decided?** Compare against what step 0 found. Something
   recorded as a deliberate choice is not a finding, however much it looks like
   one.
5. **Would the proposed fix break something?** Trace what depends on the text or
   file you would change: automation that greps it, a test that asserts it, a
   generated copy, a reader who arrives directly on that page. A fix that
   removes a warning someone needs is worse than the imprecision it corrects.
6. **If you already applied it** (apply mode), verify against the *result*, not
   against what you intended. Re-read the file and re-run the relevant gate.

Findings that survive go in the report.

Findings that do not are split, because they are not the same thing:
**Declined** is for a finding actively disproved — the inference did not follow,
the counter-example exists, or the project already recorded it as decided. That
record is what stops the next run raising it again. A finding you merely *could
not check* is not declined; it belongs under **Could not verify** with what you
tried, so a later run with better access can pick it up.

> **Why this step exists.** A check can pass while the thing it protects is
> broken, if it tests the shape of an answer instead of its substance. Verify
> behaviour against the artefact — the built output, the executed command, the
> actual file — not against the description of it.

## Step 12 — The report

**Deliver the report to whoever ran the skill; do not commit it.** It is a
run output, not a repository artefact: return it in the response, and — if that
is impractical for its size — write it outside the working tree (a scratch or
temp directory) and say where. **Never add a report file to the repository** and
never create a directory to hold one. A finding worth keeping is kept as a
tracked issue (step 13) or as the fix itself, not as a file that ages in the
docs. Date the report *inside* its own heading so a reader knows when it was
produced.

Structure:

1. **Scope** — what step 0 discovered, what was checked, what was deliberately
   not, and the mode the run used. Say which steps returned **nothing**, and
   why if you know: a documentation cleanup landed just before the run explains
   an empty residue section, and without that note an empty section reads as a
   step that was skipped.
2. **Fixed** — one line each with the file. Apply mode only.
3. **Needs a human** — **ordered by severity, highest first**, each with the
   evidence (file, line, quoted text), why it matters, and **a concrete task**
   phrased so it can be handed to a person or an assistant. If a group was
   truncated to a budget, say what was left out and roughly how much.
4. **Declined** — things that look like problems and are not, with the reason.
   This section is what stops the next run re-reporting them.
5. **Could not verify** — and what was tried.

Every finding cites file and line. Quantitative claims *in the report* obey
steps 3 and 11: re-derive, do not repeat.

## Step 13 — Offer to track the human-only findings

A report nobody opens is where findings go to die. If the findings in *Needs a
human* can be tracked in the project's issue tracker, offer that — do not do it
unasked.

**Check access first.** Is a forge CLI or API available and authenticated, does
this repository have a remote on that forge, and does the tracker accept issues?
Try the platform's CLI (for example `gh issue list` on GitHub) and read the
result rather than assuming. If access is missing, say exactly what is missing
and stop — the report still stands on its own.

**Then propose, with the list.** Show the titles you would create and ask for a
yes. If the run is not interactive, that is not a licence to proceed: put the
proposed titles in the report and stop. On confirmation, create **one issue per
finding**, each carrying: the
evidence with file and line, why it matters, the concrete task, and the report
section it came from — named, not linked: the report is not committed, so the
issue has to carry enough of it to stand alone. Apply a consistent label so the set can be
found and closed together.

**Do not create duplicates.** Before creating anything, search open *and* closed
issues for the same finding. A closed issue for a finding that has come back is
a signal worth reporting, not a reason to open a second one. Re-runs of this
skill must converge, not accumulate — if you cannot tell whether a finding is
already tracked, say so and leave it to the human.

Record in the report which findings became issues, with their numbers, so the
report and the tracker agree.

## What may be fixed automatically

In apply mode, fix only what is verifiable and reversible: broken relative links
and anchors with an unambiguous target; stale paths after a rename; provably
wrong numbers; assistant residue and self-referential justification; stale
"not yet available" notes for things that exist; and step 8's **mechanical**
group — the hedge words — which are deletions that cannot change meaning.

Step 8's **blocking** group is reported, never auto-fixed: naming a hidden actor
or defining a term requires knowing which actor and which definition, and
guessing produces confident nonsense. Its **aggregate** group is never fixed at
all — rewriting for length is editing, not repair.

Everything else is a reported task — in particular: deleting or merging whole
files, changing what a rule *means*, editing anything generated or vendored, and
anything touching git history, licensing or a named contact.

Afterwards, run the project's own gates (step 0) and report the results. **A
documentation change that breaks a build is a failed run**, even if every
sentence is now correct.

## Failure modes seen in the wild

Concrete instances of the general traps above, each of which shipped at least
once. Read them as patterns, not as a checklist for one ecosystem.

- **Editing a generated or vendored format has consequences beyond the text.** A
  comment block added to a translation catalogue for documentation purposes
  broke the entire site build.
- **A link checker that knows only one namespace produces confident nonsense.**
  One reported 106 broken links that were all correct — page source referencing
  the built site, not the filesystem.
- **A green build is not a green artefact.** A published page linked a tracker
  at an organisation the project had not migrated to yet: a 404 for every
  reader, while CI passed because it gated on build errors and not on the broken
  link count it also printed.
- **A claim measured wrongly propagates.** "All N generated tables carry a
  class" was false; the code written to rely on it broke unrelated rendering,
  and the test written to protect it asserted the *spelling* of a selector
  rather than its behaviour, so it passed.
- **A rule change leaves its old justification behind.** One such change left
  six files asserting the opposite, including a checklist item that could no
  longer be true.
- **Explicit lists silently exclude.** A test file existed and never ran,
  because the automation listed test files by name and nobody added it.
- **The world can move while you audit it.** Mid-run, two repositories a project
  linked to were created — turning every one of those links from a visible 404
  into a plausible-looking wrong destination, including the one that routed
  security reports. Re-check time-sensitive external facts at the *end* of a
  long run, and treat "this link 404s" as a fact with a timestamp.
