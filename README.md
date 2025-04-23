Here is your updated `README.md` with all the requested changes applied:

---

```markdown
# Git Hooks with Discord Notifications

This repository includes custom Git hooks for notifying team members via **Discord** whenever certain Git events occur. It includes hooks for:

- `post-merge` (when a merge happens)
- `post-commit` (when a commit is made)
- `post-checkout` (when a branch is checked out)

Each of these hooks sends a notification to a Discord channel, including the user's name, the branch name, and a timestamp.

---

## Features

- **Cross-platform** support for both **macOS/Linux** and **Windows** (using Git Bash)
- **Real-time notifications** on **commit**, **merge**, and **checkout** events
- Includes **timestamps** in `dd-mm-yyyy HH:MM:SS` format
- Easy to configure with minimal setup

---

## Prerequisites

- **Git** installed on your machine
- **Git Bash** installed on Windows (required for proper script execution)
- A **Discord webhook URL** for your channel

---

## Setup Instructions

### 1. Clone the repository

Clone the repository to your local machine:

```bash
git clone https://github.com/Lennyy-y/simple-discord-git-hook.git
cd simple-discord-git-hook
```

### 2. Place the installation script and `githooks` directory at the root of your repository

In the root of your repository, copy the `githooks` directory and the install script (if needed).

### 3. Make the scripts executable

Ensure the scripts are executable (on macOS/Linux or Git Bash):

```bash
chmod +x githooks/post-merge
chmod +x githooks/post-commit
chmod +x githooks/post-checkout
```

### 4. Configure Git to use the `githooks` directory

Set the custom hooks directory for Git:

```bash
git config core.hooksPath githooks
```

---

## How to Create a Discord Webhook

To send notifications to a Discord channel, you need a **Discord webhook URL**. Follow these steps to create one:

1. Open Discord and navigate to your server.
2. Choose the channel where you want the notifications to appear.
3. Click on the **channel settings** (gear icon next to the channel name).
4. In the settings menu, click on **Integrations**.
5. Under the **Webhooks** section, click **Create Webhook**.
6. Give the webhook a name and select the channel where you want the messages to appear.
7. Copy the webhook URL.

Once you have the webhook URL, replace `YOUR_WEBHOOK_URL_HERE` in the `post-merge`, `post-commit`, and `post-checkout` scripts with the copied URL.

---

## Usage

Once set up, the following notifications will be sent to Discord:

- **`post-commit`**: When a commit is made, a notification will be sent with the username, branch, and timestamp.
- **`post-merge`**: When a merge is pulled, a notification will be sent with the username, branch, and timestamp.
- **`post-checkout`**: When a branch is checked out, a notification will be sent with the username, branch, and timestamp.

---

## Example Notifications

```
[19-04-2025 18:30:45] Alice committed to `master`
[19-04-2025 18:32:10] Bob just merged into `feature-xyz`
[19-04-2025 18:35:20] Charlie checked out to `develop`
```

---

## Windows: Set IntelliJ to Use Git Bash

If you're on Windows, Git hooks will **only work** if Git operations run through **Git Bash**, not the built-in JGit engine. Here’s how to set it up in IntelliJ:

1. Open **IntelliJ IDEA** → `File` → `Settings` (or `Ctrl+Alt+S`)
2. Go to: `Version Control` → `Git`
3. Set **Path to Git executable** to:
   ```
   C:\Program Files\Git\bin\git.exe
   ```
4. Click **Test** to confirm it's working
5. Make sure **“Use credential helper”** is checked (optional)
6. Click **OK**

From now on, all Git operations in IntelliJ will go through your system Git, enabling hooks like `post-merge`, `post-commit`, and `post-checkout`.

---

## Troubleshooting

1. **Webhook not sending?**
   - Test your `curl` command manually with a sample message.
   - Ensure your `post-*` script has the correct webhook URL.
   - Make sure you're executing Git commands that trigger the hooks (`merge`, `commit`, `checkout`).

2. **Hooks not triggering on Windows?**
   - Make sure you're using **Git Bash**, not PowerShell or Command Prompt.
   - Ensure IntelliJ is configured to use the correct Git executable (`git.exe` from Git for Windows).
   - Check script permissions and ensure no file extensions like `.sh` or `.txt`.

---

Now your team can stay updated in real-time on **commit**, **merge**, and **checkout** events, all via **Discord**!
```
