//Create an array with predifined games
let games = [
    { id: 1, title: 'God of War', description: 'Man too angry to die', genre: 'Action' },
    { id: 2, title: 'Wolfenstein', description: 'Kill Ze Germans', genre: 'Shooter' },
    { id: 3, title: 'Need for Speed: The Run', description: 'Be the first to reach San Fransisco', genre: 'Racing' },
    
];

exports.getAllGames = (req, res) => {
    res.status(200).json(games);
};

exports.getGame = (req, res) => {
    const game = games.find(n => n.id === parseInt(req.params.id));
    if (!game) return res.status(404).json({ message: 'Game not found' });
    res.status(200).json(game);
};

exports.createGame = (req, res) => {
    const newGame = {
        id: games.length + 1,
        title: req.body.title,
        description: req.body.description,
        genre:req.body.genre
    };
    games.push(newGame);
    res.status(201).json(newGame);
};

exports.updateGame = (req, res) => {
    const game = games.find(n => n.id === parseInt(req.params.id));
    if (!game) return res.status(404).json({ message: 'Game not found' });

    game.title = req.body.title;
    game.description = req.body.description;
    game.genre = req.body.genre;
    res.status(200).json(game);
};

exports.deleteGame = (req, res) => {
    const gameIndex = games.findIndex(n => n.id === parseInt(req.params.id));
    if (gameIndex === -1) return res.status(404).json({ message: 'Game not found' });

    const deletedGame = games.splice(gameIndex, 1);
    res.status(200).json(deletedGame);
};
