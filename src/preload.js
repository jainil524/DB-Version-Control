const fs = require('fs');
const path = require('path');
const marked = require('marked');

// Set options for marked

window.addEventListener('DOMContentLoaded', () => {
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
});
