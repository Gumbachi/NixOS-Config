import { Constants } from "../constants.js"
import { Title } from "./components.js"
import { timerManager, Timer } from "../interfaces/timer-manager.js"
import Gtk from 'gi://Gtk'

function TimerWidget(timer) {

  // State values for editing text fields
  // Timer state fields are specified within the Timer and TimerManager classes
  const isNameEditable = Variable(false)
  const isDurationEditable = Variable(false)

  const name = Widget.EventBox({
    child: Widget.Label({
      class_name: "name",
      label: timer.name.bind(),
      wrap: true,
      xalign: 0,
      truncate: "end",
      hexpand: true
    }),
    on_primary_click: (_) => isNameEditable.value = true
  })

  const editableName = Widget.Entry({
    class_name: "name-edit",
    text: timer.name.bind(),
    hexpand: true,
    on_accept: ({ text }) => { 
      timer.changeName(text)
      timerManager.saveCurrentTimers()
      isNameEditable.value = false
    }
  })

  const deleteButton = Widget.Button({
    class_name: "delete",
    vpack: "center",
    child: Widget.Icon("window-close-symbolic"),
    on_clicked: _ => {
      console.log(`Deleting Timer: ${timer.name.value}`)
      timerManager.removeTimer(timer)
    }
  })

  const nameStack = Widget.Stack({
    children: {
      "editable": editableName,
      "uneditable": Widget.Box({
        hexpand: true,
        vexpand: false,
        children: [ name, deleteButton ]
      }),
    },
    shown: isNameEditable.bind().as(e => e ? "editable" : "uneditable")
  })

  const timeLeftLabel = Widget.Label({
    class_name: "time",
    justification: "fill",
    hexpand: true,
    label: timer.durationRemaining.bind().as(d => Timer.formatDuration(d))
  })
    .poll(1000, _ => {

      // End Timer and alert
      if (timer.isDone) {
        timer.end()
        Utils.notify({
          summary: "Timer Finished",
          body: `${timer.name.value} is done`,
          iconName: "timer-symbolic"
        })
      }

      // Tick time down by 1 second
      if (timer.canContinue) {
        timer.tick()
      }

    })

  const playButton = Widget.Button({
    child: Widget.Icon({ 
      icon: timer.isRunning.bind().as(ir => 
        ir ? "media-playback-pause-symbolic" : "media-playback-start-symbolic"
      )
    }),
    on_clicked: _ => timer.toggleRunning()
  })

  const resetButton = Widget.Button({
    child: Widget.Icon("system-restart-symbolic"),
    on_clicked: _ => timer.reset()
  })

  const durationEventBox = Widget.EventBox({
    child: timeLeftLabel,
    on_primary_click: (_) => isDurationEditable.value = true 
  })

  const editableDuration = Widget.Entry({
    class_name: "time-edit",
    text: String(timer.durationTotal.value),
    max_length: 6,
    xalign: 0.5,
    hexpand: true,
    on_accept: ({ text }) => {
      // Accept Time and set new values
      if (Timer.checkValidDuration(text)) {
        const newDuration = eval(text)
        timer.changeDuration(newDuration)
        timerManager.saveCurrentTimers()
      }

      // Reset Text Box
      isDurationEditable.value = false

    }
  })


  const timeStack = Widget.Stack({
    children: {
      "editable": editableDuration,
      "uneditable": Widget.Box({
        children: [ playButton, durationEventBox, resetButton ]
      }),
    },
    shown: isDurationEditable.bind().as(e => e ? "editable" : "uneditable")
  })



  return Widget.Box({
    class_name: "timer container",
    vertical: true,
    children: [ nameStack, timeStack ]
  })
}



function TimerList() {
  return new Gtk.ScrolledWindow({
    child: Widget.Box({
      vexpand: true,
      spacing: 8,
      vertical: true,
      children: timerManager.timers.bind().as(t => t.map(TimerWidget))
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
      timerManager.addDefaultTimer()
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
