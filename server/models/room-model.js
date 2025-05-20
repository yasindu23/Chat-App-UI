
const mongoose = require('mongoose')

const roomSchema = new mongoose.Schema({
    roomName : {
        type: String,
    },
    image: {
        type: String,
    },
    admin: {
        type: String
    },
    description: {
        type: String
    },
    members: {
        type: [String]
    }
})

module.exports = mongoose.model('Rooms', roomSchema)