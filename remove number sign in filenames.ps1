# Specify the directory where you want to rename files
$directory = pwd

# Get a list of all files in the specified directory and its subdirectories
$files = Get-ChildItem -Path $directory -File -Recurse

# Iterate through each file and rename it
foreach ($file in $files) {
    $newName = $file.Name -replace '#', '_'

    # Check if the new name is different from the current name
    if ($newName -ne $file.Name) {
        # Construct the new path with the updated filename
        $newPath = Join-Path -Path $file.Directory.FullName -ChildPath $newName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newName -Force
        Write-Host "Renamed $($file.FullName) to $($newPath)"
    }
}

Write-Host "File renaming completed."