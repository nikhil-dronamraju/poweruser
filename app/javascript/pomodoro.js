let timeElapsed = 0;
let secs = 1500;
let pomoInterval;


function formatSeconds() {
    const pad = (n) => n < 10 ? `0${n}` : n;

    const m = Math.floor(secs / 60);
    const s = Math.floor(secs - m * 60);

    document.getElementById("pomodoro_time").textContent = `${pad(m)}:${pad(s)}`;

    secs -= 1;
    timeElapsed += 1;

    if (timeElapsed === 1500 || timeElapsed === 3300 || timeElapsed === 5100 || timeElapsed === 5700  ) {
        stopPomodoroTimer();
        secs = 300;
        document.getElementById("pomodoro_status").textContent = "Break";
        document.getElementById("pomodoro_time").textContent = `${pad(m)}:${pad(s)}`;
    }

    if ( timeElapsed === 1800 || timeElapsed === 3600 || timeElapsed === 5400 || timeElapsed === 6500 ) {
        secs = 2500;
        document.getElementById("pomodoro_status").textContent = "Active";
        document.getElementById("pomodoro_time").textContent = `${pad(m)}:${pad(s)}`;
    }

    if (timeElapsed > 6500) {
        document.getElementById("pomodoro_status").textContent = "Long break";
        secs = 900;
        document.getElementById("pomodoro_time").textContent = `${pad(m)}:${pad(s)}`;
    }

    if ( timeElapsed >= 7400 ) {
        document.getElementById("pomodoro_status").textContent = "Active";
        secs = 1500;
        timeElapsed = 0;
        document.getElementById("pomodoro_time").textContent = `${pad(m)}:${pad(s)}`;
    }
}

function startPomodoroTimer() {
    pomoInterval = setInterval(formatSeconds, 1500,  1000);
}

function stopPomodoroTimer() {
    clearInterval(pomoInterval);
}