<%*
const { execFile } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');
const { Notice } = tp.obsidian;

// Notify user that publishing is starting
new Notice('Starting publish...');

// First, export /content folder to ../export using Markdown Export plugin
new Notice('📤 Exporting /content to ../export...');

try {
    // Simple export command execution
    await app.commands.executeCommandById('obsidian-markdown-export-plugin:export-folder');
    new Notice('✅ Export command executed');
    
    // Wait for export to complete
    await new Promise(resolve => setTimeout(resolve, 2000));
} catch (exportError) {
    new Notice('⚠️ Export failed - continuing with publish');
}

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
if (os.platform() !== 'win32') {
    try {
        fs.accessSync(scriptPath, fs.constants.X_OK);
    } catch (error) {
        new Notice('❌ Publish script is not executable');
        return;
    }
}

// Execute the script
execFile(scriptPath, { cwd: vaultPath, timeout: 60000 }, (error, stdout, stderr) => {
    if (error) {
        new Notice(`❌ Publish failed: ${error.message}`);
        console.error('Publish error:', error);
        console.error('stderr:', stderr);
        return;
    }
    // Quarto outputs progress to stderr, so only show as warning if it looks like an actual error
    if (stderr && !stderr.includes('[') && !stderr.includes('/')  && !stderr.includes('.md')) {
        console.warn('Publish warnings:', stderr);
    } else if (stderr) {
        console.log('Quarto build progress:', stderr);
    }
    new Notice('✅ Successfully published to GitHub!');
    console.log('Publish output:', stdout);
});
%>

Publishing to GitHub...