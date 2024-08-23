import { PowerMenu } from "./powermenu.js"
import { Media } from "./mediaplayer.js"
import { VolumeMenu } from "./volume.js"
import { Datetime } from "./time.js" 
import { Cpu, Memory } from "./system.js"
import { Network } from "./network.js" 
import { Workspaces } from "./workspaces.js" 
import { NightLightMenu, NightLightButton } from "./nightlight.js"
import { NotificationPopups, NotificationTray } from "./notifications.js"

const Dashboard = () => Widget.Box({
    spacing: 8,
    class_name: "dashboard",
    homogeneous: false,
    vertical: false,
    children: [
        Widget.Box({
            spacing: 8,
            vertical: true,
            children: [
                Widget.Box({
                    spacing: 8,
                    children: [
                        VolumeMenu(),
                        Network(),
                        Cpu(),
                        Memory(),
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

        NotificationTray()
    ]
})


const dashboardWindow = Widget.Window({
    name: 'dashboard',
    keymode: 'on-demand',
    layer: 'overlay',
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
        dashboardWindow,
        NotificationPopups()
    ] 
})


