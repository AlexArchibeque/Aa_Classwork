const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    reader.question(`tell us whether ${el1} > ${el2}, return yes or no : `, function (answer) {
        if(answer === 'yes'){
            callback(true);
        } else if (answer === 'no'){ 
            callback(false);
        }
    });
    // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.
}


// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

    if (i == arr.length - 1) {
        outerBubbleSortLoop();
    }else{
        askIfGreaterThan(arr[i], arr[i + 1], function () =  );
    }

    
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
    }

    // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});


// askIfGreaterThan(3, 4, function(ans){ console.log(`${ans}`)});