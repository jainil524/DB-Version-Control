const { exec } = require('child_process');

// Define the command
const command = 'cmd /c dir "C:\\Program Files\\*mysql.exe*" /s /B';

// Execute the command
exec(command, (error, stdout, stderr) => {
  if (error) {
    console.error(`Error executing command: ${error.message}`);
    return;
  }
  
  if (stderr) {
    console.error(`Standard error output: ${stderr}`);
    return;
  }

  // Process the output
  const outputLines = stdout.split('\r\n').filter(line => line.trim() !== '');
  
  // Example: Log each found file
  outputLines.forEach(file => {
    console.log(`Found file: ${file}`);
  });

  // You can also use the output for other purposes
  // Example: Store output in a variable
  const commandOutput = outputLines.join('\n');
  
  // Do something with commandOutput
  console.log(`Processed output:\n${commandOutput}`);
});
