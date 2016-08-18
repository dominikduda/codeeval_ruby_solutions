function TimestampSorter(input) {
    this.input = input;
}

Object.defineProperty(TimestampSorter.prototype, 'timestamps', {
    get: function() {
        return this.input.split(' ');
    }
});

TimestampSorter.prototype.sortedTimestamps = function() {
    var sortedTimes = this.timestamps.sort(function(a, b) {
        if (a > b) { return -1; }
        return 1;
    });
    return sortedTimes.join(' ');
};

var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != '') {
        var timestampSorter = new TimestampSorter(line);
        console.log(timestampSorter.sortedTimestamps());
    }
});
