var mongoose = require('mongoose');

// Schema
var bioSchema = mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    number: {
        type: String,
        required: true
    },
    address: {
        type: String,
        required: true
    },
    created_at: {
        type: Date,
        default: Date.now
    }
});

// Export UserReg Model
var Reg = module.exports = mongoose.model('user', bioSchema);

module.exports.get = function (callback, limit) {
   Reg.find(callback).limit(limit); 
}