const CustomError = require('../errors/custom-error')
const User = require('../models/user-model')

const jwt = require("jsonwebtoken")

const signUp = async (req, res, next) => {
    try {
        const user = await User.create({
            ...req.body,
            joinedDate: `${new Date()}`,
            joinedRooms: [],
            ownRooms: [],
            invites: [],
            profilePic: '',
        })

        res.status(200).json({ success: true, data: user })
    } catch (error) {
        throw next(error)
    }
}

const signIn = async (req, res, next) => {
    try {
        const { username, password } = req.body
        if (!username || !password)
            throw new CustomError('Please enter user name and password', 404)

        const userData = await User.findOne({ username })
        if (!userData) throw new CustomError(`No user with username ${username}`, 404)

        if (!(await userData.comparePassword(password))) {
            throw new CustomError(`Incorrect password`, 400)
        }

        const accessToken =
            userData.createToken(process.env.ACCESS_TOKEN_KEY, "10m")

        const refreshToken =
            userData.createToken(process.env.REFRESH_TOKEN_KEY, "30m")

        await User.updateOne({ _id: userData._id }, {
            $push: { refreshToken }
        })

        res.status(200).json({ success: true, data: { accessToken, refreshToken } })
    } catch (error) {
        throw next(error)
    }
}

const createAccessToken = async (req, res, next) => {
    try {
        const refreshToken = req.body.refreshToken
        const { username } = jwt.verify(refreshToken, process.env.REFRESH_TOKEN_KEY)

        const userData = await User.findOne({ username })
        if (!userData)
            throw new CustomError(`Forbidden`, 401)

        const accessToken = userData.createToken(process.env.ACCESS_TOKEN_KEY, "10m")
        res.status(200).json({ success: true, data: accessToken })
    } catch (error) {
        throw next(error)
    }
}

const checkPassword = async (req, res, next) => {
    try {
        const { password } = req.body
        const userData = await User.find({ username: req.user.username })

        if (await userData.comparePassword(password)) {
            return res.status(200).json({ success: true, data: 'Password is ok' })
        }

        res.status(400).json({ success: false, data: 'Password is not ok' })
    } catch (error) {
        throw next(error)
    }
}

module.exports = {
    signIn,
    signUp,
    createAccessToken,
    checkPassword
}