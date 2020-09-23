

const MovingObject = require("./moving_object.js");
const Asteroid = require('./asteroid.js');
const Util = require('./util.js');

const Game = require('./game.js');
const GameView = require('./game_view.js');


window.Game = Game;
window.Asteroid = Asteroid;
window.MovingObject = MovingObject;
window.GameView = GameView;

// window.gv = new GameView;


window.addEventListener('DOMContentLoaded', (event) => {
    let element = document.getElementById('game-canvas');
    ctx = element.getContext('2d');
    let gv = new GameView(ctx);
    gv.start();
});



