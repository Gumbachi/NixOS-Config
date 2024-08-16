const network = await Service.import('network')

const ICON_SIZE = 24
const ICON_TEXT_SPACING = 16
const WIRED_DEVICE_NAME = Utils.exec(`bash -c "echo $ETHERNET_DEVICE_NAME"`)

const networkData = Widget.Label({
    label: network.connectivity
})

const WifiIndicator = () => Widget.Box({
    spacing: 18,
    children: [
        Widget.Icon({
            icon: network.wifi.bind('icon_name'),
        }),
        Widget.Label({
            label: network.wifi.bind('ssid')
                .as(ssid => ssid || 'Unknown'),
        }),
    ],
})

const WiredIndicator = () => Widget.Icon({
    icon: network.wired.bind('icon_name'),
})

const networkStrength = Widget.Label({    
    css: "font-size: 18px; font-weight: bold;",
    justification: "center",
    label: network.wifi.bind("strength").as(String)
})

const NetworkIndicator = () => Widget.Stack({
    shown: network.bind("primary").as(p => p),
    hpack: "center",
    children: {
        "wired": Widget.Box({
            spacing: 8,
            children: [
                // Ethernet Icon
                Widget.Icon({
                    icon: "network-wired-symbolic",
                    size: 24
                }),

                // Internal IP
                Widget.Label({
                    css: "font-size: 18px; font-weight: bold;",
                    label: Utils.exec(`bash -c "ifconfig ${WIRED_DEVICE_NAME} | awk '/inet / {print $2}'"`)
                })
            ]
        }),
        "wifi": Widget.Box({
            vertical: true,
            spacing: 8,
            children: [
                // Network Name
                Widget.Label({
                    label: network.wifi.bind("ssid"),
                    justification: "center",
                    css: "font-size: 14px;"
                }),

                // Strength
                Widget.Box({
                    spacing: ICON_TEXT_SPACING,
                    hpack: "center",
                    children: [
                        Widget.Icon({
                            icon: "network-wireless-symbolic",
                            size: ICON_SIZE
                        }),
                        networkStrength
                    ]
                }),
            ]    
        })
    }
})

const upSpeed = Variable("0")
const downSpeed = Variable("0")
const isLoading = Variable("notloading")

const downloadSpeed = Widget.Box({
    spacing: 8,
    children: [
        Widget.Icon({
            icon: "go-down-symbolic"
        }),
        Widget.Label({
            label: downSpeed.bind(),
            css: "font-weight: bold;"
        })
    ]    
})

const uploadSpeed = Widget.Box({
    spacing: 8,
    children: [
        Widget.Label({
            label: upSpeed.bind(),
            css: "font-weight: bold;"
        }),
        Widget.Icon({
            icon: "go-up-symbolic"
        })
    ]    
})

const speedTest = Widget.Stack({
    children: {
        "notloading": Widget.Button({
            css: "border-width: 2px;",
            child: Widget.Icon({
                icon: "system-run-symbolic"
            }),
            onClicked: () => {
                print("speedtest")
                isLoading.value = "loading"
                Utils.execAsync('bash -c "speedtest --simple"')
                    .then(out => {
                        // Parse speedtest output
                        const [ping, down, up] = out.split("\n", 3)
                        upSpeed.value = up.split(" ")[1]
                        downSpeed.value = down.split(" ")[1]

                        // Re-enable button
                        isLoading.value = "notloading"
                    })
                    .catch(err => print(err))
            }
        }),
        "loading": Widget.Spinner(),
    },
    shown: isLoading.bind()
})

export const Network = () => Widget.Box({
    class_name: "network",
    spacing: 8,
    vertical: true,
    children: [
        // Title
        Widget.Label({
            label: "Network",
            justification: "center",
            css: "font-weight: bold; font-size: 22px;"
        }),

        NetworkIndicator(),

        // Speed Test
        Widget.Box({
            spacing: 8,
            hpack: "center",
            children: [
                downloadSpeed,
                speedTest,
                uploadSpeed
            ]
        })
    ]
})


