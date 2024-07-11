const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');

function createWindow () {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: true,
      contextIsolation: false
    }
  });

  win.loadFile('index.html');
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

// Handle IPC requests here
ipcMain.handle('accept-agreement', async (event, args) => {
  // Handle acceptance of terms and conditions
  return true;
});

ipcMain.handle('select-database', async (event, args) => {
  // Handle database selection
  return true;
});

ipcMain.handle('set-path', async (event, args) => {
  // Handle path setting
  return true;
});

ipcMain.handle('configure-git', async (event, args) => {
  // Handle Git configuration
  return true;
});
