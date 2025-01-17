# Python Download

## Overview
This script downloads the embedded version of Python which is smaller in size. It will also download pip along with it as the embedded version does not have one. Additionally, the script will ask the user whether to create Virtual Environment or not.

## Features
- Creates project folder
- Download and install Python
- Download and install Pip
- Creates Virtual Environment

## Prerequisites
- OS required: Windows 10, 11
- Windows PowerShell should be installed.

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/ayondeyy/download_python_with_pip.git
    ```
2. Open PowerShell and navigate to the project directory:
    ```bash
    cd download_python_with_pip
    ```

## Configuration
Before executing the script, user should know the following:

- Python version to install
- Architecture of windows (`win32` / `amd64` / `arm64`) (Default is `amd64`)
- Name of the project folder to be created
- Directory where the project folder will be created
- Whether to create virtual environment or not (Default is `yes`)
- Name of the virtual environment if `yes` is selected above (Default is `.venv`)

## Usage
Execute the script in PowerShell:
```bash
.\download_python.ps1
```

## Testing
The installation can be tested either in Command Prompt or PowerShell:

#### 1. Navigate to directory:
```bash
cd path\to\project\folder
```

#### 2. Testing Python:
```bash
[python-folder]\python.exe -V
```

#### 3. Testing Virual Environment (optional):

- In Command Prompt:
```bash
[virtual-environment-folder]\Scripts\activate.bat
```

- In Powershell:
```bash
[virtual-environment-folder]\Scripts\activate.ps1
```

To exit out of the virtual environment, type:
```bash
deactivate
```
irrespective of the terminal.

#### 4. Testing pip:

- If virutal environment is activated:
```bash
pip install numpy
```

- If virutal environment is not activated:
```bash
[python-folder]\python.exe -m pip install numpy
```

## Limitations
- This script can be run in Windows OS only. Linux and MacOS is not supported.
- Should run on PowerShell terminal. Command prompt is not supported.
- Only major Python releases are supported. For example: 3.9, 3.10, 3.11, etc. and not 3.9.1, 3.10.5, 3.11.3, etc.

## License
This project is licensed under the MIT License.

## Contact
For any questions or issues, please contact the project maintainer directly at [LinkedIn](https://www.linkedin.com/in/ayondeyy/).
