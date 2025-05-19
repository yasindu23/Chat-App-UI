
const errorHandler = (err, req, res, next) => {
    console.log(err.message)
    res.status(err.stateCode ? err.stateCode : 500).send({ success: false, data: err.message })
}

module.exports = errorHandler