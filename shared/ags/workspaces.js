import { Constants } from "./constants.js";

const hyprland = await Service.import('hyprland')

const focusedTitle = Widget.Label({
    label: hyprland.active.client.bind('title'),
    visible: hyprland.active.client.bind('address')
        .as(addr => addr !== "0x"),
})

const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`);

const WorkspacesButtons = () => Widget.EventBox({
    // onScrollUp: () => dispatch('+1'),
    // onScrollDown: () => dispatch('-1'),
    child: Widget.Box({
        children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
            attribute: i,
            label: `${i}`,
            onClicked: () => dispatch(i),
        })),

        // remove this setup hook if you want fixed number of buttons
        setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
            btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute);
        })),
    }),
})

const WorkspacesTitle = () => Widget.Label({
    class_name: "title",
    label: "Workspaces",
    hpack: "center",
    justification: "center",
})

export const Workspaces = () => Widget.Box({
    class_name: "workspaces",
    spacing: Constants.MAIN_BOX_SPACING,
    vertical: true,
    children: [
        WorkspacesTitle(),
        WorkspacesButtons()
    ]
})
