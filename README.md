# Python Download

## Overview
This script downloads the isolated version of Python which is smaller in size without interfering the global installation. The downloaded Python can be used on per project basis. Additionally, the script will ask the user whether to create Virtual Environment or not.

## Features
- Creates project folder
- Download and install Python
- Download and install Pip
- Creates Virtual Environment

## Prerequisites
- OS required: Windows 10, 11, Unix (Note: At this time, the script has been tested only on Debian based Linux. Feel free to try it out on other distributions and MacOS)
- For Windows, Windows PowerShell and git should be installed. For Unix, git, wget and tar should be installed.

## Installation
For Windows users, open Powershell, and For Unix users, open Terminal, and type:
1. Clone the repository:
    ```bash
    git clone https://github.com/ayondeyy/download_python_with_pip.git
    ```
2. Navigate to the project directory:
    ```bash
    cd download_python_with_pip
    ```

## Information Required
Before executing the script, user should know the following:

- Python version to install.
- Architecture of windows (`win32` / `amd64` / `arm64`) (Default is `amd64`). For Unix users, the architecture will not be asked.
- Name of the project folder to be created.
- Directory where the project folder will be created.
- Whether to create virtual environment or not (Default is `yes`).
- Name of the virtual environment if `yes` is selected above (Default is `.venv`).

## Usage
- For Windows: Execute the script in PowerShell:
    ```bash
    .\download_python.ps1
    ```
- For Unix: Execute the script in Terminal:
    ```bash
    ./download_python.sh
    ```

## Testing
The installation can be tested by:

#### 1. Navigating to directory:
- For Windows:
    ```bash
    cd path\to\project\folder
    ```
- For Unix:
    ```bash
    cd path/to/project/folder
    ```

#### 2. Testing Python:
- For Windows:
    ```bash
    [project-folder\python-folder]\python.exe -V
    ```
- For Unix:
    ```bash
    [project-folder]/Python/bin/python -V
    ```

#### 3. Testing Virual Environment (optional):
- For Windows:
    - In Command Prompt:
        ```bash
        [project-folder\virtual-environment-folder]\Scripts\activate.bat
        ```

    - In Powershell:
        ```bash
        [project-folder\virtual-environment-folder]\Scripts\activate.ps1
        ```

- For Unix:
    ```bash
    [project-folder/virtual-environment-folder]/scripts/activate
    ```

To exit out of the virtual environment, type:
```bash
deactivate
```
irrespective of the OS.

#### 4. Testing pip:

- If virutal environment is activated:
```bash
pip install numpy
```

- If virutal environment is not activated:
    - For Windows:
        ```bash
        [project-folder\python-folder]\python.exe -m pip install numpy
        ```
    - For Unix:
        ```bash
        [project-folder]/Python/bin/python -m pip install numpy
        ```

## Limitations
- At this time, the script has been tested only on Debian based Linux.
- Windows users should run the script on PowerShell terminal. Command prompt is not supported.
- For windows, only major Python releases are supported. For example: 3.9, 3.10, 3.11, etc. and not 3.9.1, 3.10.5, 3.11.3, etc.

## License
This project is licensed under the MIT License.

## Contact
For any questions or issues, please contact the project maintainer directly at [LinkedIn](https://www.linkedin.com/in/ayondeyy/).
