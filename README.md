# PowerShell Practice

This repository is tracking my progress as I learn PowerShell and improve my Windows/IT administration skills.

I'm using this repo to save commands I've learned, organize PowerShell references, build practice scripts, and eventually create more advanced automation and administration scripts.

# Goals

- Learn PowerShell fundamentals
- Become comfortable working from the command line
- Improve my Windows administration skills
- Learn how PowerShell can be used for IT and system administration
- Practice writing and running `.ps1` scripts
- Learn Git and GitHub while tracking my progress
- Build PowerShell scripts that automate common tasks

## Repository Structure

My PowerShell practice is organized into different topics.

```text
PowerShell-Practice/
│
├── File-System/
│   └── Navigation/
│       └── Navigation.ps1
│
├── Environment/
├── Links/
├── System/
├── Labs/
└── README.md
```

Folders and scripts will be added as I continue learning.

## Current Topics

I'm currently working on PowerShell fundamentals such as:

- Navigating the Windows file system
- Creating and managing files and folders
- Reading and modifying file contents
- PowerShell parameters
- Environment variables
- PATH
- NTFS permissions and ownership
- Junctions and symbolic links
- Windows Registry
- PowerShell scripting

## How I'm Using This Repository

When I learn and practice a new PowerShell command, I add it to the appropriate reference file along with comments explaining what the command does.

Example:

```powershell
# Shows the directory I am currently in
Get-Location

# Lists files and folders in the current directory
Get-ChildItem

# Changes the current directory
Set-Location C:\

# Tests whether a path exists
Test-Path C:\Lab
```

As I progress, I want to move beyond individual commands and create complete PowerShell scripts and labs that combine multiple commands to create real IT tasks.

## Progress

This is an ongoing learning repository, so scripts and documentation will continue to change as my PowerShell knowledge grows.
