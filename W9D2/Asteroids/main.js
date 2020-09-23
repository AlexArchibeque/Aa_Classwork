/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(/*! ./util.js */ "./src/util.js");
const MovingObject = __webpack_require__(/*! ./moving_object.js */ "./src/moving_object.js");

// MovingObject(pos, vel, radius, color)
Asteroid.COLOR = 'black'; 
Asteroid.RADIUS = 20; 
Asteroid.MAXSPEED = 10;


function Asteroid(pos, game){
    MovingObject.call(this, pos, Util.randomVec(Math.random() * Asteroid.MAXSPEED ) , Asteroid.RADIUS, Asteroid.COLOR, game);
}

Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(/*! ./asteroid.js */ "./src/asteroid.js");


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

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(/*! ./game.js */ "./src/game.js");


function GameView(ctx){
    this.ctx = ctx;
    this.game2 = new Game();

}

GameView.prototype.start = function() {
    let that = this;
    setInterval(function (){
        that.game2.step();
        that.game2.draw(that.ctx);
    },20);
}

module.exports = GameView;

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {



const MovingObject = __webpack_require__(/*! ./moving_object.js */ "./src/moving_object.js");
const Asteroid = __webpack_require__(/*! ./asteroid.js */ "./src/asteroid.js");
const Util = __webpack_require__(/*! ./util.js */ "./src/util.js");

const Game = __webpack_require__(/*! ./game.js */ "./src/game.js");
const GameView = __webpack_require__(/*! ./game_view.js */ "./src/game_view.js");


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





/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// const Game = require("./game.js");
const Util = __webpack_require__(/*! ./util.js */ "./src/util.js");

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



/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {



const Util = {


    inherits(child, parent) {
        function Surrogate() {};
        Surrogate.prototype = parent.prototype;
        child.prototype = new Surrogate();
        child.prototype.constructor = child;
    },

    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },

    // Scale the length of a vector by the given amount.

    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    },

    distance(posA, posB){
        let deltaX = posB[0] - posA[0];
        let deltaY = posB[1] - posA[1];

        return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
    }

}

module.exports = Util;


/***/ })

/******/ });
//# sourceMappingURL=main.js.map