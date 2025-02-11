let pomodoroTimes = [ 1500, 300, 1500, 300, 1500, 300, 1500, 300, 1800 ];
let selectedIndex = 0;
let timeElapsed = 0;
let seconds = pomodoroTimes[ selectedIndex ];
let pomodoroInterval;

/**
 * We need an accurate pomodoro timer - The first thing is to have it go from 25:00 to 0:00
 * In seconds that's 1500 to 0.
 * Done - We also need to do some code cleanup.
 * Yo, this IDE is in my way. Basically - format seconds
 * So - We can just use this array indefinitely
 * Anyways, we start off at arr[0]
 *
 */



function windClock(){
    seconds -= 1;
    const timerElement = document.getElementById("pomodoro_time");
    if ( seconds === 0 ) {
        timerElement.classList.remove("has-text-primary");
        timerElement.classList.add("has-text-danger");
        selectedIndex += 1;
        stopPomodoroTimer();
    } else {
        timerElement.classList.remove("has-text-danger");
        timerElement.classList.add("has-text-primary");
    }

    if ( selectedIndex >= pomodoroTimes.length ) {
        selectedIndex = 0;
    }

    // UI logic:
    timerElement.innerText = formatSeconds(seconds);
}

function formatSeconds( numberOfSeconds ) {
    let minutes = parseInt(numberOfSeconds / 60);
    let seconds = numberOfSeconds % 60;
    return `${minutes}:${seconds}`;
}

function startPomodoroTimer(){
    pomoInterval = setInterval(windClock, 1000);
}

function stopPomodoroTimer() {
    clearInterval(pomoInterval);
}

