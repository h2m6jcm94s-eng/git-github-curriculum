# Advanced: Tags ⭐⭐

Tags mark specific points in history as important. They're commonly used for version releases (v1.0.0, v2.0.0). Understanding the difference between lightweight and annotated tags ensures you use the right tool for the right occasion.

## Setup

Run the setup script to create your practice environment:

```bash
bash setup.sh
```

## Task

1. Navigate into `sandbox/`.
2. Create a **lightweight** tag `v1.0` pointing to the current commit.
3. Create an **annotated** tag `v1.1` with a message.
4. List all tags with `git tag`.
5. Show the details of the annotated tag with `git show v1.1`.
6. Show the lightweight tag with `git show v1.0`.
7. Notice the difference in output.

## ❓ Normal Question

What's the difference between a lightweight tag and an annotated tag?

## 🔥 Tricky Question

You tagged a commit, then amended it. Why does the tag now point to "nothing" in `git log`?

## ✅ How to Check Yourself

- `git tag` lists both `v1.0` and `v1.1`.
- `git show v1.1` displays the tag message, tagger name, date, and commit.
- `git show v1.0` displays only the commit information.
- `git tag -n` shows tag names with their messages (for annotated tags).
