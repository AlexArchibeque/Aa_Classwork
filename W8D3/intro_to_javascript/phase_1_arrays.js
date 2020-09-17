//Array#uniq
Array.prototype.uniq = function() {
    let res = [];
    let hash = {};

    for (let i = 0 ; i < this.length ; i++) {
// 0-7 hash[arr[0]] === 1
// {1:1, }
// [1]
        if( hash[this[i]] != 1) {
            hash[this[i]] = 1
            res.push(this[i])
        }
    }
    return res;
}

// console.log([1,1,2,3,4,2,1].uniq()); // => [1,2,3,4]
// console.log([3,4,3,2,1,2,1,4].uniq()); // => [3,4,2,1]

// let arr = [1,2,3];
// console.log(arr[1]);


//Array#twosum
function twoSum(arr){
    //
    let hash = {};
    let res = [];
    for (let i = 0 ; i<arr.length; i++){
        let num = arr[i];
        if (hash[-num]){
            res.push([hash[-num], i]);
        }
        else{
            hash[num] = i;
        }
    }

    return res;
}



// console.log(twoSum([1,2,3,-2,0,-2])) // ==> [[1,3]]

// res = [[1,3], [1,5]]
// if [1,3] === [3,1] ???

//Array#transpose
// let matrix = new Array(5).fill(0).map(() => new Array(4).fill(0));
// console.log(matrix)
// cols == console.log(matrix.length)
// rows == console.log(matrix[0].length)

Array.prototype.transpose = function() {
    let matrix = new Array(this[0].length).fill(0).map(() => new Array(this.length).fill(0));
    for (let i = 0 ; i < this.length ; i++) {      
        for(let j = 0 ; j < this[0].length ; j++) {
            matrix[j][i] = this[i][j]
        }
     }
    return matrix;
}


 console.log([[1,2,3],[1,2,3]].transpose())
 console.log([[2,3,4,5],[2,3,4,5]].transpose())


                 //   ==>[[1,1],
                 //       [2,2],
                 //       [3,3] ]


