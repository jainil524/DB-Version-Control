const { execSync } = require('child_process');

// Function to create radio buttons for detected DBMS software
let result = execSync(`dir "\\*mysql.exe*" /s /b`, { encoding: 'utf8' }).toString();

console.log(result);