
// const readline = require('readline');

// const reader = readline.createInterface({
//   // it's okay if this part is magic; it just says that we want to
//   // 1. output the prompt to the standard output (console)
//   // 2. read input from the standard input (again, console)

//   input: process.stdin,
//   output: process.stdout
// });

// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
// });

// console.log("Last program line");




const readline = require('readline');


const reader = readline.createInterface({
    input: process.stdin,
   output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) { // 3 6 4 ==> 13, 
    // sum of the numbers get from the user
    // prompting that many times

    if (numsLeft === 0) {
        reader.close();
        return completionCallback(sum);     
    }

    if (numsLeft > 0){  
        reader.question("Give me a number:", function (answer) {
            sum += parseInt(answer);
            console.log(sum);      
            addNumbers(sum, numsLeft-1, completionCallback);
        });
    }
    
};

addNumbers(0, 3, sum => {
    console.log(`Total Sum: ${sum}`);
});

// 1. gets
// these two are the same things
// 2. { const readline = require('readline');

// const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

//   input: process.stdin,
//   output: process.stdout
// });

// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
// });

// console.log("Last program line");  }