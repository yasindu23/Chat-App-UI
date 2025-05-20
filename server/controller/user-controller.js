const CustomError = require('../errors/custom-error')
const User = require('../models/user-model')

const updateUser = async (req, res, next) => {
    let updateValues = { ...req.body }
    if (req.imageId) {
        updateValues.profilePic = `http://localhost:8080/api/v1/image/${req.imageId}`
    }

    await User.updateOne({ username: req.user.username }, updateValues)
}

module.exports = {
    updateUser
}