const CustomError = require('../errors/custom-error')
const jwt = require('jsonwebtoken')

const authorization = async (req, res, next) => {
    const authorization = req.headers.authorization

    if (!authorization || !authorization.startsWith("Bearer ")) {
        throw new CustomError('No Access Token Found', 404)
    }

    const accessToken = authorization.split(' ')[1]
    try {
        const { username, displayName } =
            jwt.verify(accessToken, process.env.ACCESS_TOKEN_KEY)

        req.user = { displayName, username }
        next()
    } catch (error) {
        throw new CustomError('Forbidden!', 403)
    }
}

module.exports = authorization