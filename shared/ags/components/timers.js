import { Constants } from "../constants.js"
import { Title } from "./components.js"
import Gtk from 'gi://Gtk'

const TIMERS_FILE = "/home/jared/NixOS-Config/shared/ags/data/timers.json"

class Timer {
    constructor(id, name, duration, remainingDuration, isRunning) {
        this.id = id
        this.name = name
        this.duration = duration
        this.remainingDuration = remainingDuration
        this.isRunning = isRunning
    }
}

function fetchTimers() {
    console.log("Fetching Timers")
    const data = Utils.readFile(TIMERS_FILE)
    return JSON.parse(data)
        .map(entry => new Timer(
            entry.id,
            entry.name,
            entry.duration,
            entry.remainingDuration,
            entry.isRunning
        ))
}

function updateTimers(timers) {
    const data = JSON.stringify(timers)
    Utils.writeFile(data, TIMERS_FILE)
        .catch(err => console.error(`Error writing file: ${err}`))
}

const generateId = () => (new Date()).getTime()

// Take a number in seconds and format as a string 60 => "1:00"
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

// Take a string and format with colons "1000" => "10:00" 
function formatDurationInput(text) {
    const input = text.split("").reverse()
    console.log(input)

    var output = []
    
    const chunkSize = 2;
    for (let i = 0; i < input.length; i += chunkSize) {
        const chunk = input.slice(i, i + chunkSize);
        output.push([chunk.reverse().join("")])
    }

    const formatted = output.reverse().join(":")
    console.log(formatted)

}

const timers = Variable(fetchTimers())

function TimerWidget(timer) {

    const timeLeft = Variable(timer.remainingDuration)
    const isRunning = Variable(timer.isRunning)
    const timerName = Variable(timer.name)

    const isNameEditable = Variable(false)
    const isDurationEditable = Variable(false)

    timeLeft.connect('changed', ({ value }) => {                        
        timer.remainingDuration = value
        const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
        updateTimers(updatedTimers)
    })

    isRunning.connect('changed', ({ value }) => {                        
        timer.isRunning = value
        const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
        updateTimers(updatedTimers)
    })

    timerName.connect("changed", ({ value }) => {
        timer.name = value
        const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
        updateTimers(updatedTimers)
    })

    const name = Widget.EventBox({
        child: Widget.Label({
            class_name: "name",
            label: timerName.bind(),
            wrap: true,        
            xalign: 0,
            truncate: "end",
            hexpand: true
        }),
        on_primary_click: (_) => isNameEditable.value = true
    })

    const editableName = Widget.Entry({
        class_name: "name-edit",
        text: timerName.bind(),
        on_accept: ({ text }) => {
            timerName.value = text
            isNameEditable.value = false
        },
        hexpand: true,
    })

    const deleteButton = Widget.Button({
        class_name: "delete",
        vpack: "center",
        child: Widget.Icon("window-close-symbolic"),
        on_clicked: self => {
            console.log(`Deleting Timer: ${timer.name}`)
            const updatedTimers = timers.value.filter(t => t.id !== timer.id)
            updateTimers(updatedTimers)
            timers.value = updatedTimers
        }
    })

    const nameStack = Widget.Stack({
        children: {
            "editable": editableName,
            "uneditable": Widget.Box({
                hexpand: true,
                vexpand: false,
                children: [
                    name,
                    deleteButton
                ]
            }),
        },
        shown: isNameEditable.bind().as(b => b ? "editable": "uneditable")
    })

    const timeLeftLabel = Widget.Label({
        class_name: "time",
        justification: "fill",
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
            isRunning.value = false
            timeLeft.value = timer.duration
        },
        child: Widget.Icon("system-restart-symbolic") 
    })

    const durationEventBox = Widget.EventBox({
        child: timeLeftLabel,
        on_primary_click: (_) => isDurationEditable.value = true
    })

    const editableDuration = Widget.Entry({
        class_name: "time-edit",
        text: String(timer.duration),
        max_length: 6,
        xalign: 0.5,
        on_accept: ({ text }) => {
            const isValid = /^\d+$/.test(text)
            if (isValid) {
                timer.duration = parseInt(text)
                timer.durationRemaining = timer.duration
                const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
                updateTimers(updatedTimers)
            }
            isDurationEditable.value = false
            isRunning.value = false
            timeLeft.value = timer.duration
        },
        hexpand: true,
    })


    const timeStack = Widget.Stack({
        children: {
            "editable": editableDuration,
            "uneditable": Widget.Box({
                children: [
                    playButton,
                    durationEventBox,
                    resetButton
                ]
            }),
        },
        shown: isDurationEditable.bind().as(b => b ? "editable": "uneditable")
    })
    
    

    return Widget.Box({    
        class_name: "timer container",
        vertical: true,
        children: [
            nameStack,
            timeStack
        ]
    })
}



function TimerList() {
    return new Gtk.ScrolledWindow({
        child: Widget.Box({
            vexpand: true,
            spacing: 8,
            vertical: true,
            children: timers.bind().as(timers => timers.map(TimerWidget))
        })
    })
}

export function Timers() {       
    
    const addTimerButton = Widget.Button({
        class_name: "add",
        hexpand: true,
        child: Widget.Icon("list-add-symbolic"),
        on_clicked: self => {
            console.log("Adding Timer")
            const updatedTimers = [
                ...timers.value,
                new Timer(generateId(), "Click to edit", 60, 60, false),
            ]
            updateTimers(updatedTimers)
            timers.value = updatedTimers
        }
    })
    
    return Widget.Box({
        class_name: "timers container",
        spacing: Constants.MAIN_BOX_SPACING,
        vertical: true,
        children: [
            Title("Timers"),
            TimerList(),
            addTimerButton
        ]
    })
}
