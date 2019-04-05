# Take in parameters
param (
    [string]$path, # File to be hashed
    # Hash type
    [switch]$SHA256, 
    [switch]$MD5,
    [switch]$SHA1,
    [switch]$SHA384,
    [switch]$SHA512,
    [string]$hash # Hash provided for compare
)

# Determine which flag was used
if ($SHA256) {
    $hashType = "SHA256"
} elseif ($MD5) {
    $hashType = "MD5"
} elseif ($SHA384) {
    $hashType = "SHA384"
} elseif ($SHA512) {
    $hashType = "SHA512"
} else {
    # Default to SHA256
    $hashType = "SHA256"
}

# If hash is null write an error
if (!($hash) -or !($path)) {
    Write-Host "No comparison hash or path was provided" -ForegroundColor Red
} else {
    # Else, Hash the file with the specified Algorithm
    $output = Get-FileHash $path -Algorithm $hashType

    # Check to see if the hashes match and provide appropriate message
    if ($output.Hash -eq $hash) {
        Write-Host "The $($hashtype) hashes match" -ForegroundColor Green
    } else {
        Write-Host "WARNING: HASHES DO NOT MATCH" -ForegroundColor Red
    }
}
