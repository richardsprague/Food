<%*
const { execFile } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');
const { Notice } = tp.obsidian;

// Notify user that publishing is starting
new Notice('Starting publish...');

// Get and sanitize vault path
const vaultPath = path.normalize(app.vault.adapter.basePath);
if (!vaultPath || vaultPath.includes('..')) {
    new Notice('❌ Invalid vault path');
    return;
}

// Determine script name based on platform
const scriptName = os.platform() === 'win32' ? 'publish-script.bat' : 'publish-script.sh';
const scriptPath = path.join(vaultPath, scriptName);

// Check if script exists
if (!fs.existsSync(scriptPath)) {
    new Notice(`❌ Publish script not found at ${scriptPath}`);
    return;
}

// Check if script is executable (skip on Windows)
if (os.platform() !== 'win32' && !fs.accessSync(scriptPath, fs.constants.X_OK)) {
    new Notice('❌ Publish script is not executable');
    return;
}

// Execute the script
execFile(scriptPath, { cwd: vaultPath, timeout: 30000 }, (error, stdout, stderr) => {
    if (error) {
        new Notice(`❌ Publish failed: ${error.message}`);
        console.error('Publish error:', stderr);
        return;
    }
    if (stderr) {
        console.warn('Publish warnings:', stderr);
    }
    new Notice('✅ Successfully published to GitHub!');
    console.log('Publish output:', stdout);
});
%>

Publishing to GitHub...