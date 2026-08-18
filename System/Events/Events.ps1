# =====================================================================
# EVENT VIEWER - POWERSHELL REFERENCE
# Phase 1 - Windows Power User Path
# =====================================================================
# This file collects the Get-WinEvent commands used while practicing
# Event Viewer, with explanations of what each one does and why.
# =====================================================================


# ---------------------------------------------------------------------
# 1. GET RECENT EVENTS FROM A SPECIFIC LOG
# ---------------------------------------------------------------------
# Pulls the most recent entries from the System log.
# -MaxEvents caps how many results come back (newest first).
Get-WinEvent -LogName System -MaxEvents 20


# ---------------------------------------------------------------------
# 2. FILTER TO ONLY ERRORS FROM A LOG
# ---------------------------------------------------------------------
# Pulls everything from System, then pipes into Where-Object to keep
# only entries whose LevelDisplayName equals "Error".
# This filters AFTER retrieving all data (slower on huge logs).
Get-WinEvent -LogName System | Where-Object {$_.LevelDisplayName -eq "Error"}


# ---------------------------------------------------------------------
# 3. FILTER BY SPECIFIC EVENT ID (FAST METHOD)
# ---------------------------------------------------------------------
# -FilterHashtable filters AT THE SOURCE before the data is even
# pulled from the log, so it's much faster than Where-Object filtering.
#   LogName = which log to search
#   Id      = the specific Event ID to match
Get-WinEvent -FilterHashtable @{LogName='System'; Id=7036}


# ---------------------------------------------------------------------
# 4. FILTER BY EVENT ID + KEYWORD IN MESSAGE
# ---------------------------------------------------------------------
# Combines a fast FilterHashtable (Event ID 7036 = service state change)
# with a Where-Object pass afterward to narrow down by keyword.
# -like "*Spooler*" means "contains the word Spooler anywhere" (the *
# characters are wildcards).
Get-WinEvent -FilterHashtable @{LogName='System'; Id=7036} -MaxEvents 20 |
    Where-Object {$_.Message -like "*Spooler*"}


# ---------------------------------------------------------------------
# 5. SHOW ONLY SPECIFIC FIELDS, READABLE FORMAT
# ---------------------------------------------------------------------
# Select-Object picks only the properties you want to see.
# Format-List stacks them vertically instead of a cramped table,
# which is useful when Message text is long.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=7036} -MaxEvents 20 |
    Where-Object {$_.Message -like "*Spooler*"} |
    Select-Object TimeCreated, Message | Format-List


# ---------------------------------------------------------------------
# 6. BROAD HEALTH CHECK ACROSS MULTIPLE LOGS (Admin Events equivalent)
# ---------------------------------------------------------------------
# LogName can take multiple logs at once (comma-separated).
# Level numbers: 1 = Critical, 2 = Error, 3 = Warning.
# This mimics the built-in "Administrative Events" custom view in the
# eventvwr.msc GUI, but from PowerShell.
Get-WinEvent -FilterHashtable @{LogName='System','Application'; Level=1,2,3} -MaxEvents 20


# ---------------------------------------------------------------------
# 7. CHECK HOW OFTEN A SPECIFIC ERROR HAS HAPPENED (frequency check)
# ---------------------------------------------------------------------
# Frequency is the real signal for whether an error matters.
# One-off = usually safe to ignore. Recurring = worth investigating.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=7031} |
    Where-Object {$_.Message -like "*SGX*"} |
    Select-Object TimeCreated


# ---------------------------------------------------------------------
# 8. DISCOVER WHAT PROPERTIES ARE AVAILABLE ON AN EVENT OBJECT
# ---------------------------------------------------------------------
# Get-Member lists every property/method on the object PowerShell
# just gave you. Useful anytime you don't know a field's exact name
# instead of guessing or switching to the GUI.
# (This is how "Source" in the GUI was found to be "ProviderName" here.)
Get-WinEvent -FilterHashtable @{LogName='System'; Id=20} | Get-Member


# ---------------------------------------------------------------------
# 9. SHOW EVENT SOURCE (ProviderName) ALONGSIDE OTHER FIELDS
# ---------------------------------------------------------------------
# ProviderName = what the eventvwr.msc GUI calls "Source".
# LevelDisplayName = readable severity (Error/Warning/Info) instead
# of just a raw number.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=20} |
    Select-Object TimeCreated, Id, ProviderName, LevelDisplayName, Message


# ---------------------------------------------------------------------
# 10. FILTER BY EVENT ID + EXACT PROVIDER NAME (multi-condition filter)
# ---------------------------------------------------------------------
# FilterHashtable can stack multiple conditions together - all must
# match. This narrows results to ONLY Windows Update Client errors
# with Event ID 20, cutting out unrelated ID-20 entries from other
# sources.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=20; ProviderName='Microsoft-Windows-WindowsUpdateClient'} |
    Select-Object TimeCreated, Message | Format-List


# ---------------------------------------------------------------------
# 11. GET THE EXACT PROVIDER NAME STRING (avoid typos when filtering)
# ---------------------------------------------------------------------
# -ExpandProperty pulls just the raw value of one property (no table
# formatting around it). Useful to copy/paste an exact provider name
# rather than retyping it and risking a mismatch.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=20} |
    Select-Object -First 1 -ExpandProperty ProviderName


# ---------------------------------------------------------------------
# 12. CHECK FOR THE SUCCESS COUNTERPART TO A FAILURE EVENT ID
# ---------------------------------------------------------------------
# Event ID 19 = Windows Update installed successfully (the success
# counterpart to ID 20 failures). Comparing timestamps between a
# failure and a later success is how you prove an error self-resolved
# instead of just assuming it did.
Get-WinEvent -FilterHashtable @{LogName='System'; Id=19; ProviderName='Microsoft-Windows-WindowsUpdateClient'} |
    Select-Object TimeCreated, Message | Format-List


# =====================================================================
# QUICK REFERENCE - KEY EVENT IDs SEEN DURING PRACTICE
# =====================================================================
# 7036  - Service entered running/stopped state (System log)
# 7031  - Service terminated unexpectedly + recovery action taken
# 41    - Kernel-Power event, unexpected shutdown/crash (not covered
#         hands-on yet, but common to know)
# 20    - Windows Update Client: update/driver install failure
# 19    - Windows Update Client: update installed successfully
# 6005/6006 - Event log service started/stopped (system boot/shutdown)
# =====================================================================