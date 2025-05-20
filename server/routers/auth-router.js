const express = require('express')
const authRouter = express()

const {
    signIn,
    signUp,
    createAccessToken,
    checkPassword
} = require('../controller/auth-controller')
const authorizations = require('../middleware/authorizations')

authRouter.post('/signin', signIn)
authRouter.post('/signup', signUp)
authRouter.get('/token', createAccessToken)
authRouter.get('/checkPass', authorizations, checkPassword)

module.exports = authRouter