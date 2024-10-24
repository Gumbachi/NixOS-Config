
// Config File these >
const TIMERS_FILE = "/home/jared/NixOS-Config/shared/ags/settings/timers.json"
const TIMER_AUDIO_FILE = "/home/jared/NixOS-Config/shared/ags/resources/ding.mp3"

const generateId = () => (new Date()).getTime()

export class Timer {
  constructor(id, name, durationTotal) {
    this.id = id
    this.name = Variable(name)
    this.durationTotal = Variable(durationTotal)
    this.durationRemaining = Variable(durationTotal)
    this.isRunning = Variable(false)
  }

  stringify() {
    return {
      "id": this.id,
      "name": this.name.value,
      "durationTotal": this.durationTotal.value,
    }
  }

  get isDone() {
    return this.durationRemaining.value === 0 && this.isRunning.value === true
  }

  get canContinue() {
    return this.isRunning.value && this.durationRemaining.value > 0  
  }

  changeDuration(newDuration) {
    this.isRunning.value = false
    this.durationRemaining.value = newDuration
    this.durationTotal.value = newDuration
  }

  changeName(newName) {
    this.name.value = newName
  }

  tick() {
    this.durationRemaining.value -= 1
  }

  sendAlert() {
    Utils.notify({
      summary: "Timer Finished",
      body: `${this.name.value} is done`,
      iconName: "timer-symbolic"
    })
    Utils.execAsync(`play ${TIMER_AUDIO_FILE}`)
  }

  toggleRunning() {
    this.isRunning.value = !this.isRunning.value
  }

  start() {
    this.isRunning.value = true 
  }

  end() {
    this.isRunning.value = false
  }

  reset() {
    this.isRunning.value = false
    this.durationRemaining.value = this.durationTotal.value
  }

  static checkValidDuration(text) {
    const val = eval(text)
    const validInt = val === parseInt(val, 10)  
    const inRange = validInt > 0 && validInt <= 999999
    return validInt && inRange
    // return /^\d+$/.test(text)
  }

  static formatDuration(duration) {
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

class TimerManager {

  constructor(file) {
    this.file = file 

    const data = JSON.parse(Utils.readFile(file))
      .map(obj => new Timer(
        obj.id,
        obj.name,
        obj.durationTotal
      ))

    this.timers = Variable(data)
  }

  getTimers() {
    return this.timers.value
  }

  // Force a save file update
  saveCurrentTimers() {
    this._updateTimers(this.timers.value)
  }

  _updateTimers(timers) {
    const converted = timers.map(t => t.stringify())
    Utils.writeFile(JSON.stringify(converted, null, 2), this.file)
      .then(_ => this.timers.setValue(timers))
      .catch(err => console.error(`Error writing file: ${err}`))
  }

  addTimer(timer) {
    const newTimers = this.getTimers().concat([timer])
    this._updateTimers(newTimers)
  }

  addDefaultTimer() {
    const newTimers = this.getTimers().concat([
      new Timer(generateId(), "Click to edit", 60)
    ])
    this._updateTimers(newTimers)
  }

  updateTimer(timer) {
    const updatedTimers = this.getTimers().map(t => t.id == timer.id ? timer : t)
    this._updateTimers(updatedTimers)
  }

  removeTimer(timer) {
    const updatedTimers = this.getTimers().filter(t => t.id !== timer.id)
    this._updateTimers(updatedTimers)
  }

}

export const timerManager = new TimerManager(TIMERS_FILE)
