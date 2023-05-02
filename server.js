const express = require('express');

const cors = require('cors');

const app = express();

// middlewares
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));


const moviesRouter = require('./routes/moviesRouter');
app.use('/api/movies', moviesRouter)

const usersRouter = require('./routes/usersRouter');
app.use('/api/users', usersRouter)


//API test
app.get('/', (req, res)=>{
    res.send('API WORKING')
})


// PORT
const PORT = process.env.DB_PORT || 3000

// server
app.listen(PORT, ()=>{
    console.log(`server running in port ${PORT}`)
})
