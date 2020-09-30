import React from 'react';

class Tabs extends React.Component {

    constructor(props){
        super(props);
        this.state = {tabIdx: 0, props: props}

    }

    render(){
        return(
            <ul>
                {this.state.props.tabArr.map((tab,i) => {
                    return (
                    <button key={i} onClick={this.changeTab(i) }>{tab.title}</button>
                    )
                })}
                <li>{this.state.props.tabArr[this.state.tabIdx].content}</li>
            </ul>
        )
    }

    changeTab(idx) {
        return () => {
        this.setState( {tabIdx: idx} );
        }
    }
}

export default Tabs;
        // <div id='tabs-stuff'>
        //     <h1 onClick={}>{this.state.props.tabArr[0].title}
        //         <p>{this.state.props.tabArr[0].content}</p> 
        //     </h1>
        //     <h1>{this.state.props.tabArr[1].title}
        //         <p>{this.state.props.tabArr[1].content}</p> 
        //     </h1>
        //     <h1>{this.state.props.tabArr[2].title}
        //         <p>{this.state.props.tabArr[2].content}</p> 
        //     </h1>
        // </div>