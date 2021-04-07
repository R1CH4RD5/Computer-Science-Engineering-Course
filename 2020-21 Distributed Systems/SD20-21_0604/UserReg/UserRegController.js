// Import UserReg Model
let Reg = require('./UserRegModel');

// Index
exports.index = function (req, res) {
    Reg.get(function (err, reg) {
        if (err)
            res.json({
                status: "error",
                message: err
            });
        res.json({
            status: "OK",
            message: "Registration List Successfully Obtained.",
            data: reg       
        });
    });
};

// New Registration
exports.add = function (req, res) {
    var reg = new Reg();
    //bio.nome = req.body.nome? req.body.nome: bio.nome;
    reg.name = req.body.name;
    reg.email = req.body.email;
    reg.number = req.body.number;
    reg.address = req.body.address;

    // Save and check for erros
    reg.save(function (err) {
        if (err)
            res.json(err);

        res.json({
            message: "New Registration added.",
            data: reg
        });
    });
};

// View Reg
exports.view = function (req, res) {
    Reg.findById(req.params.reg_id, function (err, reg) {
        if (err)
            res.send(err);
        res.json({
            message: 'Registration Details.',
            data: reg
        });
    });
};

// Update Reg
exports.update = function (req, res) {
    Reg.findById(req.params.reg_id, function (err, reg) {
        if (err)
            res.send(err);
        //bio.nome = req.body.nome ? req.body.nome : bio.nome;
        reg.name = req.body.name;
        reg.email = req.body.email;
        reg.number = req.body.number;
        reg.address = req.body.address;

        // Save and check for erros
        reg.save(function (err) {
            if (err)
                res.json(err)
            res.json({
                message: "Registration Updated Successfully.",
                data: reg
            });
        });
    });
};

// Delete Reg
exports.delete = function (req, res) {
    Reg.deleteOne({
        _id: req.params.reg_id
    }, function (err, contact) {
        if (err)
            res.send(err)
        res.json({
            status: "OK",
            message: 'Registration Deleted!'
        });
    });
};