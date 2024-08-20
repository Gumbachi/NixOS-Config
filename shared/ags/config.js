import { PowerMenu } from "./powermenu.js"
import { Media } from "./mediaplayer.js"
import { VolumeMenu } from "./controls.js"
import { Time } from "./time.js" 
import { Cpu, Memory } from "./system.js"
import { Network } from "./network.js" 
import { Workspaces } from "./workspaces.js" 
import { NightLightMenu, NightLightButton } from "./nightlight.js"

// console.log(App.configDir)

const dashboardBox = Widget.Box({
    spacing: 8,
    class_name: "dashboard",
    homogeneous: false,
    vertical: true,
    children: [
        Widget.Box({
            spacing: 8,
            children: [
                Network(),
                Cpu(),
                Memory(),
                Workspaces()
            ]
        }),
        Widget.Box({
            spacing: 8,
            children: [
                Media(),
                VolumeMenu()
            ]
        }),
        Widget.Box({
            spacing: 8,
            hexpand: true,
            children: [
                Time(),
                NightLightButton(),
                PowerMenu(),
            ]
        })
    ]
})

const dashboardWindow = Widget.Window({
    name: 'dashboard',
    keymode: 'on-demand',
    layer: 'overlay',
    setup: self => {
        self.keybind("Escape", () => { App.closeWindow('dashboard')})
    },
    child: dashboardBox,
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
        dashboardWindow
    ] 
})


