const Asteroid = require("./asteroid.js");


Game.DIMX = 800;
Game.DIMY = 800;
Game.NUM_ASTEROIDS = 10;

function Game() {
    this.asteroids = this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
    let output = [];
    while (output.length < Game.NUM_ASTEROIDS) {
        output.push(new Asteroid(this.randomPosition(), this));
    }
    return output;
}

Game.prototype.randomPosition = function() {
    return [(Math.random()* Game.DIMX), (Math.random() * Game.DIMY)];
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,Game.DIMX,Game.DIMY);
    this.asteroids.forEach( (asteroid) => {
        asteroid.draw(ctx);
    });
}

Game.prototype.move = function() {
    this.asteroids.forEach( (asteroid) => {
        asteroid.move();
    });
}

// pos = [x,y]
Game.prototype.wrap = function(pos) {
    let posX = pos[0] + Game.DIMX;
    let posY = pos[1] + Game.DIMY;
    return [posX % Game.DIMX, posY % Game.DIMY];
}

// Logarithmic: log(a^b) = b * log(a)
// Future, better algo = keep priority queue of future collisions and just process the next tone when it's time
// adding one collision to pq is log(n^2) = 2* log(n) ^ 2
// O(n*2) == O(n)  O(n^2) != O(n)
// O(log(n^2)) == O(log(n))
// O(n * log(n)) != O(log(n))
// there exists some k1, the program always takes < k1*log(x^2)
                                                //   2*k1*log(x)
// getting next collision to log(n)
// O(f(x)) : there exists some k such that time < k * f(x) for any x whatsoever
//  500,000 * x^2
// O(log(x))

Game.prototype.checkCollisions = function() {
    for(let k = 0; k < this.asteroids.length; k++){
        for(let p = k+1; p < this.asteroids.length; p++){
            if (this.asteroids[k].isCollidedWith(this.asteroids[p])){
                this.asteroids[k].collideWith(this.asteroids[p]);
                console.log('removed');              
            }
        }
    }
}

Game.prototype.step = function() {
    this.move();
    this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
    this.asteroids = this.asteroids.filter(ast =>  ast !== asteroid);
}


module.exports = Game;      