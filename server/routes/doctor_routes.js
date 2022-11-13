const express = require('express');
const { Doctor } = require('../models/doctor');
const bcrypt = require("bcryptjs");
const doctorRouter = express.Router();
const jwt = require("jsonwebtoken");
const { json } = require('express');

doctorRouter.get('/api/doctors/getAll', async(req, res) => {
    try {
        const doctors = await Doctor.find();
        res.json(doctors);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = doctorRouter;