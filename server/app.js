require("dotenv").config();
const express = require('express');
const http = require('http');

const app = express();
const server = http.createServer(app);

const connectDB = require('./db/connect')
const errorHandler = require('./middleware/error-handler')

const authRouter = require('./routers/auth-router')

app.use(express.json())

app.use('/api/v1/auth', authRouter)

app.use(errorHandler)

const port = process.env.PORT || 8080;
const start = async () => {
    await connectDB(process.env.MONGO_URL)
    server.listen(port, () => {
        console.log(`server is listening on port ${port}`)
    })
}

start()