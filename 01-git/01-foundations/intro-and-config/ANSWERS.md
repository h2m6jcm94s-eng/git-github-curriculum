# Student Answers: Intro And Config

> **Instructions:** Fill in your answers below. Do not delete the `YOUR_ANSWER_NORMAL:`, `YOUR_ANSWER_TRICKY:`, or `YOUR_COMMANDS:` markers — the validator looks for them.

---

## Normal Question

What's the difference between `--global` and `--local` configuration in Git?

YOUR_ANSWER_NORMAL: 
<!-- Write your answer here (minimum 10 words). Be specific and explain your reasoning. -->
global has one identity and can be overridden also all the changes made here will be applied to any branch/config under it
local is like if any change is made to it, will only apply to that particular identity

--global config is stored once per computer in your home folder and applies to every repository by default. --local config is stored inside a single repository's .git folder and only applies there, and it overrides the global value for that repo.

---

## Tricky Question

You set `user.name` globally, but one specific repository shows a different author in its commits. What happened, and how would you check?

YOUR_ANSWER_TRICKY:
<!-- Write your answer here (minimum 10 words). Explain edge cases or consequences. -->
git config --show-origin-list 

That repository has its own --local user.name that overrides the global one. I would check it by running git config --local user.name inside that repo, or git config --list --show-origin to see which file each value comes from.
---

## Hands-on Task

YOUR_COMMANDS:
<!-- Record the exact commands you ran to complete the task, one per line. Lines starting with # are ignored. -->
# cd sandbox/
# [your commands here]

---

## Self-Check Reflection

YOUR_REFLECTION:
<!-- What did you learn? What surprised you? What will you do differently? (minimum 5 words) -->
I learned that Git identity can be set per-repository, so the same machine can commit as different authors in different projects.