<%*
const { exec } = require('child_process');
const { Notice } = this.app;

new Notice('Starting publish...');

// Run your publish script
exec('cd ' + this.app.vault.adapter.basePath + ' && ./publish-script.sh', 
     (error, stdout, stderr) => {
    if (error) {
        new Notice('❌ Publish failed: ' + error.message);
        console.error(stderr);
    } else {
        new Notice('✅ Successfully published to GitHub!');
        console.log(stdout);
    }
});
%>

Publishing to GitHub...