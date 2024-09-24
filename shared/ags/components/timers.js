import { Constants } from "../constants.js"
import { Title } from "./components.js"

const TIMERS_FILE = "/home/jared/NixOS-Config/shared/ags/data/timers.json"

class Timer {
    constructor(name, duration) {
        this.name = name
        this.duration = duration
    }
}

function fetchTimers() {
    console.log("Fetching Timers")
    const data = Utils.readFile(TIMERS_FILE)
    return JSON.parse(data)
        .map(entry => new Timer(entry.name, entry.duration))
}

function addTimer(timers) {
    const data = JSON.stringify(timers)
    Utils.writeFile(data, TIMERS_FILE)
        .then(print("Wrote Timers"))
        .catch(err => print(`Error writing file: ${err}`))
}

function formatTime(duration) {
    const hours = Math.floor(duration / 3600)
    const minutes = Math.floor(duration / 60 % 60)
    const seconds = duration % 60
    
    const showHours = hours != 0
    const showMinutes = showHours || minutes != 0

    const fMinutes = showHours ? String(minutes).padStart(2, '0') : `${minutes}` 
    const fSeconds = String(seconds).padStart(2, '0')
    
    return `${showHours ? `${hours}:` : ""}${showMinutes ? `${fMinutes}:` : ""}${fSeconds}`
}

const timers = Variable(fetchTimers())

function TimerWidget(timer) {

    const timeLeft = Variable(timer.duration)
    const isRunning = Variable(false)
    
    const name = Widget.Label({
        class_name: "name",
        label: timer.name,
        wrap: true,        
        xalign: 0,
        truncate: "end"
    })

    const timeLeftLabel = Widget.Label({
        class_name: "time",
        justification: "right",
        hexpand: true,
        label: timeLeft.bind().as(formatTime)
    })
        .poll(1000, self => {
            if (timeLeft.value === 1) {
                timeLeft.value = timer.duration
                isRunning.value = false
                Utils.notify({
                    summary: "Timer Finished",
                    body: `${timer.name} is done`,
                    iconName: "timer-symbolic"
                })
            }

            if (isRunning.value == true && timeLeft.value > 0) {
                timeLeft.value -= 1
            }
        })

    const playButton = Widget.Button({
        on_clicked: self => isRunning.value = !isRunning.value,
        child: Widget.Icon({ 
            icon: isRunning.bind().as(
                running => running ? "media-playback-pause-symbolic": "media-playback-start-symbolic"
            )
        })
    })

    const resetButton = Widget.Button({
        on_clicked: self => { 
            timeLeft.value = timer.duration
            isRunning.value = false
        },
        child: Widget.Icon("system-restart-symbolic") 
    })
    

    return Widget.Box({    
        class_name: "timer container",
        vertical: true,
        children: [
            name,
            Widget.Box({
                children: [
                    playButton,
                    timeLeftLabel,
                    resetButton
                ]
            })
        ]
    })
}

const TimerList = () => Widget.Box({
    spacing: 8,
    vertical: true,
    children: timers.bind()
        .as(timers => timers.map(TimerWidget))
})

export function Timers() {       
    return Widget.Box({
        class_name: "timers container",
        spacing: Constants.MAIN_BOX_SPACING,
        vertical: true,
        children: [
            Title("Timers"),
            TimerList()
        ]
    })
}
