import React from 'react';

class Clock extends React.Component {

    constructor(){
        super();
        this.state = { time: new Date(), test: "Hello!"}
    }
    
    componentDidMount(){
        setInterval(this.tick.bind(this), 1000)
    }

    tick(){
        this.setState( { time: new Date()} );
    }

    render(){
        return (
        <div>Clock
            <div id="inner-div">
                <ul>Time:
                    <li>{this.state.time.getHours()}
                    :{this.state.time.getMinutes()}
                    :{this.state.time.getSeconds()}</li>
                </ul>

                <ul>Date:
                    <li>{this.state.time.getMonth() + 1}/{this.state.time.getDate()}/{this.state.time.getFullYear()}</li>
                </ul>
            </div >
        </div>
        )
    }
}


export default Clock;