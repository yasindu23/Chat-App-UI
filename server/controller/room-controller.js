const Room = require('../models/room-model')

const CustomError = require('../errors/custom-error')

const getRoomData = async (req, res, next) => {
    const roomData = await Room.findOne({ _id: req.params.roomId })

    if (roomData.admin == req.user.id) {
        return res.status(200).json({ success: true, data: roomData })
    }

    // filtering the data to members (remove members list from member send request)
    res.status(200).json({
        success: true, data: {
            roomName: roomData.roomName,
            image: roomData.image,
            admin: roomData.admin,
            description: roomData.description,
        }
    })
}

const createRoom = async (req, res, next) => {
    try {
        const roomImage = `http://localhost:8080/api/v1/image/${req.imageId}`
        const roomData = await Room.create({
            ...req.body,
            image: roomImage,
            admin: req.user.id,
            members: [],
            reports: [],
        })

        if (!roomData) throw new CustomError('Please try again to create a room', 400)

        res.status(201).json({ success: true, data: roomData })
    } catch (error) {
        throw next(error)
    }
}

const addMember = async (req, res, next) => {
    try {
        const roomData = await Room.findOne({ _id: req.params.roomId })

        if (roomData.admin != req.user.id)
            throw new CustomError("You can't add members to this group")

        await Room.updateOne({ _id: roomData._id }, {
            $push: {
                members: req.body.memberId
            },
        })

        res.status(200).json({ success: true, data: 'Member Successfully added' })
    } catch (error) {
        throw next(error)
    }
}

const removeMember = async (req, res, next) => {
    try {
        const roomData = await Room.findOne({ _id: req.params.roomId })

        if (roomData.admin != req.user.id)
            throw new CustomError("You can't remove members from this group")

        await Room.updateOne({ _id: roomData._id }, {
            $pull: {
                members: req.body.memberId
            },
        })

        res.status(200).json({ success: true, data: 'Member Successfully removed' })
    } catch (error) {
        throw next(error)
    }
}

module.exports = {
    createRoom,
    addMember,
    removeMember,
    getRoomData
}
