const network = await Service.import('network')
const battery = await Service.import('battery')

// Thermal Zone for CPU temp
// Found how to get here https://phoenixnap.com/kb/linux-cpu-temp
const THERMAL_ZONE = 10
const ICON_SIZE = 24
const ICON_TEXT_SPACING = 16

const cpuUsage = Widget.Label({
    label: "69%",
    css: "font-size: 18px; font-weight: bold;"
}).poll(2000, self => {
    Utils.execAsync(
        [`bash`, `-c`, `echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%`]
    )
        .then(out => self.label = out)
        .catch(err => print(err));
})

const cpuTemp = Widget.Label({
    css: "font-size: 18px; font-weight: bold;"
}).poll(2000, self => {
    Utils.execAsync(`cat /sys/class/thermal/thermal_zone${THERMAL_ZONE}/temp`)
        .then(out => self.label = out.slice(0, -3) + "°C")
        .catch(err => print(err))
})

const memoryUsage = Widget.Label({
    css: "font-size: 18px; font-weight: bold;",
    justification: "center",
}).poll(2000, self => {
    Utils.execAsync(`bash -c "free | awk '/Mem:/ {print $3/$2*100}'"`)
        .then(out => self.label = Math.round(out).toString() + "%")
        .catch(err => print(err))
})

export const Cpu = () => Widget.Box({
    class_name: "cpu",
    vertical: true,
    spacing: 16,
    hpack: "center",
    css: "min-width: 120px;",
    children: [
        // Title
        Widget.Label({
            label: "CPU",
            justification: "center",
            css: "font-weight: bold; font-size: 22px;"
        }),

        // Usage
        Widget.Box({
            spacing: ICON_TEXT_SPACING,
            hpack: "center",
            children: [
                Widget.Icon({ 
                    icon: "cpu-symbolic",
                    size: ICON_SIZE
                }),
                cpuUsage
            ]
        }),

        // Temperature
        Widget.Box({
            spacing: ICON_TEXT_SPACING,
            hpack: "center",
            children: [
                Widget.Icon({
                    icon: "sensors-temperature-symbolic",
                    size: ICON_SIZE
                }),
                cpuTemp
            ]
        }),
        
    ]
})

export const Memory = () => Widget.Box({
    spacing: 16,
    class_name: "memory",
    vertical: true,
    css: "min-width: 120px;",
    children: [
        // Title
        Widget.Label({
            label: "Memory",
            justification: "left",
            css: "font-weight: bold; font-size: 22px;"
        }),
        
        // Usage
        Widget.Box({
            spacing: ICON_TEXT_SPACING,
            hpack: "center",
            vpack: "start",
            // vexpand: true
            children: [
                Widget.Icon({
                    icon: "memory-symbolic",
                    size: ICON_SIZE
                }),
                memoryUsage
            ]
        }),
    ]
})

const batteryProgress = Widget.CircularProgress({
    child: Widget.Icon({ icon: battery.bind('icon_name') }),
    visible: battery.bind('available'),
    value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
    class_name: battery.bind('charging').as(ch => ch ? 'charging' : ''),
})

