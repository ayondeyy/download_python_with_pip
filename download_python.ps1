# This script downloads and installs Python along with pip on Windows. It also creates a virtual environment if required.

$ver = Read-Host "Enter Python Version (in x.x format)"
$arch = Read-Host "Enter Python Architecture [win32 / amd64 / arm64 (Default: amd64)]"
$proj_name = Read-Host "Enter Project Name"
$path = Read-Host "Enter Path to create the project"
$env_req = Read-Host "Do you want to create Virtual Environment? [y/n (Default: y)]"

# Set default values if not provided
if (-not $env_req) {
    $env_req = "y"
}

if ($env_req -eq "y") {
    $env = Read-Host "Enter Name of Virtual Environment (Default: .venv)"
}

# Set default values if not provided
if (-not $arch) {
    $arch = "amd64"
}
if (-not $env) {
    $env = ".venv"
}

# Create variables, download URL and file names
$cur_dir = $pwd
$pip_ver = $ver
$py_ver = $ver + ".0"
$python_url = "https://www.python.org/ftp/python/$py_ver/python-$py_ver-embed-$arch.zip"
$zip_file = "python-$py_ver-embed-$arch.zip"
$py_name = "python-$py_ver-embed-$arch"
$python_dir = "$path\$proj_name"

# Create the directory if it does not exist
if (-not (Test-Path $python_dir)) {
    New-Item -Path $python_dir -ItemType Directory
}
Set-Location $python_dir

# Download Python
Write-Host "`nDownloading and Installing Python`n"
Invoke-WebRequest -Uri $python_url -OutFile $zip_file

# Extract the archive
Expand-Archive -Path $zip_file -DestinationPath "$python_dir\$py_name"

# Rename the ._pth file to .pth
$append_ver = $ver -split "\." -join ""
Move-Item -Path $py_name\python$append_ver._pth -Destination $py_name\python$append_ver.pth

# Download & install pip
Set-Location $py_name

Write-Host "`nDownloading and Installing pip`n"
try {
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/pip/$pip_ver/get-pip.py" -OutFile "get-pip.py"
}
catch {
    Write-Host "`nCouldn't find the specific version of pip. Downloading the latest version`n"
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/pip/get-pip.py" -OutFile "get-pip.py"
}

.\python.exe get-pip.py --no-warn-script-location

# Remove the downloaded files
Remove-Item get-pip.py
Remove-Item ..\$zip_file

# Install virtualenv if required
if ($env_req -eq "y") {
    Write-Host "`nCreating virtual environment`n"
    .\python.exe -m pip install virtualenv --no-warn-script-location
    .\python.exe -m virtualenv ..\$env
    Copy-Item -Path .\python$append_ver.zip -Destination ..\$env\Scripts\
}

Set-Location $cur_dir

Write-Host "`nPython $ver ($arch) has been installed in $python_dir"
if ($env_req -eq "y") {
    Write-Host "`nVirtual environment '$env' has been created in $path\$proj_name\$env"
}
