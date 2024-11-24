import { Constants } from "../constants.js";
import { Container, Title } from "./components.js";
import { Config } from "../interfaces/settings.js";

// Thermal Zone for CPU temp
// Found how to get here https://phoenixnap.com/kb/linux-cpu-temp
// const CPU_TEMP_FILE = Utils.exec(`bash -c "echo $CPU_TEMP_FILE"`)


const cpuPercent = Variable(0, {
  poll: [
    2000, // Interval
    [`bash`, `-c`, `echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]`],
  ]
})

const memPercent = Variable(0, {
  poll: [
    2000,
    `bash -c "free | awk '/Mem:/ {print $3/$2*100}'"`,
    out => Math.round(out)
  ]
})

const cpuTemp = Variable(0, {
  poll: [
    2000,
    `echo 0`,
    // `cat ${Config.cpuTempFile} 2> /dev/null`,
    out => parseInt(out.slice(0, -3))
  ]
})

const diskPercent = Variable(0, {
  poll: [
    60000,
    `bash -c "df -h / | awk '/dev/ {print $5}'"`,
    out => out.replace("%", "")
  ]
})

const SystemStat = (icon, label) => Widget.Box({
  class_name: "stat",
  spacing: 16,
  hexpand: true,
  hpack: "center",
  children: [
    Widget.Icon({
      icon: icon,
      size: Constants.SMALL_ICON_SIZE
    }),

    Widget.Label({
      class_name: "value",
      label: label,
      justification: "fill",
      maxWidthChars: 5,
    })
  ]
})

export function System() {

  const cpu = Widget.Box({
    vertical: true,
    spacing: 24,
    children: [
      // Cpu Usage
      SystemStat(
        "cpu-symbolic", 
        cpuPercent.bind().as(u => `${u}%`)
      ),

      // Cpu Temperature
      SystemStat(
        "sensors-temperature-symbolic",
        cpuTemp.bind().as(t => `${t}°C`)
      )
    ]
  })

  const memdisk = Widget.Box({
    vertical: true,
    spacing: 24,
    children: [
      // Memory Usage
      SystemStat(
        "memory-symbolic",
        memPercent.bind().as(u => `${u}%`)
      ),

      // Disk Usage
      SystemStat(
        "drive-harddisk-system-symbolic",
        diskPercent.bind().as(u => `${u}%`)
      )
    ]
  })


  return Container({
    name: "system",
    children: [
      Title("System"),
      Widget.Box({
        children: [
          cpu,
          memdisk,
        ]
      }),
    ]
  })

}
