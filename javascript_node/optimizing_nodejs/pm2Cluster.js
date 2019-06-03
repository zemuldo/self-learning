'use strict';

//Define all dependencies needed
const express = require('express');
const responseTime = require('response-time')
const axios = require('axios');

//Load Express Framework
var app = express();

app.get('/cluster', (req, res) => {
    res.send('Hello Word');
});

app.listen(3000, function () {
    console.log('Your node is running on port 3000 !!!')
});