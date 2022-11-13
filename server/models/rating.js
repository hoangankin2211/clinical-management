const mongoose = require("mongoose");

const ratingSchema = mongoose.Schema({
    userId: {
        type: String,
        required: true,
    },
    rating: {
        type: Number,
        required: true,
    },
    reviews: {
        type: String,
        default: '',
    },
});

module.exports = ratingSchema;