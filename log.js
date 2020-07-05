
var logCheck = 1; // 1:check, 0:not check 
var logMsg = '';

function logIn(msg) {
console.log('func logln() start, msg:' + msg);
	logMsg = logMsg + msg + '<br/>';
	var debugConsole = document.getElementById('debugConsole');
	if (debugConsole != null && logCheck == 1) {
		debugConsole.innerHTML = logMsg;
	}
}