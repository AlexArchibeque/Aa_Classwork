const Game = require('./game.js');


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