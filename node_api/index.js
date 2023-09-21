

const express = require('express');
const gameRoutes = require('./routes/gameRoutes');

const app = express();
app.use(express.json());

app.use('/gamesapi', gameRoutes);

const port = process.env.port || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
