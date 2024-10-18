import { Constants } from "../constants.js"

const network = await Service.import('network')

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
      spacing: Constants.ICON_LABEL_SPACING,
      children: [
        // Ethernet Icon
        Widget.Icon({
          icon: "network-wired-symbolic",
          size: Constants.SMALL_ICON_SIZE
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
          spacing: Constants.ICON_LABEL_SPACING,
          hpack: "center",
          children: [
            Widget.Icon({
              icon: "network-wireless-symbolic",
              size: Constants.SMALL_ICON_SIZE
            }),
            networkStrength
          ]
        }),
      ]
    })
  }
})

const upSpeed = Variable(0)
const downSpeed = Variable(0)
const isLoading = Variable("notloading")

const downloadSpeed = Widget.Box({
  spacing: Constants.ICON_LABEL_SPACING,
  children: [
    Widget.Icon({
      icon: "go-down-symbolic"
    }),
    Widget.Label({
      label: downSpeed.bind().as(String),
      css: "font-weight: bold;"
    })
  ]
})

const uploadSpeed = Widget.Box({
  spacing: Constants.ICON_LABEL_SPACING,
  children: [
    Widget.Label({
      label: upSpeed.bind().as(String),
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
        Utils.execAsync('bash -c "speedtest-cli --simple --secure"')
          .then(out => {
            // Parse speedtest output
            const [ping, down, up] = out.split("\n", 3)

            // Convert String to Float to Int
            const uploadSpeed = Math.floor(Number(up.split(" ")[1]))
            const downloadSpeed = Math.floor(Number(down.split(" ")[1]))

            upSpeed.value = uploadSpeed
            downSpeed.value = downloadSpeed

            // Re-enable button
            isLoading.value = "notloading"
            Utils.notify({
              summary: "Speedtest Complete",
              body: `↓ ${downSpeed.value}\n↑ ${upSpeed.value}`,
              iconName: "network-wireless-symbolic",
              timeout: 5000
            })
          })
          .catch(err => print(err))
      }
    }),
    "loading": Widget.Spinner(),
  },
  shown: isLoading.bind()
})

export const Network = () => Widget.Box({
  class_name: "network container",
  vertical: true,
  children: [
    // Title
    Widget.Label({
      class_name: "title",
      label: "Network",
      justification: "center",
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


