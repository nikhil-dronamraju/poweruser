let pomodoroTimes = [ 1500, 300, 1500, 300, 1500, 300, 1500, 300, 1800 ];
let selectedIndex = 0;
let seconds = pomodoroTimes[ selectedIndex ];
let pomodoroInterval;

function formatSeconds( numberOfSeconds ) {
    let minutes = parseInt(numberOfSeconds / 60);
    let seconds = numberOfSeconds % 60;
    if (seconds < 10) {
        seconds = `0${seconds}`;
    }
    return `${minutes}:${seconds}`;
}

function initializeTimer(){
    const timerElement = document.getElementById("pomodoro_time");
    if (sessionStorage.userTime) {
        let userTime = sessionStorage.getItem("userTime");
        timerElement.innerText = formatSeconds(userTime);
    } else {
        sessionStorage.setItem("userTime", seconds);
        timerElement.innerText = formatSeconds(seconds);
    }
}

function windClock(){
    if (sessionStorage.userTime) {
        seconds = parseInt(sessionStorage.getItem("userTime"));
    }
    seconds -= 1;
    sessionStorage.setItem("userTime", seconds);
    initializeTimer();
    if (seconds === 0) {
        stopPomodoroTimer();
        selectedIndex += 1;
        seconds = pomodoroTimes[selectedIndex];
        sessionStorage.setItem("userTime", seconds);
        initializeTimer();
    }
    if (selectedIndex === 8) {
        stopPomodoroTimer();
        selectedIndex = 0;
        seconds = pomodoroTimes[selectedIndex];
        sessionStorage.setItem("userTime", seconds);
        initializeTimer();
    }
}

function startPomodoroTimer(){
    if (pomodoroInterval) {
        stopPomodoroTimer();
    }
    pomodoroInterval = setInterval(windClock, 1000);
}

function stopPomodoroTimer() {
    clearInterval(pomodoroInterval);
}

initializeTimer();

