const fs = require('fs');
const path = require('path');
const marked = require('marked');
const { exec } = require('child_process');

const { findDBMS } = require('./findDBMS');
const { createDBMSOptions } = require('./checkEnvPath');

// Set options for marked

window.addEventListener('DOMContentLoaded', () => {
  const dbmsContainer = document.getElementById('dbms-container');

  const termdiv = document.querySelector("#step1 p");

  async function getfileContent() {
    try {
      const filePath = path.join(__dirname, '/Startup/termandcondition.md');
      const content = await fs.promises.readFile(filePath, 'utf8');
      console.log(content);
      termdiv.innerHTML = marked.marked(content.toString());
    } catch (error) {
      console.error('Error reading Markdown file:', error);
    }
  }

  getfileContent();

  // Find DBMS and create options
  findDBMS((error, dbmsList) => {
    if (error) {
      console.error('Error detecting DBMS software:', error);
      return;
    }
    if (dbmsList.length === 0) {
      dbmsContainer.textContent = 'No DBMS software detected.';
    } else {
      createDBMSOptions(dbmsList);
    }
  });



});