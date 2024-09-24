import { Constants } from "../constants.js";
import { Title } from "./components.js";

// Thermal Zone for CPU temp
// Found how to get here https://phoenixnap.com/kb/linux-cpu-temp
const CPU_TEMP_FILE = Utils.exec(`bash -c "echo $CPU_TEMP_FILE"`)

export function Cpu() {

    const CpuUsage = () => Widget.Label({ 
        class_name: "value",
        label: "0%", // Leave this as command takes a sec to get initial value
        justification: "fill",
    }).poll(2000, self => {
        Utils.execAsync([`bash`, `-c`, `echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%`])
            .then(out => self.label = out)
            .catch(err => print(err));
    })
    
    const CpuTemp = () => Widget.Label({ 
        class_name: "value",        
        justification: "fill",
    }).poll(2000, self => {
        Utils.execAsync(`cat ${CPU_TEMP_FILE}`)
            .then(out => self.label = out.slice(0, -3) + "°C")
            .catch(err => print(err))
    })
    
    return Widget.Box({
        class_name: "cpu container",
        vertical: true,
        spacing: Constants.MAIN_BOX_SPACING,
        children: [
            Title("CPU"),

            // Usage
            Widget.Box({
                class_name: "usage",
                hpack: "center",
                spacing: 16,
                children: [
                    Widget.Icon({ 
                        icon: "cpu-symbolic",
                        size: Constants.SMALL_ICON_SIZE
                    }),
                    CpuUsage()
                ]
            }),
    
            // Temperature
            Widget.Box({
                class_name: "temp",
                spacing: 16,
                hpack: "center",
                children: [
                    Widget.Icon({
                        icon: "sensors-temperature-symbolic",
                        size: Constants.SMALL_ICON_SIZE
                    }),
                    CpuTemp()
                ]
            }),
            
        ]
    })  
}

export function Memory() {

    const MemoryUsage = () => Widget.Label({
        class_name: "value",
        justification: "fill"
    }).poll(2000, self => {
        Utils.execAsync(`bash -c "free | awk '/Mem:/ {print $3/$2*100}'"`)
            .then(out => self.label = Math.round(out).toString() + "%")
            .catch(err => print(err))
    })  

    const DiskUsage = () => Widget.Label({
        class_name: "value",
        justification: "fill"
    }).poll(60000, self => {
        Utils.execAsync(`bash -c "df -h / | awk '/dev/ {print $5}'"`)
            .then(out => self.label = out)
            .catch(err => print(err))
    })  

    return Widget.Box({
        spacing: Constants.MAIN_BOX_SPACING,
        class_name: "memory container",
        vertical: true,
        children: [
            Title("Memory"),
    
            // Memory Usage
            Widget.Box({
                class_name: "usage",
                hpack: "center",
                spacing: 16,
                children: [
                    Widget.Icon({
                        icon: "memory-symbolic",
                        size: Constants.SMALL_ICON_SIZE
                    }),
                    MemoryUsage()
                ]
            }),

            // Disk Usage
            Widget.Box({
                class_name: "usage",
                hpack: "center",
                spacing: 16,
                children: [
                    Widget.Icon({
                        icon: "drive-harddisk-system-symbolic",
                        size: Constants.SMALL_ICON_SIZE
                    }),
                    DiskUsage()
                ]
            }),
        ]
    })    
} 
