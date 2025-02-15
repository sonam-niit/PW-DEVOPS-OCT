const express= require('express');
const mysql= require('mysql2');
require('dotenv').config()
PORT=process.env.PORT

const db= mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
})
db.connect((err)=>{
    if(err){
        console.log('Error Occured',err);
    }else{
        console.log('DB Connected');
    }
})

const app= express();
app.get('/',(req,res)=>{
    res.send('Connected')
})
app.listen(PORT,()=>console.log('App is running on PORT: '+PORT))