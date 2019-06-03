console.log('I am reading the file...')
const fs = require('fs');
fs.readFile('./READ.md', (err, data) => {
    return new Promise((resolve, reject) => {
            if (err) reject(err);
            else resolve(data)
        })
        .then(data => {
            console.log(data)
            console.log('I am done reading the file')
        })
        // Any errors are thrown here
        .catch(e => {
            console.log(e)
        })
});