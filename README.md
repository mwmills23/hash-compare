# Hash Compare
A simple powershell utility that takes in a SHA1, SHA256, SHA384, SHA512 or MD5 hash and uses the cmdlet get-FileHash to output whether or not the hashes match. This is meant to be used for determining if hashes given from a downloaded file match the hash of that downloaded file.

The parameters consist of the path, hash type and the given hash (the default being SHA256)
Example of input:

```Powershell
C:\Users\WindowsUser\Downloads\hello-world.txt -MD5 ED076287532E86365E841E92BFC50D8C
```