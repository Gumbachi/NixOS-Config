import { Constants } from "../constants.js";
import { Container, Title } from "./components.js";

// Thermal Zone for CPU temp
// Found how to get here https://phoenixnap.com/kb/linux-cpu-temp
const CPU_TEMP_FILE = Utils.exec(`bash -c "echo $CPU_TEMP_FILE"`)

const SystemIcon = (icon) => Widget.Icon({
  icon: icon,
  size: Constants.SMALL_ICON_SIZE
})

const boxDetails = {
  spacing: 16,
  hexpand: true,
  hpack: "center"
}

const CpuUsage = () => Widget.Box({
  ...boxDetails,
  class_name: "cpu",
  children: [
    SystemIcon("cpu-symbolic"),

    Widget.Label({
      class_name: "value",
      label: "0%", // Leave this as command takes a sec to get initial value
      justification: "fill",
      maxWidthChars: 4,
    }).poll(2000, self => {
      Utils.execAsync([`bash`, `-c`, `echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%`])
        .then(out => self.label = out)
        .catch(err => console.error(err))
    })
  ]
})

const CpuTemp = () => Widget.Box({
  ...boxDetails,
  class_name: "cpu-temp",
  children: [
    SystemIcon("sensors-temperature-symbolic"),
    Widget.Label({
      class_name: "value",
      justification: "fill",
    }).poll(2000, self => {
      Utils.execAsync(`cat ${CPU_TEMP_FILE}`)
        .then(out => self.label = out.slice(0, -3) + "°C")
        .catch(err => console.error(err))
    })
  ]
})

const MemoryUsage = () => Widget.Box({
  ...boxDetails,
  class_name: "memory",
  children: [
    SystemIcon("memory-symbolic"),
    Widget.Label({
      class_name: "value",
      justification: "fill"
    }).poll(2000, self => {
      Utils.execAsync(`bash -c "free | awk '/Mem:/ {print $3/$2*100}'"`)
        .then(out => self.label = Math.round(out).toString() + "%")
        .catch(err => console.error(err))
    })
  ]
})

const DiskUsage = () => Widget.Box({
  ...boxDetails,
  class_name: "disk",
  children: [
    SystemIcon("drive-harddisk-system-symbolic"),

    Widget.Label({
      class_name: "value",
      justification: "fill"
    }).poll(60000, self => {
      Utils.execAsync(`bash -c "df -h / | awk '/dev/ {print $5}'"`)
        .then(out => self.label = out)
        .catch(err => console.error(err))
    })
  ]
})

export function System() {

  const cpu = Widget.Box({
    vertical: true,
    spacing: 24,
    children: [
      CpuUsage(),
      CpuTemp()
    ]
  })

  const memdisk = Widget.Box({
    vertical: true,
    spacing: 24,
    children: [
      MemoryUsage(),
      DiskUsage()
    ]
  })


  return Container({
    name: "system",
    children: [
      Title("System"),
      Widget.Box({
        children: [
          cpu,
          memdisk
        ]
      }),
    ]
  })

}
