const express = require('express')
const imageRouter = express.Router()

const {
    getImage,
    deleteImage,
} = require('../controller/image-controller')

imageRouter.get('/:id', getImage)
imageRouter.delete('/:id', deleteImage)

module.exports = imageRouter