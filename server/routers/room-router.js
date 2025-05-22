const express = require('express')
const roomRouter = express.Router()

const multer = require("multer");

const {
    createRoom,
    addMember,
    removeMember,
    getRoomData
} = require('../controller/room-controller')
const { uploadImage } = require('../controller/image-controller')

const authorization = require('../middleware/authorizations')

const upload = multer({ storage: multer.memoryStorage() });

roomRouter.get('/:roomId', authorization, getRoomData)
roomRouter.post('/', authorization, upload.single('image'), uploadImage, createRoom)
roomRouter.post('/:roomId/member', authorization, addMember)
roomRouter.delete('/:roomId/member', authorization, removeMember)

module.exports = roomRouter