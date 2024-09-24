import { Constants } from "../constants.js";
import { Title } from "./components.js"; 

const hyprland = await Service.import('hyprland')

const focusedTitle = Widget.Label({
    label: hyprland.active.client.bind('title'),
    visible: hyprland.active.client.bind('address')
        .as(addr => addr !== "0x"),
})

const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`);

const workspaceLabels = {
    1: "1"
}

const WorkspacesButtons = () => Widget.EventBox({
    // onScrollUp: () => dispatch('+1'),
    // onScrollDown: () => dispatch('-1'),
    child: Widget.Box({
        vertical: true,
        spacing: 8,
        children: [
            Widget.Box({
                spacing: 4,
                children: [1, 2, 3, 4, 5].map(i => Widget.Button({
                    attribute: i,
                    label: `${i}`,
                    onClicked: () => dispatch(i),
                })),

                // remove this setup hook if you want fixed number of buttons
                setup: self => { 
                    self.hook(hyprland, () => self.children.forEach(btn => {
                        if (!hyprland.workspaces.some(ws => ws.id === btn.attribute)) {
                            btn.css = "opacity: 0.5;"
                        } else {
                            btn.css = "opacity: 1.0;"
                        }
                    }))
                    .hook(hyprland.active.workspace, () => self.children.forEach(btn => {
                        if (hyprland.active.workspace.id == btn.attribute) {
                            btn.css = "padding: 50px;"
                        } else {
                            btn.css = "padding: 0px;"
                        }
                    }))

                }
                
            }),    

            Widget.Box({
                spacing: 4,
                children: [6, 7, 8, 9, 10].map(i => Widget.Button({
                    attribute: i,
                    label: `${i}`,
                    onClicked: () => dispatch(i),
                })),

                // remove this setup hook if you want fixed number of buttons
                setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
                    if (!hyprland.workspaces.some(ws => ws.id === btn.attribute)) {
                        btn.css = "opacity: 0.5;"
                    } else {
                        btn.css = "opacity: 1.0;"
                    }
                }))
            }),    
        ]
    }),
})


export function Workspaces() {
        
    return Widget.Box({
        class_name: "workspaces container",
        spacing: Constants.MAIN_BOX_SPACING,
        vertical: true,
        children: [
            Title("Workspaces"),
            WorkspacesButtons()
        ]
    })
}
