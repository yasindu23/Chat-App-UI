const mongoose = require('mongoose')

const bcrypt = require('bcryptjs')
const jwt = require("jsonwebtoken")

const userSchema = new mongoose.Schema({
    displayName: {
        type: String,
        required: true,
    },
    username: {
        type: String,
        required: [true, 'Username Is required'],
        unique: [true, 'Username is already taken']
    },
    profilePic: {
        type: String,
    },
    joinedDate: {
        type: String,
    },
    joinedRooms: {
        type: [String]
    },
    invites: {
        type: [String]
    },
    password: {
        type: String
    },
    refreshToken: {
        type: [String]
    }
})

userSchema.pre('save', async function () {
    const solt = await bcrypt.genSalt(10)
    this.password = await bcrypt.hash(this.password, solt) // await is need
})

userSchema.methods.comparePassword = async function (currentPassword) {
    return await bcrypt.compare(currentPassword, this.password)
}

userSchema.methods.createToken = function (tokenKey, expireTime) {
    return jwt.sign(
        { username: this.username, id: this._id }, tokenKey, {
        expiresIn: expireTime
    })
}

module.exports = mongoose.model('Users', userSchema)