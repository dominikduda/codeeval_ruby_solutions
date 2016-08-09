var fs  = require('fs');

function sumArray(array_of_strings) {
    var sum = array_of_strings.split('').reduce(function(a, b) {
        return a + parseInt(b);
    }, 0);
    return sum;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    console.log(sumArray(line));
});
