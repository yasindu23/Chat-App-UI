const express = require('express')
const authRouter = express()

const {
    signIn,
    signUp
} = require('../controller/auth-controller')

authRouter.post('/signup', signUp)
authRouter.post('/signin', signIn)

module.exports = authRouter