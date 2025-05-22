const express = require('express')
const userRouter = express.Router()

const multer = require("multer");

const { uploadImage } = require('../controller/image-controller')
const authorization = require('../middleware/authorizations')
const {
    updateUser,
    getUserData,
    getUserJoinedRooms
} = require('../controller/user-controller')

const upload = multer({ storage: multer.memoryStorage() });

userRouter.get('/rooms', authorization, getUserJoinedRooms)
userRouter.patch('/:id', authorization, upload.single('image'), async (req, res, next) => {
    if (req.file) {
        await uploadImage(req, res, next)
        return
    }
    next()
}, updateUser)
userRouter.get('/:id', authorization, getUserData)

module.exports = userRouter