const CustomError = require('../errors/custom-error')
const Image = require('../models/image-model')

const uploadImage = async (req, res, next) => {
    try {
        if (!req.file) throw new CustomError('No Image Selected', 404)

        const newImage = new Image({
            filename: req.file.originalname,
            contentType: req.file.mimetype,
            data: req.file.buffer
        });

        const imageData = await newImage.save();

        req.imageId = imageData._id
        return next();
    } catch (err) {
        throw next(err)
    }
}

const getImage = async (req, res, next) => {
    try {
        const image = await Image.findById(req.params.id);
        if (!image) throw new CustomError('Image not found', 404);

        res.set("Content-Type", image.contentType);
        res.send(image.data);
    } catch (err) {
        throw next(err)
    }
}

const deleteImage = async (req, res, next) => {
    try {
        const imageId = req.params.id
        const imageDoc = await Image.findById(imageId)
        if (!imageDoc) throw new CustomError('No Image with this Id', 404)

        await imageDoc.deleteOne()
        res.status(200).json({ success: true, data: 'Image Successfully deleted' })
    } catch (error) {
        throw next(error)
    }
}

module.exports = {
    uploadImage,
    getImage,
    deleteImage,
}