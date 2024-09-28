import { Container } from "./components.js";

const systemtray = await Service.import('systemtray')

const SysTrayItem = item => Widget.Button({
    class_name: "item",
    child: Widget.Icon().bind('icon', item, 'icon'),
    tooltipMarkup: item.bind('tooltip_markup'),
    onPrimaryClick: (_, event) => item.openMenu(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
});

export function SystemTray() {
    return Widget.Box({
        class_name: "container tray",
        vertical: true,
        spacing: 4,
        children: systemtray.bind('items').as(i => i.map(SysTrayItem))
    })
}
