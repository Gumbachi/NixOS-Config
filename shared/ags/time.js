

const timeLabel = Widget.Label({
    label: Utils.exec('date +%R'),
    css: 'font-size: 36px; font-weight: bold'
}).poll(1000, self => {
    Utils.execAsync('date +%R:%S')
        .then(out => self.label = out)
        .catch(err => print(err))
})

const dateLabel = Widget.Label({
    label: Utils.exec('date +"%A, %B %d %Y"'),
    css: 'font-size: 24px;'
})

export function Time() {
    return Widget.Box({
        class_name: "time",
        spacing: 8,
        hexpand: true,
        vertical: true,
        children: [
            timeLabel,
            dateLabel
        ],
    })
} 
