'use strict';

const express = require('express');
const app = express();
const db = {candidates: []}
db.candidates.sort_by_score = (a, b ) => {
    if ( a.score > b.score ){
      return -1;
    }
    if ( a.score < b.score ){
      return 1;
    }
    return 0;
  }

app.use(express.json());

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.post('/candidates', (req, res, next)=>{
    const candidate = req.body;
    if(!candidate.id ) return res.status(400).send({error: "id is required"})
    if(!candidate.name ) return res.status(400).send({error: "name is required"})
    if(!candidate.skills) return res.status(400).send({error: "skills is required"})
    const exists = db.candidates.find(_candiate=>_candiate.id === candidate.id)
    if(exists) res.status(400).send({error: "user with id exists"})
    next()
})

app.get('/candidates/search', (req, res, next)=>{
    if(!req.query.skills) return res.status(400).send({error: "skills is required for searching users"})
    next()
})

// Your code starts here. Placeholders for .get and .post are provided for
//  your convenience.

app.post('/candidates', function(req, res) {
  const candidate = req.body;
  db.candidates.push(candidate)
  res.send({status: "ok"})
});

app.get('/candidates/search', function(req, res) {
  // ...
  const {skills} = req.query;
  const skills_array = skills.split(",")
  const found = db.candidates.map(candidate=> {
      const matching =  candidate.skills.filter(skill => skills_array.includes(skill))
      return {...candidate, score: matching.length}
  }).filter(candidate => candidate.score > 0).sort(db.candidates.sort_by_score)

  if(found.length === 0) return res.status(404).send({error: "No users matching skills"})

  const suitable = found[0]

  delete suitable.score

  res.send(suitable)
});

app.listen(process.env.HTTP_PORT || 3000);