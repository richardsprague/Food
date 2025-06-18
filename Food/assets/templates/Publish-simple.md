<%*
const { execFile } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');
const { Notice } = tp.obsidian;

new Notice('Starting publish...');

// Skip export for now and just run the script
const vaultPath = path.normalize(app.vault.adapter.basePath);
const scriptName = os.platform() === 'win32' ? 'publish-script.bat' : 'publish-script.sh';
const scriptPath = path.join(vaultPath, scriptName);

execFile(scriptPath, { cwd: vaultPath, timeout: 60000 }, (error, stdout, stderr) => {
    if (error) {
        new Notice(`❌ Publish failed: ${error.message}`);
        return;
    }
    new Notice('✅ Successfully published to GitHub!');
});
%>

Publishing to GitHub...