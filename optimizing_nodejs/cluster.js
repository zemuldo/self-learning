const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;
const express = require('express');
var app = express();

if (cluster.isMaster) {
    console.log(`Master ${process.pid} is running`);

    // Fork workers.
    for (let i = 0; i < numCPUs; i++) {
        cluster.fork();
    }

    //Check if work id is died
    cluster.on('exit', (worker, code, signal) => {
        console.log(`worker ${worker.process.pid} died`);
    });

} else {
    // This is Workers can share any TCP connection
    // It will be initialized using express
    console.log(`Worker ${process.pid} started`);

    app.get('/cluster', (req, res) => {
        let worker = cluster.worker.id;
        res.send(`Running on worker with id ==> ${worker}`);
    });

    app.listen(5000, function () {
        console.log('Your node is running on port 3000');
    });
}