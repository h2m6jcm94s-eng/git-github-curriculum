# History and Inspection: Blame ⭐

When you need to know who last modified a line and why, `git blame` is your tool. It annotates each line of a file with the commit, author, and date of the last change.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Run `git blame poem.txt` and read the output.
3. Run `git blame -L 5,10 poem.txt` to inspect only lines 5–10.
4. Pick a commit hash from the blame output and run `git show <hash>` to see the full commit that introduced a specific line.
5. Run `git blame -e poem.txt` to see author emails instead of names.

## ❓ Normal Question

What does `git blame` do?

## 🔥 Tricky Question

A line was changed in a commit that only reformatted code (e.g., ran a linter). `git blame` points to the reformat commit, not the original author of the logic. How do you find the original author of the logic?

## ✅ How to Check Yourself

- `git blame poem.txt` shows each line prefixed with commit hash, author, and date.
- `git blame -L 5,10 poem.txt` limits output to lines 5–10.
- `git show <hash>` reveals the commit message and diff for the line's last modification.
- `git blame -e` displays email addresses.
