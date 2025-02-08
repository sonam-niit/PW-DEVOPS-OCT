const express = require('express');
require('dotenv').config();

const PORT = process.env.PORT;
const app = express();

app.get("/",(req,res)=>{
    res.send('Hello From Node Project')
})
app.listen(PORT,()=>console.log('Server is running on Port '+PORT))