
# Python Installer (Windows)

This project provides a simple **batch script** to check if Python is installed on Windows and, if not, automatically download and install it silently.

## 🚀 Features
- Checks if Python is already installed.
- Downloads the latest specified Python version if missing.
- Uses `curl` or falls back to PowerShell for downloading.
- Installs Python silently with:
  - `InstallAllUsers=1`
  - `PrependPath=1` (adds Python to PATH)
  - `Include_test=0` (excludes test files)
- Verifies installation after setup.

## 📦 Requirements
- Windows 10 or later
- Internet connection
- `curl` (optional, script falls back to PowerShell)

## 🔧 Usage

1. Clone this repository or download the script:
   ```bash
   https://github.com/RecepKarayigit/python-windows-installer.git
   ```

2. Run the script:
   ```bat
   install_python.bat
   ```

3. Follow the on-screen instructions.

## 📝 License
This project is licensed under the [MIT License](LICENSE).
