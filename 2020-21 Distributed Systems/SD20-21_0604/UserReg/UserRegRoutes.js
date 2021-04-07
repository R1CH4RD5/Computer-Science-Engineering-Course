// Initialize express router
let router = require('express').Router();

// Set default API response
router.get('/', function(req, res) {
    res.json({
        status: 'User Registration API Works',
        message: 'Welcome to FirstRest API'
    });
});

// Import UserReg Controller
var UserRegController = require('./UserRegController');

// User routes
router.route('/users')
    .get(UserRegController.index)
    .post(UserRegController.add);

router.route('/users/:reg_id')
    .get(UserRegController.view)
    .patch(UserRegController.update)
    .put(UserRegController.update)
    .delete(UserRegController.delete);

// Export API routes
module.exports = router;