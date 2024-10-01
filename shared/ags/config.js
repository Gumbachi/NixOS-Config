import { PowerMenu } from "./components/powermenu.js"
import { Media } from "./components/mediaplayer.js"
import { VolumeMenu } from "./components/volume.js"
import { Datetime } from "./components/time.js" 
import { System } from "./components/system.js"
import { Network } from "./components/network.js" 
import { Workspaces } from "./components/workspaces.js" 
import { NightLightMenu, NightLightButton } from "./components/nightlight.js"
import { NotificationPopups, NotificationTray } from "./components/notifications.js"
import { Timers } from "./components/timers.js"
import { SystemTray } from "./components/tray.js"

const Dashboard = () => Widget.Box({
    spacing: 8,
    class_name: "dashboard",
    homogeneous: false,
    vertical: false,
    children: [
        Timers(),
        
        Widget.Box({
            spacing: 8,
            vertical: true,
            children: [
                Widget.Box({
                    spacing: 8,
                    children: [
                        VolumeMenu(),
                        Network(),
                        System(),
                        // Cpu(),
                        // Memory(),
                    ]
                }),
                Widget.Box({
                    spacing: 8,
                    children: [
                        Media(),
                        Workspaces()
                    ]
                }),
                Widget.Box({
                    spacing: 8,
                    hexpand: true,
                    children: [
                        Datetime(),
                        NightLightButton(),
                        PowerMenu(),
                    ]
                })
            ]
        }),

        SystemTray()
    ]
})


const DashboardWindow = (monitor = 0) => Widget.Window({
    name: 'dashboard',
    keymode: "exclusive",
    layer: 'overlay',
    exclusivity: "exclusive",
    monitor: monitor,
    // margins: [10, 10],
    setup: self => {
        self.keybind("Escape", () => { App.closeWindow('dashboard')})
    },
    child: Dashboard(),
})

// const testWindow = Widget.Window({
//     name: "debugWindow",
//     vexpand: true,
//     hexpand: true,
//     layer: "overlay",
//     css: "background-color: red;",
//     child: Widget.Label({
//         wrap: true,
//         css: "min-width: 1500px;",
//         label: "howdy",
//     })
// })

App.config({
    style: './style.css',
    windows: [
        DashboardWindow(),
        NotificationPopups(2)
    ] 
})


