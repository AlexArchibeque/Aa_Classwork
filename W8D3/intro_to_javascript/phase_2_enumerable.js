//Array#myMap(callback)
// new array
Array.prototype.myMap = function(cb){
    let res = [];
    for(let i = 0; i<this.length; i++){
        res.push(cb(this[i]))
    }

    return res
}

// console.log([1,2,3,4].myMap(doubler))


function doubler(num){
    return num*2
}
//Array#myEach(callback)
// mutating

Array.prototype.myEach = function(cb) {
    for(let i=0 ; i< this.length; i++){
        cb(this[i])
    }
}
let arr = [1,2,3,4]
arr.myEach(callback)
function callback(el){
    console.log(el)
}
// Array.prototype.myEach = function (func) {
//     for (let i = 0; i < this.length; i++) {
//         func(this[i]);
//     }
// };

// Array.prototype.myReduce = function (func, initialValue) {

//     let arr = this;

//     // if (initialValue === undefined) {
//     //     initialValue = arr[0];
//     //     arr = arr.slice(1);
//     // }

//     let result = initialValue;

//     arr.myEach(el => result = func(result, el));

//     return result;
// };


// let arr = [1,2,3,4]
// console.log(arr.myEach(doubler))
// console.log(arr)

//Array#myReduce
Array.prototype.myReduce = function(cb, initial){
    // this = [25,1,2,3]
    
    this.myEach(function el() {initial = cb(initial, el)} );
    return initial
}

// function callback(acc, el){
//     return acc + el;
// }



// [1, 2, 3].myReduce(function(acc, el) { return acc + el;}  ); // => 6
// with initialValue

// console.log(typeof([1,2,3]);
// let arr1 = [1,2,3].myReduce(callback, 25); // => 31
// console.log(arr1)

// console.log(arr.myEach());
// init = 25 + 1 + 2 + 3 === 31
// iteration to start at arr[0]

//

// init = 1 + 1 + 2 + 3 === 7
// iteration to start at arr[1]
// [1, 2, 3]