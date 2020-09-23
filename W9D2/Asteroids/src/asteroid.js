const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

// MovingObject(pos, vel, radius, color)
Asteroid.COLOR = 'black'; 
Asteroid.RADIUS = 20; 
Asteroid.MAXSPEED = 10;


function Asteroid(pos, game){
    MovingObject.call(this, pos, Util.randomVec(Math.random() * Asteroid.MAXSPEED ) , Asteroid.RADIUS, Asteroid.COLOR, game);
}

Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;