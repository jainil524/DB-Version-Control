# DB Version Control

DB Version Control is an Electron-based application designed to help you manage and version control your database schema and records efficiently.

## Features

- View commit history and changes
- Browse and manage database structures and records
- Install and configure easily with an intuitive user interface

## Installation

### Prerequisites

- [Node.js](https://nodejs.org/) (v12 or higher)
- [Git](https://git-scm.com/)
- [Python](https://www.python.org/) (v3.x)

### Setting Up the Development Environment

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/db-version-control.git
    cd db-version-control
    ```

2. Install dependencies:

    ```bash
    npm install
    ```

### Running the Application

To start the application in development mode:

### Building the Application
- To build the application for different platforms:

    1) Windows:

        npm run dist
        This will generate an .exe installer in the dist directory.

    2) macOS:

        npm run dist
        This will generate a .dmg file in the dist directory.

    3) Linux:

        For AppImage:

        npm run dist
        This will generate an .AppImage file in the dist directory.

    4) For DEB:

        npm run dist
        This will generate a .deb file in the dist directory.

## Installation Instructions
    1) Windows
        Locate the .exe installer in the dist directory.
        Double-click the .exe file to start the installation process.
        Follow the installation wizard to complete the setup.
        Launch the application from the Start Menu or Desktop shortcut.
    2) macOS
        Locate the .dmg file in the dist directory.
        Double-click the .dmg file to mount it.
        Drag the application icon to the Applications folder.
        Launch the application from the Applications folder.
    3) Linux
        AppImage
        Locate the .AppImage file in the dist directory.

### Make it executable:

    chmod +x your-app-name.AppImage

### Run the AppImage:

    ./your-app-name.AppImage
    DEB Package (Debian/Ubuntu)
    Locate the .deb file in the dist directory.

### Install the DEB package:

    sudo dpkg -i your-app-name.deb
    Fix any missing dependencies:

    sudo apt-get install -f
    Launch the application from the application menu.

## User Guide
    1) Initial Setup
    2) Sign Agreement: Sign the agreement of terms and conditions and privacy policy.
    3) Select Database: Choose the databases you prefer the most from the installed ones.
    4) Set Path: Set the path for the selected database system to be accessed globally.
    5) Configure Access Privileges:
    6) Simple: Use admin, user ID, and password.
    7) Custom/Advanced: Create a new user with permissions, and provide a username and password.