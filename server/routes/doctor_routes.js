const express = require('express');
const Doctor = require('../models/doctor');
const User = require('../models/user');
const bcrypt = require("bcryptjs");
const doctorRouter = express.Router();
const jwt = require("jsonwebtoken");
const { json } = require('express');

doctorRouter.get('/api/doctors/getAll', async(req, res) => {
    try {
        console.log("Get all doctor");
        const doctors = await Doctor.find();
        const type = "doctor";
        // const authDoctors = await User.findOne({ type });
        const listResponse = [];
        for (let i = 0; i < doctors.length; i++) {
            let email = doctors[i].email;
            const user = await User.findOne({ email });
            let responseItem = {
                'email': email.email,
                'name': user.name,
                'address': user.address,
                'gender': user.gender,
                'dateBorn': user.dateBorn,
                'avt': user.avt,
                'type': doctors[i].type,
                'description': doctors[i].description,
                'timeStart': doctors[i].timeStart,
                'timeFinish': doctors[i].timeFinish,
                'experience': doctors[i].experience,
            };
            listResponse.push(responseItem);
        }
        res.json(listResponse);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

doctorRouter.post('/api/doctors/insertDoctor', async(req, res) => {
    try {
        console.log("Insert doctor is called");
        const { email, type, description, timeStart, timeFinish, experience } = req.body;
        let doctor = new Doctor({
            email,
            type,
            description,
            timeStart,
            timeFinish,
            experience,
        });
        console.log(doctor.email);
        doctor = await doctor.save();
        res.json(doctor);
    } catch (e) {
        res.status(500).json({ error: e.mesaage });
    }
});
module.exports = doctorRouter;