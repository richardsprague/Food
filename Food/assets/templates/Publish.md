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
    // Use the Markdown Export community plugin by bingryan
    const markdownExportPlugin = app.plugins.plugins['obsidian-markdown-export-plugin'];
    if (!markdownExportPlugin) {
        new Notice('⚠️ Markdown Export plugin not found. Please install and enable it.');
        return;
    }
    
    // Get the content folder
    const contentFolder = app.vault.getAbstractFileByPath('content');
    if (!contentFolder) {
        new Notice('⚠️ Content folder not found.');
        return;
    }
    
    // Set the export path in plugin settings
    const parentDir = path.dirname(app.vault.adapter.basePath);
    const exportPath = path.join(parentDir, 'export');
    
    // Export content folder to ../export
    await app.commands.executeCommandById('obsidian-markdown-export-plugin:export-folder');
    new Notice('✅ Content exported to ../export');
} catch (exportError) {
    new Notice('⚠️ Could not auto-export. Please manually export /content folder to ../export directory.');
    console.error('Export error:', exportError);
    return;
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