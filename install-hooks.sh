#!/bin/bash

echo "Setting up Git hooks from .githooks/..."

# Configure local Git to use the custom hooks path
git config core.hooksPath githooks

# Make sure all hooks are executable
chmod +x githooks/*

echo "Git hooks installed successfully."
