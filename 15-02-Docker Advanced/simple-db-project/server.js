const express= require('express');
const mongoose= require('mongoose');
require('dotenv').config()
MONGO_URL=process.env.MONGO_URL
PORT=process.env.PORT

mongoose.connect(MONGO_URL)
.then(()=>console.log('Connected'))
.catch(err=>console.log('Error Occured',err))

const app= express();
app.get('/',(req,res)=>{
    res.send('Connected')
})
app.listen(PORT,()=>console.log('App is running on PORT: '+PORT))