var request = require('request');
var async = require('async');

var task_url = 'http://localhost/MP4/web/index.php/runTask';

function runTask(done) {
    request(task_url, {timeout: 0}, function (error, resp, body) {
        if (error) {
            console.log(error);
        }
        console.log(body);
        done(null);
    });
}

var counter = 5;
setInterval(function() {
    if (counter > 0) {
        counter--;
        runTask(function() {
            counter++;
        });
    }
}, 3000);