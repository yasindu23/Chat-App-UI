const User = require('../models/user-model')
const Room = require('../models/room-model')

const CustomError = require('../errors/custom-error')

const updateUser = async (req, res, next) => {
    try {
        let updateValues = { ...req.body }
        if (req.imageId) {
            updateValues.profilePic = `http://localhost:8080/api/v1/image/${req.imageId}`
        }

        await User.updateOne({ username: req.user.username }, updateValues)
    } catch (error) {
        throw next(error)
    }
}

const getUserData = async (req, res, next) => {
    try {
        if (req.user.id != req.params.id)
            throw new CustomError("You can't access this data", 400)

        const userData = await User.findOne({ _id: req.user.id }).select('-refreshToken -password') // remove the password and refresh tokens
        res.status(200).json({ success: false, data: userData })
    } catch (error) {
        throw next(error)
    }
}

const getUserJoinedRooms = async (req, res, next) => {
    try {
        const currentUserId = req.user.id

        const currentUser = await User.findOne({ _id: currentUserId })
        const userJoinedRooms = currentUser.joinedRooms

        const rooms = await Room.find({ _id: { $in: userJoinedRooms } })

        res.status(200).json({ success: true, data: rooms })
    } catch (error) {
        throw next(error)
    }
}

module.exports = {
    updateUser,
    getUserData,
    getUserJoinedRooms
}