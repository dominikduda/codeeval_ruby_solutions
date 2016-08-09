function MaxRangeSumCalculator(input) {
    this.input = input;
}

Object.defineProperty(MaxRangeSumCalculator.prototype, 'numberOfDays', {
    get: function() {
        var numberOfDays = parseInt(this.input.substr(0, this.input.indexOf(';')));
        return numberOfDays;
    }
});

Object.defineProperty(MaxRangeSumCalculator.prototype, 'integers', {
    get: function() {
        var integers = this.input.substr(this.input.indexOf(';') + 1).split(' ').map(function(str) {
            return parseInt(str);
        });
        return integers;
    }
});

MaxRangeSumCalculator.prototype._arraySum = function(array) {
    var sum = array.reduce(function(a, b) {
        return a + b;
    });
    return sum;
};

MaxRangeSumCalculator.prototype._integersExtract = function(startIndex) {
    var _integersExtract = this.integers.slice(startIndex, startIndex + this.numberOfDays);
    return _integersExtract;
};

MaxRangeSumCalculator.prototype._rangeSum = function(startIndex) {
    var sum = this._arraySum(this._integersExtract(startIndex));
    return sum;
};

MaxRangeSumCalculator.prototype.maximumRangeSum = function() {
    var max = 0;
    for (var i = 0; i <= this.integers.length - this.numberOfDays; i++) {
        if (max < this._rangeSum(i)) {
            max = this._rangeSum(i);
        }
    }
    return max;
};

var fs  = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != '') {
        var maxRangeSumCalculator = new MaxRangeSumCalculator(line);
        console.log(maxRangeSumCalculator.maximumRangeSum());
    }
});
