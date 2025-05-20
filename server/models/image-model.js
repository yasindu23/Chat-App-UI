const mongoose = require("mongoose");

const ImageSchema = new mongoose.Schema({
    filename: String,
    contentType: String,
    data: Buffer, // Binary data
});


module.exports = mongoose.model("Image", ImageSchema);