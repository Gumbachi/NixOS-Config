import { Constants } from "../constants.js"
import { Title } from "./components.js"
import { TIMERS } from "../interfaces/timers.js"
import Gtk from 'gi://Gtk'

// const TIMERS_FILE = "/home/jared/NixOS-Config/shared/ags/settings/timers.json
//
// class Timer {
//   constructor(id, name, duration, remainingDuration, isRunning) {
//     this.id = id
//     this.name = name
//     this.duration = duration
//     this.remainingDuration = remainingDuration
//     this.isRunning = isRunning
//   }
// }
//
// function fetchTimers() {
//   console.log("Fetching Timers")
//   const data = Utils.readFile(TIMERS_FILE)
//   return JSON.parse(data)
//     .map(entry => new Timer(
//       entry.id,
//       entry.name,
//       entry.duration,
//       entry.remainingDuration,
//       entry.isRunning
//     ))
// }
//
// function updateTimers(timers) {
//   const data = JSON.stringify(timers)
//   Utils.writeFile(data, TIMERS_FILE)
//     .catch(err => console.error(`Error writing file: ${err}`))
// }

// const generateId = () => (new Date()).getTime()

// take a number in seconds and format as a string 60 => "1:00"
// function formattime(duration) {
//   const hours = Math.floor(duration / 3600)
//   const minutes = Math.floor(duration / 60 % 60)
//   const seconds = duration % 60
//
//   const showHours = hours != 0
//   const showMinutes = showHours || minutes != 0
//
//   const fMinutes = showHours ? String(minutes).padStart(2, '0') : `${minutes}`
//   const fSeconds = String(seconds).padStart(2, '0')
//
//   return `${showHours ? `${hours}:` : ""}${showMinutes ? `${fMinutes}:` : ""}${fSeconds}`
// }

// // Take a string and format with colons "1000" => "10:00" 
// function formatDurationInput(text) {
//   const input = text.split("").reverse()
//   console.log(input)
//
//   var output = []
//
//   const chunkSize = 2;
//   for (let i = 0; i < input.length; i += chunkSize) {
//     const chunk = input.slice(i, i + chunkSize);
//     output.push([chunk.reverse().join("")])
//   }
//
//   const formatted = output.reverse().join(":")
//   console.log(formatted)
//
// }

// const timers = Variable(fetchTimers())

const timers = Variable(TIMERS)

function TimerWidget(timer) {

  const timerState = Variable(timer)

  const timerNameState = Variable({
    text: timer.name,
    editable: false
  })

  const timerDurationState = Variable({
    duration: timer.duration,
    editable: false
  })

  // const timeLeft = Variable(timer.remainingDuration)
  // const isRunning = Variable(timer.isRunning)
  // const timerName = Variable(timer.name)
  //
  // const isNameEditable = Variable(false)
  // const isDurationEditable = Variable(false)

  timerState.connect('changed', ({ value }) => {
    console.log(`TimerState changed: ${value}`)
    // timer.remainingDuration = value
    // const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
    // updateTimers(updatedTimers)
  })

  timerNameState.connect('changed', ({ value }) => {
    console.log(`TimerNameState changed: ${value}`)
    // timer.isRunning = value
    // const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
    // updateTimers(updatedTimers)
  })

  timerDurationState.connect("changed", ({ value }) => {
    console.log(`TimerDurationState changed: ${value}`)
    // timer.name = value
    // const updatedTimers = timers.value.map(t => t.id == timer.id ? timer : t)
    // updateTimers(updatedTimers)
  })

  const name = Widget.EventBox({
    child: Widget.Label({
      class_name: "name",
      label: timerState.bind("name"),
      wrap: true,
      xalign: 0,
      truncate: "end",
      hexpand: true
    }),
    on_primary_click: (_) => timerNameState.value = { ...timerNameState.value, editable: true }
  })

  const editableName = Widget.Entry({
    class_name: "name-edit",
    text: timerNameState.bind("text"),
    on_accept: ({ text }) => {
      timerNameState.value = { text: text, editable: false }
    },
    hexpand: true,
  })

  const deleteButton = Widget.Button({
    class_name: "delete",
    vpack: "center",
    child: Widget.Icon("window-close-symbolic"),
    on_clicked: _ => {
      console.log(`Deleting Timer: ${timer.name}`)
      timers.value.removeTimer(timer)
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
    shown: timerNameState.bind("editable").as(b => b ? "editable" : "uneditable")
  })

  const timeLeftLabel = Widget.Label({
    class_name: "time",
    justification: "fill",
    hexpand: true,
    label: timerState.bind().as(t => t.formattedTime)
  })
    .poll(1000, _ => {

      // End Timer and alert
      if (timerState.value.remainingDuration === 0) {
        timerState.value == { ...timerState.value, isRunning: false }
        Utils.notify({
          summary: "Timer Finished",
          body: `${timerState.name} is done`,
          iconName: "timer-symbolic"
        })
      }

      // Tick time down by 1 second
      if (timerState.value.isRunning == true && timerState.value.remainingDuration > 0) {
        timerState.value = { ...timerState.value, remainingDuration: timerState.value.remainingDuration - 1 }
      }

    })

  const playButton = Widget.Button({
    on_clicked: _ => timerState.value = { ...timerState.value, isRunning: !timerState.value.isRunning },
    child: Widget.Icon({
      icon: timerState.bind("isRunning")
        .as(running => running ? "media-playback-pause-symbolic" : "media-playback-start-symbolic")
    })
  })

  const resetButton = Widget.Button({
    on_clicked: _ => timerState.value = { 
      ...timerState,
      isRunning: false,
      remainingDuration: timerState.value.duration
    },
    child: Widget.Icon("system-restart-symbolic")
  })

  const durationEventBox = Widget.EventBox({
    child: timeLeftLabel,
    on_primary_click: (_) => timerDurationState.value = { ...timerDurationState.value, editable: true }
  })

  const editableDuration = Widget.Entry({
    class_name: "time-edit",
    text: String(timerState.value.duration),
    max_length: 6,
    xalign: 0.5,
    on_accept: ({ text }) => {
      const isValid = /^\d+$/.test(text)

      // Accept Time and set new values
      if (isValid) {
        const newDuration = parseInt(text)
        timerState.value = { ...timerState, duration: newDuration, durationRemaining: newDuration, isRunning: false } 
      }

      // Reset Text Box
      timerDurationState.value = { ...timerDurationState.value, editable: false }

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
    shown: timerDurationState.bind("editable").as(b => b ? "editable" : "uneditable")
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
    on_clicked: _ => {
      console.log("Adding Timer")
      timers.value.addDefaultTimer()
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
