# Classify and Describe Your Repository ⭐

GitHub provides powerful metadata tools to help users discover and understand your project. In this lesson you'll explore the About panel, language detection, and how to override classification with `.gitattributes`.

## Setup

This lesson is conceptual. No sandbox is required.

## Step-by-step task

1. Open any popular public repository on GitHub (for example, `torvalds/linux` or `facebook/react`).
2. Look at the **About** panel on the right side of the repo home page.
3. Note the description, website link, topics, and the language bar.
4. Read GitHub's documentation on Linguist and repository classification.
5. Imagine you are publishing your own project: write a one-sentence description and three topics you would add.

## ❓ Normal question

How do you make GitHub ignore a vendored folder for language stats?

## 🔥 Tricky question

Your repo shows as "Jupyter Notebook" when it's really Python, because of a vendored folder. Make linguist ignore it. (`.gitattributes` + `linguist-vendored`)

## ✅ How to check yourself

You can explain the purpose of the About panel, how topics improve discoverability, and how to override Linguist language detection using `.gitattributes`.
