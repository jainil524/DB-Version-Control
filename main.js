const { app, BrowserWindow, dialog } = require('electron');
const path = require('path');
const sudo = require('sudo-prompt');
const os = require('os');

function createWindow() {
  console.log('Creating window');
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'src/preload.js'),
      nodeIntegration: true,
      contextIsolation: true,
      devTools: false,
    },
  });

  win.loadFile('src/index.html');
}

app.whenReady().then(() => {
  if (!isAdmin()) {
    requestAdminPrivileges();
  } else {
    createWindow();
  }
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

function isAdmin() {
  if (os.platform() === 'win32') {
    const cp = require('child_process');
    try {
      cp.execSync('net session', { stdio: 'ignore' });
      return true;
    } catch (e) {
      return false;
    }
  } else {
    return process.getuid && process.getuid() === 0;
  }
}

function requestAdminPrivileges() {
  const options = {
    name: 'DB Version Control',
    icns: '/path/to/icns' // For MacOS
  };

  sudo.exec(`"${process.execPath}" "${process.argv.slice(1).join('" "')}"`, options, (error, stdout, stderr) => {
    if (error) {
      dialog.showErrorBox('Elevation Error', 'Failed to obtain admin privileges');
      app.quit();
    }
  });
}
