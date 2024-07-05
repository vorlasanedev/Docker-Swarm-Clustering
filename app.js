// Import the Express module
const express = require('express');
// Create an Express application
const app = express();

// Define a port to listen on
const port = 9100;

count = 0;

// Define a route handler for the default home page
app.get('/', (req, res) => {
//   res.send('Hello, World!');
res.json({result: "respone from:", count: count++ })
});



// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
