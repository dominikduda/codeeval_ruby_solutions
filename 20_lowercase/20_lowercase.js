function Lowercaser(input) {
    this.input = input;
}

Lowercaser.prototype.lowerCaseSentence = function() {
    return this.input.toLowerCase();
};

var fs  = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != '') {
        var lowercaser = new Lowercaser(line);
        console.log(lowercaser.lowerCaseSentence());
    }
});
