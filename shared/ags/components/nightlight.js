import { Constants } from "../constants.js"
import { Title } from "./components.js" 

const LAT = "39.0"
const LONG = "-76.9"

const nightLightStart = Variable("00:00")
const nightLightEnd = Variable("06:30")
const nightLightStatus = Variable("on")

function isValidTime(t) {
    const timeRegex = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/g
    return t.match(timeRegex) !== null
}

function killSunset() {
    print("Killing WLSunset")
    Utils.exec(`pkill wlsunset`)
}

function runSunset(start, end) {
    print(`Running WLSunset start: ${start} end: ${end}`)
    Utils.exec(`bash -c "wlsunset -l ${LAT} -L ${LONG} 1>/dev/null 2>/dev/null & disown"`)
}

function startSunset() {
    print(`Running WLSunset`)
    Utils.exec(`bash -c "wlsunset -l ${LAT} -L ${LONG} 1>/dev/null 2>/dev/null & disown"`)
}

function restartSunset(start, end) {
    killSunset()
    runSunset(start, end)
}

// Listen to button
nightLightStatus.connect('changed', ({ value }) => {
    if (value === "on") {
        restartSunset(nightLightStart.value, nightLightEnd.value)
    } else if (value === "off") {
        killSunset()
    }
})

const merged = Utils.merge(
    [nightLightStart.bind(), nightLightEnd.bind()],
    (start, end) => {
        if (nightLightStatus.value === "on") {
            restartSunset(start, end)
        }
    }
)

const StartTimeEntry = () => Widget.Entry({
    text: nightLightStart.bind(),
    onAccept: ({ text }) => {
        // Validate Input
        if (isValidTime(text)) {                        
            nightLightStart.value = text
        } else {
            print(`Validation Failed: ${text}`)
        }
    },
})

const EndTimeEntry = () => Widget.Entry({
    text: nightLightEnd.bind(),
    onAccept: ({ text }) => {
        // Validate Input
        if (isValidTime(text)) {                        
            nightLightEnd.value = text
        } else {
            print(`Validation Failed: ${text}`)
        }

    },
})

const ToggleButton = () => Widget.Button({
    onClicked: self => {
        if (nightLightStatus.value === "on") {
            nightLightStatus.value = "off"
        } else {
            nightLightStatus.value = "on"
        }
    },
    child: Widget.Stack({
        children: {
            "off": Widget.Icon({
                icon: "display-brightness-high-symbolic",
                size: Constants.SMALL_ICON_SIZE
            }),
            "on": Widget.Icon({
                icon: "night-light-symbolic",
                size: Constants.SMALL_ICON_SIZE
            })
        },
        shown: nightLightStatus.bind()
    })
})


export const NightLightMenu = () => Widget.Box({
    class_name: "nightlight container",
    spacing: Constants.MAIN_BOX_SPACING,
    vertical: true,
    children: [
        Title("Night Light"),

        Widget.Box({
            children: [
                // StartTimeEntry(),
                ToggleButton(),
                // EndTimeEntry()
            ]
        })
    ]
})


const NIGHT_LIGHT_ON = "night-light-symbolic"
const NIGHT_LIGHT_OFF = "display-brightness-high-symbolic"

// Start wlsunset on ags launch
if (Utils.exec(`pidof wlsunset`) == "") {
    startSunset()
}
const nightLightIcon = Variable(NIGHT_LIGHT_ON)

export const NightLightButton = () => Widget.Button({    
    child: Widget.Icon({
        icon: nightLightIcon.bind(),
        size: Constants.LARGE_ICON_SIZE
    }),
        onClicked: () => {
        if (nightLightIcon.value == NIGHT_LIGHT_ON) {
            killSunset()
            nightLightIcon.value = NIGHT_LIGHT_OFF
        } else {
            startSunset()
            nightLightIcon.value = NIGHT_LIGHT_ON
        }
    }
})
