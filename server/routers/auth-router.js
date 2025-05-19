const express = require('express')
const authRouter = express()

const {
    signIn,
    signUp,
    createAccessToken
} = require('../controller/auth-controller')

authRouter.post('/signin', signIn)
authRouter.post('/signup', signUp)
authRouter.get('/token', createAccessToken)

module.exports = authRouter