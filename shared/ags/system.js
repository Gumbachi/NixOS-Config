import { Constants } from "./constants.js"

const network = await Service.import('network')
const battery = await Service.import('battery')

// Thermal Zone for CPU temp
// Found how to get here https://phoenixnap.com/kb/linux-cpu-temp
const CPU_TEMP_FILE = Utils.exec(`bash -c "echo $CPU_TEMP_FILE"`)

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
    Utils.execAsync(`cat ${CPU_TEMP_FILE}`)
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
    spacing: Constants.MAIN_BOX_SPACING,
    hpack: "center",
    css: "min-width: 120px;",
    children: [
        // Title
        Widget.Label({
            class_name: "title",
            label: "CPU",
            justification: "center",
        }),

        // Usage
        Widget.Box({
            spacing: Constants.ICON_LABEL_SPACING,
            hpack: "center",
            children: [
                Widget.Icon({ 
                    icon: "cpu-symbolic",
                    size: Constants.SMALL_ICON_SIZE
                }),
                cpuUsage
            ]
        }),

        // Temperature
        Widget.Box({
            spacing: Constants.ICON_LABEL_SPACING,
            hpack: "center",
            children: [
                Widget.Icon({
                    icon: "sensors-temperature-symbolic",
                    size: Constants.SMALL_ICON_SIZE
                }),
                cpuTemp
            ]
        }),
        
    ]
})

export const Memory = () => Widget.Box({
    spacing: Constants.MAIN_BOX_SPACING,
    class_name: "memory",
    vertical: true,
    css: "min-width: 120px;",
    children: [
        // Title
        Widget.Label({
            class_name: "title",
            label: "Memory",
            justification: "left",
        }),
        
        // Usage
        Widget.Box({
            spacing: Constants.ICON_LABEL_SPACING,
            hpack: "center",
            vpack: "start",
            // vexpand: true
            children: [
                Widget.Icon({
                    icon: "memory-symbolic",
                    size: Constants.SMALL_ICON_SIZE
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

