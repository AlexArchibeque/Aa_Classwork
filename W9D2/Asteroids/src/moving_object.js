// const Game = require("./game.js");
const Util = require('./util.js');

function MovingObject(pos, vel, radius, color, game) {

    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
    this.game = game;

}

MovingObject.prototype.draw = function(ctx){
    // circle of radius centered at pos
    // filled with appropriate color
    ctx.beginPath(); // necessary to begin drawing this path
    ctx.arc(this.pos[0],this.pos[1], this.radius, 0, 2 * Math.PI);
    // (circleCenterX, circleCenterY, radius, startAngle, endAngle, counterclockwise(optional))
    ctx.strokeStyle = "red"; // optionally sets color of path
    ctx.stroke(); // draws path (default color is black)
    ctx.closePath(); // optional when drawing a circle
    ctx.fillStyle = this.color; // sets color to be filled inside of the path
    ctx.fill(); // fills the interior of the circle (does not work without fillStyle being set)

}

MovingObject.prototype.move  = function() {

    let posX = this.pos[0];
    let posY = this.pos[1];
    let velX = this.vel[0];
    let velY = this.vel[1];
    this.pos = this.game.wrap([posX + velX, posY + velY]);
}

MovingObject.prototype.isCollidedWith = function(otherObject){
    let distance = Util.distance(this.pos, otherObject.pos);
    let radiusSum = this.radius + otherObject.radius;
    return distance < radiusSum;
}

MovingObject.prototype.collideWith = function(asteroid) {
    this.game.remove(asteroid);
    this.game.remove(this);
}   


module.exports = MovingObject;

