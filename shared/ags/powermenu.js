import { Constants } from "./constants.js"

const IDLE_INHIBIT_ACTIVE = 'xapp-prefs-display-symbolic'
const IDLE_INHIBIT_INACTIVE = 'image-red-eye-symbolic'

const shutdownButton = Widget.Button({
    child: Widget.Icon({
        icon: 'system-shutdown-symbolic',
        size: Constants.LARGE_ICON_SIZE
    }),
    onClicked: () => Utils.exec('systemctl poweroff')
})

const rebootButton = Widget.Button({
    child: Widget.Icon({
        icon: 'system-reboot-symbolic',
        size: Constants.LARGE_ICON_SIZE
    }),
    onClicked: () => Utils.exec('reboot')
})


const lockButton = Widget.Button({
    child: Widget.Icon({
        icon: 'system-lock-screen-symbolic',
        size: Constants.LARGE_ICON_SIZE
    }),
    onClicked: () => Utils.exec('hyprlock')
})

const idleInitialState = Utils.exec('pidof hypridle') != 0 ? IDLE_INHIBIT_INACTIVE : IDLE_INHIBIT_ACTIVE
const idleIcon = Variable(idleInitialState)

const idleInhibitor = Widget.Button({
    child: Widget.Icon({
        icon: idleIcon.bind(),
        size: Constants.LARGE_ICON_SIZE
    }),
        onClicked: () => {
        const idleRunning = Utils.exec('pidof hypridle')
        if (idleRunning != "") {
            Utils.exec('pkill hypridle')
            print("killing hypridle")
            idleIcon.value = IDLE_INHIBIT_ACTIVE // open eyeball
        } else {
            Utils.exec('bash -c "hypridle 1>/dev/null 2>/dev/null & disown"')
            print("running hypridle")
            idleIcon.value = IDLE_INHIBIT_INACTIVE // closed eyeball
        }
    }
})

export const PowerMenu = () => Widget.Box({
    spacing: 8,
    children: [
        idleInhibitor,
        lockButton,
        rebootButton,
        shutdownButton
    ]
})
