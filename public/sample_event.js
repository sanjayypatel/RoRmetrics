// Place this code in the client application

var _rm_event = {
  name: "State Change",
}

var _rm_request = new XMLHttpRequest();
//replace localhost:3000 with the domain of running RoRmetrics server
_rm_request.open("POST", "http://localhost:3000/api/events", true);
_rm_request.setRequestHeader('Content-Type', 'application/json');
_rm_request.onreadystatechange = function() {
};
_rm_request.send(JSON.stringify(_rm_event));