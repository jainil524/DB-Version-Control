const { exec } = require('child_process');
const os = require('os');

const TIMEOUT = 10000; // 10 seconds timeout

// Function to identify installed DBMS software
function findDBMS(callback) {
    const platform = os.platform();
    let command;

    // Choose the appropriate command based on the OS
    switch (platform) {
        case 'win32':
            command = 'wmic product get name';
            break;
        case 'linux':
            command = 'dpkg -l | grep -iE "mysql|postgresql|mongodb|sqlite|oracle|sqlserver"';
            break;
        case 'darwin':
            command = 'brew list | grep -iE "mysql|postgresql|mongodb|sqlite|oracle|sqlserver"';
            break;
        default:
            callback(new Error('Unsupported OS'));
            return;
    }

    // Execute the command with a timeout
    const execOptions = { timeout: TIMEOUT };
    exec(command, execOptions, (error, stdout, stderr) => {
        if (error) {
            callback(error);
            return;
        }
        if (stderr) {
            callback(new Error(stderr));
            return;
        }

        // Parse the output to find common DBMS software
        const dbmsSoftware = [
            'MySQL',
            'MongoDB',
            'SQLite',
            'Oracle',
            'PostgreSQL',
            'Microsoft SQL Server'
        ];

        const installedSoftware = stdout.split('\n');
        const detectedDBMS = dbmsSoftware.filter(dbms =>
            installedSoftware.some(software => software.toLowerCase().includes(dbms.toLowerCase()))
        );

        callback(null, detectedDBMS);
    });
}

module.exports = { findDBMS };
