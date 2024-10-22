

const timeLabel = Widget.Label({
  class_name: "time",
  label: Utils.exec('date +%R'),
  css: 'font-size: 36px; font-weight: bold'
}).poll(1000, self => {
  Utils.execAsync('date +%R:%S')
    .then(out => self.label = out)
    .catch(err => console.error(err))
})

const dateLabel = Widget.Label({
  class_name: "date",
  label: Utils.exec('date +"%A, %B %d %Y"'),
  css: 'font-size: 24px;'
})

export const Datetime = () => Widget.Box({
  class_name: "datetime container",
  spacing: 8,
  hexpand: true,
  vertical: true,
  children: [
    timeLabel,
    dateLabel
  ],
})
