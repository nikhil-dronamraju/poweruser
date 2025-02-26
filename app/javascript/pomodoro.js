// let pomodoroTimes = [ 1500, 300, 1500, 300, 1500, 300, 1500, 300, 1800 ];
// let selectedIndex = 0;
// let timeElapsed = 0;
// let seconds = pomodoroTimes[ selectedIndex ];
// let pomodoroInterval;
// let worker;
//
// function windClock(){
//     seconds -= 1;
//     const timerElement = document.getElementById("pomodoro_time");
//     if ( seconds === 0 ) {
//         timerElement.classList.remove("has-text-primary");
//         timerElement.classList.add("has-text-danger");
//         selectedIndex += 1;
//         stopPomodoroTimer();
//     } else {
//         timerElement.classList.remove("has-text-danger");
//         timerElement.classList.add("has-text-primary");
//     }
//
//     if ( selectedIndex >= pomodoroTimes.length ) {
//         selectedIndex = 0;
//     }
//
//     // UI logic:
//     timerElement.innerText = formatSeconds(seconds);
// }
//

// Default pomodoro intervals:
let pomodoroTimes = [ 1500, 300, 1500, 300, 1500, 300, 1500, 300, 1800 ];
let i = 0;

function formatSeconds( numberOfSeconds ) {
    let minutes = parseInt(numberOfSeconds / 60);
    let seconds = numberOfSeconds % 60;
    return `${minutes}:${seconds}`;
}

function timedCount() {
    i = i + 1;
    postMessage(i);
    setTimeout("timedCount()",1000);
}

timedCount();

