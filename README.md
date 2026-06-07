# Git & GitHub Learning Curriculum

A comprehensive, hands-on curriculum to take a junior developer from zero to confident with Git, GitHub, the GitHub CLI (`gh`), and modern CI/CD automation workflows.

---

## How This Curriculum Works

Each lesson is a self-contained folder:

| File | Purpose | Pushed to GitHub? |
|------|---------|-------------------|
| `README.md` | Framing + task description + questions (Normal & Tricky) | ✅ Yes |
| `ANSWERS.md` | **Student fills this in** — answers + hands-on commands | ✅ Yes |
| `setup.sh` | Builds a sandbox repo with a realistic/messy scenario | ✅ Yes |

**For the learner:**
1. Read the `README.md` for the lesson.
2. Run `bash setup.sh` when hands-on practice is needed.
3. Fill in your answers in `ANSWERS.md`.
4. Commit your answers and open a Pull Request.
5. GitHub Actions automatically validates your answers. Only passing answers can be merged.
6. Receive the deeper explanation verbally from your mentor.

---

## Answer Submission Workflow (PR + CI)

This repo uses **GitHub Actions** to automatically validate student answers on every Pull Request. The junior cannot merge her work until the validation check passes.

### For the student

1. **Work locally**: Read the lesson, run `bash setup.sh`, experiment in `sandbox/`.
2. **Fill in `ANSWERS.md`**: Answer the Normal and Tricky questions. Record the commands you ran for hands-on tasks. Write a brief reflection.
3. **Commit and push**:
   ```bash
   git add 01-git/02-staging-and-commits/staging-basics/ANSWERS.md
   git commit -m "Complete staging-basics lesson"
   git push origin feature-branch
   ```
4. **Open a Pull Request** to `main`.
5. **Wait for CI**: GitHub Actions runs `tests/validate.py` and posts a report comment on the PR.
6. **Fix if needed**: If any lesson fails, read the CI comment, fix your answers, commit, and push again. The PR updates automatically.
7. **Merge**: Once CI is green, the PR can be merged.

### What the CI checks

| Check | Details |
|-------|---------|
| **Conceptual answers** | Non-empty, minimum word count (Normal ≥ 10, Tricky ≥ 10, Reflection ≥ 5) |
| **Hands-on commands** | Non-empty command list recorded in `YOUR_COMMANDS:` |
| **Git state validation** | For hands-on lessons, CI re-runs `setup.sh` in a temp directory, executes your commands, and verifies the resulting git state (e.g., branch rebased, merge commit exists, working tree clean) |

### CI file locations

- `.github/workflows/validate-curriculum.yml` — the GitHub Actions workflow
- `tests/validate.py` — main validation script
- `tests/checks.py` — reusable git-state check functions
- `tests/config.yml` — per-lesson validation rules

---

## Recommended Learning Order

Follow the numbering: `01-git` → `02-github` → `03-git-and-github` → `04-github-cli` → `05-ci-cd-and-automation`.

Within each module, follow the submodule numbering. Within each submodule, follow lesson order. Some lessons are marked **conceptual only** (no `setup.sh`) — these are pure Q&A to solidify understanding before hands-on work.

---

## Difficulty Legend

| Symbol | Meaning |
|--------|---------|
| ⭐ | Foundational. Must master before moving on. |
| ⭐⭐ | Intermediate. Requires solid grasp of prerequisites. |
| ⭐⭐⭐ | Advanced / Tricky. Edge cases, recovery, and real-world messes. |

---

## Table of Contents

### 01 — Git (The Engine)

| Submodule | Lessons | What You'll Master |
|-----------|---------|-------------------|
| `01-foundations` | intro-and-config, the-three-trees | What a repo is; init; config; working directory vs staging vs repository |
| `02-staging-and-commits` | staging-basics, partial-staging, amend-and-gitignore | add, status, commit, `add -p`, `--amend`, `.gitignore` |
| `03-history-and-inspection` | reading-history, diffing, blame | log, show, diff, blame |
| `04-branching-and-merging` | branches, merging, merge-conflicts | branch, switch, merge, fast-forward, conflicts |
| `05-undoing-changes` | restore-and-reset, revert-vs-reset, clean | restore, reset (soft/mixed/hard), revert, clean, ORIG_HEAD |
| `06-rebase` | rebase-basics, interactive-rebase, rebase-onto, rebase-conflicts | Rebase mechanics, interactive rebase, `--onto`, conflict resolution mid-rebase |
| `07-cherry-pick` | cherry-pick-basics, cherry-pick-conflicts | Single commits, ranges, conflicts, `-x`, `--no-commit` |
| `08-stash` | stash-basics, advanced-stash | stash/pop/apply/list/drop, stash -p, stash→branch |
| `09-reflog-and-recovery` | reflog-basics, recover-lost-work, undo-a-bad-rebase | reflog, recover lost commits/branches, undo bad rebase |
| `10-advanced` | tags, bisect, worktree-and-detached-head | Tags, bisect, worktree, detached HEAD, brief submodule intro |

### 02 — GitHub (The Platform)

| Submodule | Lessons | What You'll Master |
|-----------|---------|-------------------|
| `01-repositories` | create-a-repo, classify-and-describe | Creating repos, README, topics, linguist overrides, template repos |
| `02-forking` | fork-a-repo | What a fork is, syncing a fork |
| `03-issues` | create-and-triage-issues, issue-templates-and-forms | Issues, labels, milestones, templates, forms, task lists |
| `04-pull-requests` | open-a-pr, writing-a-pr-body, reviews-and-suggestions, merge-strategies | PRs, PR bodies (badges, checklists, closes), reviews, merge strategies |
| `05-github-features` | branch-protection, releases, dependabot | Branch protection, releases, gists, Dependabot |

### 03 — Git + GitHub (Working Together)

| Submodule | Lessons | What You'll Master |
|-----------|---------|-------------------|
| `01-remotes` | remotes-and-tracking, fetch-vs-pull, push | remote add, fetch vs pull, push, tracking branches |
| `02-feature-branch-workflow` | end-to-end-workflow | Branch → commit → push → PR → review → merge → sync |
| `03-fork-and-contribute` | fork-to-pr | Fork → clone → upstream → branch → push → PR → keep current |
| `04-remote-conflicts` | rejected-push, diverged-branches, safe-force-push | Non-fast-forward, `--force-with-lease`, diverged branches |
| `05-tricky-situations` | committed-to-main, moving-commits-to-branch, rewriting-pushed-history, recover-bad-force-push | Moving commits, rewriting history safely, recovery |

### 04 — GitHub CLI (`gh`)

| Submodule | Lessons | What You'll Master |
|-----------|---------|-------------------|
| `01-setup` | gh-auth-and-config | `gh auth login`, config, `repo set-default` |
| `02-repos` | gh-repo-ops | `gh repo create/clone/fork/view` |
| `03-pull-requests` | create-and-view, checkout-and-review, merge | `gh pr create/list/status/checkout/diff/view/review/merge` |
| `04-issues` | gh-issue-ops | `gh issue create/list/view/close/comment` |
| `05-advanced` | gh-run-release-api | Actions, releases, API, gists, labels, aliases |

### 05 — CI/CD & Automation

| Submodule | Lessons | What You'll Master |
|-----------|---------|-------------------|
| `01-actions-fundamentals` | first-workflow, triggers-and-filters, matrix-and-cache | Workflow anatomy, triggers, path/branch filters, caching, matrices |
| `02-tests-and-smoke-tests` | ci-test-job, smoke-tests, required-checks | CI test jobs, smoke tests, required status checks |
| `03-coverage-codecov` | codecov-setup, coverage-gates-and-badge | Codecov integration, gates, badges |
| `04-ai-review-coderabbit` | coderabbit-setup, tuning-and-triage | CodeRabbit config, acting on comments |
| `05-semantic-auto-classification` | path-labeler, semantic-issue-pr-classifier | Auto-labeling PRs and issues by path, title, or content |
| `06-other-tooling` | dependabot-and-codeql, codeowners-and-conventional-commits, reusable-workflows | Dependabot, CodeQL, CODEOWNERS, conventional commits, reusable workflows |

---

## File Conventions (Deep Dive)

### `README.md`
- **Intro framing** (2–4 sentences): What this lesson practices.
- **Setup**: Instructions to run `bash setup.sh` and what state it creates.
- **Your task**: Step-by-step goal for the sandbox.
- **❓ Normal question**: Conceptual or "what command…" question.
- **🔥 Tricky question**: Edge case, recovery, or "what happens if…" question.
- **✅ How to check yourself**: What the end state should look like (without giving commands).

### `ANSWERS.md`
- **Student-editable template** with empty answer fields.
- Contains the Normal and Tricky questions copied from `README.md` for easy reference.
- `YOUR_ANSWER:` markers for conceptual questions.
- `YOUR_COMMANDS:` markers for hands-on tasks (where `setup.sh` exists).
- `YOUR_REFLECTION:` marker for self-check reflection.
- **Must be filled in** before a PR can pass validation.
- Pushed to GitHub — the mentor reviews the PR.

### `setup.sh`
- Creates a `sandbox/` subfolder (gitignored) inside the lesson folder.
- Uses `git init`, scripted commits, and `git init --bare` for local remotes.
- Everything works **offline** — no GitHub account needed until the GitHub-specific modules.
- Sets `user.name` and `user.email` locally so the sandbox doesn't pollute global Git config.

---

## License & Usage

Private curriculum for mentorship. Not intended for public distribution.
