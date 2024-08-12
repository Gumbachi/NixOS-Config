
console.log(App.configDir)

const DASHBOARD_NAME = 'dashboard'

const timeBox = Widget.Box({
  class_name: "time",
  spacing: 8,
  vertical: true,
  children: [
    Widget.Label({
      label: Utils.exec('date +%R'),
      css: 'font-size: 36px; font-weight: bold'
    }),
    Widget.Label({
      label: Utils.exec('date +"%A, %B %d %Y"'),
      css: 'font-size: 24px;'
    })
  ],
})

const shutdownButton = Widget.Button({
  child: Widget.Icon({
    icon: 'system-shutdown',
    size: 64
  }),
  onClicked: () => Utils.exec('systemctl poweroff')
})

const rebootButton = Widget.Button({
  child: Widget.Icon({
    icon: 'system-reboot',
    size: 64 
  }),
  onClicked: () => Utils.exec('reboot')
})


const lockButton = Widget.Button({
  child: Widget.Icon({
    icon: 'system-lock-screen',
    size: 64
  }),
  onClicked: () => Utils.exec('hyprlock')
})

const dashboardBox = Widget.Box({
  spacing: 8,
  homogeneous: true,
  vertical: false,
  children: [
    timeBox,
    lockButton,
    rebootButton,
    shutdownButton
  ]
})

const dashboardWindow = Widget.Window({
  name: 'dashboard',
  setup: self => self.keybind("Escape", () => {
    App.closeWindow('dashboard')
  }),
  child: dashboardBox,
})

App.config({
  style: './style.css',
  windows: [dashboardWindow] 
})


Utils.monitorFile(
  `./style.css`,

  function() {
    const css = `./style.css`
    App.resetCss()
    App.applyCss(css)
  },
)
