const findDBMS = require('./findDBMS');
const { exec } = require('child_process');
const path = require('path');
const os = require('os');
const fs = require('fs');

// Function to create radio buttons for detected DBMS software
function createDBMSOptions(dbmsList) {
    const dbmsContainer = document.getElementById('dbms-container');
    dbmsList.forEach(dbms => {
        const radio = document.createElement('input');
        radio.type = 'radio';
        radio.name = 'dbms';
        radio.value = dbms;
        radio.id = dbms;

        radio.addEventListener('change', () => {
            checkEnvVariable(dbms);
        });

        const label = document.createElement('label');
        label.htmlFor = dbms;
        label.textContent = dbms;

        const br = document.createElement('br');

        dbmsContainer.appendChild(radio);
        dbmsContainer.appendChild(label);
        dbmsContainer.appendChild(br);

        console.log(dbms);

    });
}


// Function to find software path
function findSoftwarePath(softwareName) {
    let path = '';
    
    if(softwareName === 'MySQL') {
        exec(`dir "\*mysql.exe*" /S`, (error, stdout, stderr) => {
            if (error || stderr) {
                console.error(error || stderr);
                alert(`Failed to find the path for ${softwareName}. Please set it manually.`);
                return;
            }
            stdout.split('\n').forEach(line => {
                if (line.includes('bin')) {
                    path = line.split(' ')[2];
                }
            });
        });
    }
    else if(softwareName === 'PostgreSQL') {
        exec(`dir "\*psql.exe*" /S`, (error, stdout, stderr) => {
            if (error || stderr) {
                console.error(error || stderr);
                alert(`Failed to find the path for ${softwareName}. Please set it manually.`);
                return;
            }
            stdout.split('\n').forEach(line => {
                if (line.includes('bin')) {
                    path = line.split(' ')[2];
                }
            });
        });

    }else if(softwareName === 'MongoDB') {
        exec(`dir "\*mongod.exe*" /S`, (error, stdout, stderr) => {
            if (error || stderr) {
                console.error(error || stderr);
                alert(`Failed to find the path for ${softwareName}. Please set it manually.`);
                return;
            }
            stdout.split('\n').forEach(line => {
                if (line.includes('bin')) {
                    path = line.split(' ')[2];
                }
            });
        });
    }
    // Add more else if statements for other software

    return path;
}

// Function to find the binary location and set it to the PATH variable
function setEnvVariable(dbms, binPath) {
    const platform = os.platform();

    const envPath = findSoftwarePath(dbms);

    console.log(envPath);

    if (platform === 'win32') {
        exec(`setx /m PATH "${envPath};%PATH%"`, (error, stdout, stderr) => {
            if (error || stderr) {
                console.error(error || stderr);
                alert(`Failed to set PATH for ${dbms}. Please set it manually.`);
                return;
            }
            alert(`PATH set successfully for ${dbms}. Please restart the application.`);
        });
    } else {
        const shellProfile = platform === 'darwin' ? '.zshrc' : '.bashrc';
        const profilePath = path.join(os.homedir(), shellProfile);
        const exportCmd = `export PATH="${envPath}:${binPath}"`;

        fs.appendFile(profilePath, `\n${exportCmd}\n`, (err) => {
            if (err) {
                alert(`Failed to set PATH for ${dbms}. Please set it manually.`);
                return;
            }
            alert(`PATH set successfully for ${dbms}. Please restart the terminal.`);
        });
    }
}

// Function to check environment variables
function checkEnvVariable(dbms) {
    let command, binPath;
    switch (dbms) {
        case 'MySQL':
            command = 'mysql --version';
            binPath = '/usr/local/mysql/bin';
            break;
        case 'PostgreSQL':
            command = 'psql --version';
            binPath = '/usr/local/pgsql/bin';
            break;
        case 'MongoDB':
            command = 'mysql --version';
            binPath = '/usr/local/bin';
            break;
        case 'SQLite':
            command = 'sqlite3 --version';
            binPath = '/usr/bin';
            break;
        case 'Oracle':
            command = 'sqlplus -version';
            binPath = '/usr/local/bin';
            break;
        case 'Microsoft SQL Server':
            command = 'sqlcmd -?';
            binPath = 'C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\130\\Tools\\Binn\\';
            break;
        default:
            console.error('Unsupported DBMS');
            return;
    }

    exec(command, (error, stdout, stderr) => {
        if (error || stderr) {
            const userResponse = confirm(`Environment variable for ${dbms} not set. Do you want to set it now?`);
            if (userResponse) {
                setEnvVariable(dbms, binPath);
            } else {
                alert(`Without setting the environment variable, the application may not work properly.`);
            }
            return;
        }
        alert(`Environment variable for ${dbms} is set.\n${stdout}`);
    });
}

module.exports = { createDBMSOptions };
