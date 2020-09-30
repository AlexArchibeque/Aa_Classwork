import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './clock';
import Tabs from './tabs/tabs';


let arr = [
    {title: 'one', content: 'I am The ONE' },
    {title: 'two', content: 'I am The too' },
    {title: 'three', content: 'I am The 3' }
];




const Widget = () => {
    return (
    <div id='styled'>
        <Clock />
        <Tabs tabArr={arr}/>
    </div>
    )
}


//waiting for the document to fully load before it does anything inside
document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    ReactDOM.render(<Widget />, root);
    // ReactDOM.render(<Tabs />, root);
})


