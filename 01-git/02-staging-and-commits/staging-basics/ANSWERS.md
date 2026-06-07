# Student Answers: Staging Basics

> **Instructions:** Fill in your answers below. Do not delete the `YOUR_ANSWER_NORMAL:`, `YOUR_ANSWER_TRICKY:`, or `YOUR_COMMANDS:` markers — the validator looks for them.

---

## Normal Question

What's the difference between a tracked file and an untracked file in Git?

YOUR_ANSWER_NORMAL:
A tracked file is one Git already knows about because it has been added to the index or committed at least once, so Git records its changes. An untracked file is new on disk and Git ignores it until you stage it with git add.

---

## Tricky Question

You staged a file, then edited it again before committing. `git status` shows it in both areas. What gets committed if you run `git commit` right now? What single flag can you add to `git commit` to also include the new edits in the same commit?

YOUR_ANSWER_TRICKY:
Only the snapshot you staged with git add gets committed; the later edits stay in the working tree and are left out. Adding the -a flag (git commit -a) stages and commits the new edits to already-tracked files in the same commit.

---

## Hands-on Task

YOUR_COMMANDS:
<!-- Record the exact commands you ran to complete the task, one per line. Lines starting with # are ignored. -->
# cd sandbox/
echo "Some notes" > notes.txt
git add notes.txt
echo "More notes after staging" >> notes.txt
git commit -m "Add notes"
git commit -am "Add remaining notes"

---

## Self-Check Reflection

YOUR_REFLECTION:
I learned that staging captures a snapshot at that exact moment, so edits made after git add are not included until I stage again or use commit -a.
