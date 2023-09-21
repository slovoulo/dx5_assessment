

const express = require('express');
const { getAllGames, getGame, createGame, updateGame, deleteGame } = require('../handlers/gameHandlers');

const router = express.Router();

router.get('/v1/games', getAllGames);
router.get('/v1/games/:id', getGame);
router.post('/v1/games', createGame);
router.put('/v1/games/:id', updateGame);
router.delete('/v1/games/:id', deleteGame);

module.exports = router;
