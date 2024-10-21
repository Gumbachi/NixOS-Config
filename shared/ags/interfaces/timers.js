
const TIMERS_FILE = "/home/jared/NixOS-Config/shared/ags/settings/timers.json"

const generateId = () => (new Date()).getTime()

class Timer {
  constructor(id, name, duration, remainingDuration, isRunning) {
    this.id = id
    this.name = name
    this.duration = duration
    this.remainingDuration = remainingDuration
    this.isRunning = isRunning
  }

  get formattedTime() {
    const hours = Math.floor(duration / 3600)
    const minutes = Math.floor(duration / 60 % 60)
    const seconds = duration % 60

    const showHours = hours != 0
    const showMinutes = showHours || minutes != 0

    const fMinutes = showHours ? String(minutes).padStart(2, '0') : `${minutes}`
    const fSeconds = String(seconds).padStart(2, '0')

    return `${showHours ? `${hours}:` : ""}${showMinutes ? `${fMinutes}:` : ""}${fSeconds}` 
  }
}

class _Timers {

  constructor(file) {
    this.timers = JSON.parse(Utils.readFile(file)).map(t => new Timer(t))
  }

  _updateTimers(timers) {
    Utils.writeFile(JSON.stringify(timers), file)
      .then(_ => this.timers = timers)
      .catch(err => console.error(`Error writing file: ${err}`))
  }

  addTimer(timer) {
    const newTimers = this.timers.concat([timer])
    this._updateTimers(newTimers)
  }

  addDefaultTimer() {
    const newTimers = this.timers.concat([
      new Timer(generateId(), "Click to edit", 60, 60, false)
    ])

    this._updateTimers(newTimers)
  }

  updateTimer(timer) {
    const updatedTimers = this.timers.map(t => t.id == timer.id ? timer : t)
    this._updateTimers(updatedTimers)
  }

  removeTimer(timer) {
    const updatedTimers = this.timers.filter(t => t.id !== timer.id)
    this._updateTimers(updatedTimers)
  }

}

export const TIMERS = new _Timers(TIMERS_FILE)
