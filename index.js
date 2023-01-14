import express from "express";
import mysql from "mysql";
import cors from "cors";

const app = express();
app.use(express.json());
app.use(cors())

const db = mysql.createConnection({
  host: "localhost",
  port: "8086",
  user: "admin",
  password: "a12345",
  database: "nodejsTest",
});

db.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

app.get('/users', (req, res)=>{
  const q = "SELECT * FROM users";
  db.query(q, (err, data)=>{
    if(err) return res.json(err);
    return res.json(data);
  });
});

app.listen(3001, ()=>{
  console.log('Welcome to server!')
});