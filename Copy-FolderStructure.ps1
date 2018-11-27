#=======================================================
# Copy-FolderStructure (by Toto)
#
# Copies all folders from the source folder, including
# the folder, to the target folder. It just copies the 
# folders, not the files contained within them.
#
# Source: The source folder.
# Target: The target folder.
#=======================================================

param(
[string]$Source,
[switch]$Target)

Copy-Item $Source $Target -Filter {PSIsContainer} -Recurse -Force