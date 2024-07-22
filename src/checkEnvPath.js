const { execSync,exec } = require('child_process');
const os = require('os');

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
    let stdout;
    if (softwareName === 'MySQL') {
        stdout = execSync('dir "\*mysql.exe*" /s /B', { encoding: 'utf8' });
    } else if (softwareName === 'PostgreSQL') {
        stdout = execSync('dir "\*psql.exe* /s /B', { encoding: 'utf8' });
    } else if (softwareName === 'MongoDB') {
        stdout = execSync('dir "\*mongod.exe*" /s /B', { encoding: 'utf8' });
    } else {
        throw new Error(`Unsupported software: ${softwareName}`);
    }

    try {
        let path = '';

        stdout.split('\n').forEach(line => {
            if (line.includes('bin')) {
                path = line.split(' ')[2];
            }
        });

        if (path) {
            return path;
        } else {
            throw new Error(`Path not found for ${softwareName}`);
        }
    } catch (error) {
        console.error(error);
        throw new Error(`Failed to find the path for ${softwareName}. ${error.message}`);
    }
}

// Function to find the binary location and set it to the PATH variable
function setEnvVariable(dbms) {
    const platform = os.platform();
    
    try {
        const envPath = findSoftwarePath(dbms);

        console.log(envPath);

        if (platform === 'win32') {
            execSync(`setx /m PATH "${envPath};%PATH%"`);
            alert(`PATH set successfully for ${dbms}. Please restart the application.`);
        } else {
            const shellProfile = platform === 'darwin' ? '.zshrc' : '.bashrc';
            const profilePath = path.join(os.homedir(), shellProfile);
            const exportCmd = `export PATH="${envPath}:%PATH%"`;

            fs.appendFileSync(profilePath, `\n${exportCmd}\n`);
            alert(`PATH set successfully for ${dbms}. Please restart the terminal.`);
        }
    } catch (error) {
        console.error(error);
        alert(`Error: ${error.message}`);
    }
}

// Function to check environment variables
function checkEnvVariable(dbms) {
    let command;
    switch (dbms) {
        case 'MySQL':
            command = 'mysql --version';
            break;
        case 'PostgreSQL':
            command = 'psql --version';
            break;
        case 'MongoDB':
            command = 'mongod --version';
            break;
        case 'SQLite':
            command = 'sqlite3 --version';
            break;
        case 'Oracle':
            command = 'sqlplus -version';
            break;
        case 'Microsoft SQL Server':
            command = 'sqlcmd -?';
            break;
        default:
            console.error('Unsupported DBMS');
            return;
    }

    exec(command, (error, stdout, stderr) => {
        if (error || stderr) {
            const userResponse = confirm(`Environment variable for ${dbms} not set. Do you want to set it now?`);
            if (userResponse) {
                setEnvVariable(dbms);
            } else {
                alert(`Without setting the environment variable, the application may not work properly.`);
            }
            return;
        }
        alert(`Environment variable for ${dbms} is set.\n${stdout}`);
    });
}
module.exports = { createDBMSOptions };
