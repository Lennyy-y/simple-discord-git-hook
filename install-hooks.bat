@echo off
echo Setting up Git hooks from githooks\...

REM Set the hooks path to use the shared githooks folder
git config core.hooksPath githooks

echo Git hooks installed successfully!
pause
