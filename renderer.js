const { ipcRenderer } = require('electron');

document.addEventListener('DOMContentLoaded', () => {
  showAgreementStep();
});

function showAgreementStep() {
  const container = document.getElementById('step-container');
  container.innerHTML = `
    <h2>Agreement</h2>
    <p>Please accept the terms and conditions.</p>
    <button id="accept-btn">Accept</button>
  `;

  document.getElementById('accept-btn').addEventListener('click', async () => {
    const result = await ipcRenderer.invoke('accept-agreement');
    if (result) showDatabaseSelectionStep();
  });
}

function showDatabaseSelectionStep() {
  const container = document.getElementById('step-container');
  container.innerHTML = `
    <h2>Select Database</h2>
    <p>Select the database you prefer the most.</p>
    <select id="database-select">
      <option value="db1">Database 1</option>
      <option value="db2">Database 2</option>
    </select>
    <button id="next-btn">Next</button>
  `;

  document.getElementById('next-btn').addEventListener('click', async () => {
    const db = document.getElementById('database-select').value;
    const result = await ipcRenderer.invoke('select-database', { db });
    if (result) showPathSettingStep();
  });
}

function showPathSettingStep() {
  const container = document.getElementById('step-container');
  container.innerHTML = `
    <h2>Set Path</h2>
    <p>Set the path for the selected database system.</p>
    <input type="text" id="path-input" placeholder="Enter path">
    <button id="next-btn">Next</button>
  `;

  document.getElementById('next-btn').addEventListener('click', async () => {
    const path = document.getElementById('path-input').value;
    const result = await ipcRenderer.invoke('set-path', { path });
    if (result) showAccessPrivilegesStep();
  });
}

function showAccessPrivilegesStep() {
  const container = document.getElementById('step-container');
  container.innerHTML = `
    <h2>Access Privileges</h2>
    <p>Select access privileges type.</p>
    <select id="privileges-select">
      <option value="simple">Simple</option>
      <option value="advanced">Advanced</option>
    </select>
    <button id="next-btn">Next</button>
  `;

  document.getElementById('next-btn').addEventListener('click', async () => {
    const privileges = document.getElementById('privileges-select').value;
    const result = await ipcRenderer.invoke('configure-git', { privileges });
    if (result) showGitConfigurationStep();
  });
}

function showGitConfigurationStep() {
  const container = document.getElementById('step-container');
  container.innerHTML = `
    <h2>Git Configuration</h2>
    <p>Configure Git for your project.</p>
    <button id="finish-btn">Finish</button>
  `;

  document.getElementById('finish-btn').addEventListener('click', async () => {
    const result = await ipcRenderer.invoke('configure-git');
    if (result) alert('Configuration complete!');
  });
}
