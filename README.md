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
- Includes **timestamps** for each event
- Easy to configure with minimal setup

---

## Prerequisites

- **Git** installed on your machine
- **Git Bash** installed on Windows (recommended for full functionality)
- A **Discord webhook URL** for your channel

---

## Setup Instructions

### 1. Clone the repository

Clone the repository to your local machine:

```bash
git clone https://your-repository-url.git
cd your-repository-name
```

### 2. Create the `githooks` directory

In the root of your repository, create a `githooks` directory to store the custom Git hooks:

```bash
mkdir githooks
```

### 3. Add the hook scripts

Create the following hook scripts inside the `githooks` directory:

#### `post-merge`:
```bash
#!/bin/bash

# Get current Git user name and branch
username=$(git config user.name)
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Get timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Your Discord webhook URL
webhook_url="https://discord.com/api/webhooks/YOUR_WEBHOOK_URL_HERE"

# Format the message with timestamp
message="🛠️ $username just pulled and merged into \`$branch_name\` branch at $timestamp."

# Send the webhook depending on OS
if [[ "$OS" == "Windows_NT" ]]; then
  # Windows (Git Bash)
  curl.exe -H "Content-Type: application/json" ^
           -X POST ^
           -d "{\"content\": \"$message\"}" ^
           "$webhook_url"
else
  # macOS / Linux
  curl -H "Content-Type: application/json" \
       -X POST \
       -d "{\"content\": \"$message\"}" \
       "$webhook_url"
fi
```

#### `post-commit`:
```bash
#!/bin/bash

# Get current Git user name and branch
username=$(git config user.name)
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Get timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Your Discord webhook URL
webhook_url="https://discord.com/api/webhooks/YOUR_WEBHOOK_URL_HERE"

# Format the message with timestamp
message="💬 $username committed to the \`$branch_name\` branch at $timestamp."

# Send the webhook depending on OS
if [[ "$OS" == "Windows_NT" ]]; then
  # Windows (Git Bash)
  curl.exe -H "Content-Type: application/json" ^
           -X POST ^
           -d "{\"content\": \"$message\"}" ^
           "$webhook_url"
else
  # macOS / Linux
  curl -H "Content-Type: application/json" \
       -X POST \
       -d "{\"content\": \"$message\"}" \
       "$webhook_url"
fi
```

#### `post-checkout`:
```bash
#!/bin/bash

# Get current Git user name and branch
username=$(git config user.name)
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Get timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Your Discord webhook URL
webhook_url="https://discord.com/api/webhooks/YOUR_WEBHOOK_URL_HERE"

# Format the message with timestamp
message="🔄 $username checked out the \`$branch_name\` branch at $timestamp."

# Send the webhook depending on OS
if [[ "$OS" == "Windows_NT" ]]; then
  # Windows (Git Bash)
  curl.exe -H "Content-Type: application/json" ^
           -X POST ^
           -d "{\"content\": \"$message\"}" ^
           "$webhook_url"
else
  # macOS / Linux
  curl -H "Content-Type: application/json" \
       -X POST \
       -d "{\"content\": \"$message\"}" \
       "$webhook_url"
fi
```

### 4. Make the scripts executable

Ensure the scripts are executable:

```bash
chmod +x githooks/post-merge
chmod +x githooks/post-commit
chmod +x githooks/post-checkout
```

### 5. Configure Git to use the `githooks` directory

Set the custom hooks directory for Git:

```bash
git config core.hooksPath githooks
```

---

## Customizing the Webhook URL

In each script, replace the placeholder `YOUR_WEBHOOK_URL_HERE` with the actual Discord webhook URL for your channel. You can create a webhook URL by following these steps:

1. Go to your Discord server.
2. Click on the channel settings (gear icon) and select "Integrations."
3. Under "Webhooks," click "Create Webhook" and copy the webhook URL.

---

## Usage

Once set up, the following notifications will be sent to Discord:

- **`post-commit`**: When a commit is made, a notification will be sent with the username, branch, and timestamp.
- **`post-merge`**: When a merge is pulled, a notification will be sent with the username, branch, and timestamp.
- **`post-checkout`**: When a branch is checked out, a notification will be sent with the username, branch, and timestamp.

---

## Example Notifications

**`post-commit`**:
```
💬 Alice committed to the `master` branch at 2025-04-19 18:30:45.
```

**`post-merge`**:
```
🛠️ Bob just pulled and merged into `feature-xyz` branch at 2025-04-19 18:32:10.
```

**`post-checkout`**:
```
🔄 Charlie checked out the `develop` branch at 2025-04-19 18:35:20.
```

---

## Troubleshooting

1. **Webhook not sending?**
   - Check if the `curl` command works from your terminal by running it directly.
   - Ensure that the webhook URL is correctly set.

2. **Windows Users:**
   - Ensure that your team is using **Git Bash** for the hooks to work correctly.
   - If needed, install Git Bash from [Git for Windows](https://git-scm.com/).

---

Feel free to tweak or extend this README as per your needs!
