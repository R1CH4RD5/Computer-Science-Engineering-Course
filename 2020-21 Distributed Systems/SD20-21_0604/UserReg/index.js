// Import Express
let express = require('express')
// Import Body Parser
let bodyParser = require('body-parser');
// Import Mongoose
let mongoose = require('mongoose');
let app = express();

// Import routes
let apiRoutes = require("./UserRegRoutes")

// Confiuration bodyparser for asked requests
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

// Connect to BD
const dbPath = 'mongodb://localhost/bioApp';
const options = {useNewUrlParser: true, useUnifiedTopology: true}
const mongo = mongoose.connect(dbPath, options);

mongo.then(() => {
    console.log('BD Connected');
}, error => {
    console.log(error, 'error');
});
var db=mongoose.connection;

// Check Connection
if (!db)
    console.log("Error connecting db");
else
    console.log("DB Connected Successfully");

// Server port
var port = process.env.PORT || 3030;

// Use API routes in app
app.use('/data', apiRoutes)

// Start server
app.listen(port, function() {
    console.log("Server running with the port: "+ port);
});