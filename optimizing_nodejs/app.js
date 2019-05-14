console.log('I am reading the file...')
const fs = require('fs');
const data = fs.readFileSync('./READ.md');
console.log(data)
console.log('I am done reading the file')