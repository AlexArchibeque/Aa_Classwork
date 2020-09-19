class Clock { //ruby santax class
    constructor() { //initialize
        // 1. Create a Date object.
        let today = new Date();
        
        // console.log(`Hours: ${today.getHours()}`); 
        // console.log(`Minutes: ${today.getMinutes()}`);
        // console.log(`Seconds: ${today.getSeconds()}`);

        // 2. Store the hours, minutes, and seconds.
        
        
        
        this.hours = today.getHours();   //instance variables
        this.minutes = today.getMinutes();  //instance variables
        this.seconds = today.getSeconds();  //instance variables
        
        // 3. Call printTime.
        
        this.printTime();
        
        // 4. Schedule the tick at 1 second intervals.
        
        // let timerId = setInterval(() => alert('tick'), 2000);  // <=== 2 seconds, source from the internet
        
        // Also works.
        // setInterval( () => this._tick(), 1000);
        
        this._tick = this._tick.bind(this, today); //tick function method becomes its own class object
        //binding the object that we've made to over ride chrome's this (web window),
        //because _tick, never defiend what "this" is
        // this._tick = this._tick.bind()

        setInterval(this._tick, 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    }

    _tick(today) { //
        // 1. Increment the time by one second.

        // var dt = new Date("December 30, 2017 11:20:25");
        // dt.setSeconds(dt.getSeconds() + 10);
        today.setSeconds(today.getSeconds() + 1);
        this.seconds = today.getSeconds();
        // this.seconds += 1;

        // 2. Call printTime.
        this.printTime();
    }
}

const clock = new Clock();
// const clock2 = new Clock();