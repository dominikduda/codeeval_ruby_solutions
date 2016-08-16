function HighestScoreCalculator(input) {
    this.input = input;
}

Object.defineProperty(HighestScoreCalculator.prototype, 'table', {
    get: function() {
        var arraysOfIntegers = this.input.split(' | ').map(function(stringOfNumbers) {
            return stringOfNumbers.split(' ').map(function(numberAsString) {
                return parseInt(numberAsString);
            });
        });
        return arraysOfIntegers;
    }
});

Object.defineProperty(HighestScoreCalculator.prototype, 'amountOfColumns', {
    get: function() {
        return this.table[0].length;
    }
});

HighestScoreCalculator.prototype.highestScores = function() {
    var scores = [];
    for (var i = 0; i < this.amountOfColumns; i++) {
        scores.push(this._maximumForColumn(i));
    }
    return scores.join(' ');
};

HighestScoreCalculator.prototype._maximumForColumn = function(columnNumber) {
    var max = -Infinity;
    this.table.forEach(function(row) {
        if (row[columnNumber] > max) {
            max = row[columnNumber];
        }
    });
    return max;
};

var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != '') {
        var calculator = new HighestScoreCalculator(line);
        console.log(calculator.highestScores());
    }
});
