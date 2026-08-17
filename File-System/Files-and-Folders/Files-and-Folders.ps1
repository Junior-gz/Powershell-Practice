# Creates a new file or folder
New-Item

# Copies a file or folder
Copy-Item

# Moves a file or folder
Move-Item

# Deletes a file or folder
Remove-Item

# Displays the content of a text file
Get-Content

# Renames a file or folder
Rename-Item

# Adding content with multipe lines using a Here-String
@'



Enter content



'@ | Add-Content .\Files-and-Folders.ps1
