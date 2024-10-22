import { Constants } from "../constants.js"
const audio = await Service.import("audio")

const BOX_SPACING = 2

const AudioDeviceType = {
  SPEAKER: "speaker",
  MICROPHONE: "microphone"
}

export function VolumeMenu() {

  const Title = () => Widget.Label({
    class_name: "title",
    label: "Volume",
    justification: "center"
  })

  const VolumeIndicator = (type, iconPrefix, thresholds) => Widget.Button({
    class_name: "indicator",
    child: Widget.Icon().hook(audio[type], self => {
      const vol = audio[type].volume * 100;
      var icon = thresholds.find(([threshold]) => threshold <= vol)?.[1];

      if (audio[type].is_muted) {
        icon = 'muted'
      }

      self.icon = `${iconPrefix}-${icon}-symbolic`;
      self.tooltip_text = `Volume ${Math.floor(vol)}%`;
    }),
    on_clicked: () => {
      // Turn on audio if clicking button and volume is 0
      if (audio[type].volume == 0) {
        audio[type].volume = 1 // This could be set by config var
        return
      } 

      // Toggle mute
      audio[type].is_muted = !audio[type].is_muted
    },
  })

  const VolumeNumber = (type) => Widget.Label({
    class_name: "value",
    justification: "center",
  }).hook(audio[type], self => {
    const volume = Math.floor(audio[type].volume * 100)

    if (audio[type].is_muted) {
      self.label = "0"
    } else {
      self.label = `${volume}`
    }

  })

  

  const VolumeSlider = (type) => Widget.Slider({
    hexpand: true,
    drawValue: false,
    value: audio[type].bind('volume'),
    onChange: ({ value }) => { 
      if (audio[type].is_muted) audio[type].is_muted = false
      audio[type].volume = value
      if (value === 0) audio[type].is_muted = true
    },
  }).hook(audio[type], self => {
    if (audio[type].is_muted) {
      self.value = 0
    } else {
      self.value = audio[type].volume
    }
  })


  return Widget.Box({
    class_name: "volume container",
    vertical: true,
    spacing: Constants.MAIN_BOX_SPACING,
    children: [
      Title(),

      // Microphone Widget
      Widget.Box({
        spacing: BOX_SPACING,
        children: [
          VolumeIndicator(
            AudioDeviceType.MICROPHONE,
            "microphone-sensitivity",
            [
              [50, 'high'],
              [1, 'medium'],
              [0, 'muted']
            ]
          ),
          VolumeNumber(AudioDeviceType.MICROPHONE),
          VolumeSlider(AudioDeviceType.MICROPHONE)
        ]
      }),

      // Speaker Widget
      Widget.Box({
        spacing: BOX_SPACING,
        children: [
          VolumeIndicator(
            AudioDeviceType.SPEAKER,
            "audio-volume",
            [
              [67, 'high'],
              [34, 'medium'],
              [1, 'low'],
              [0, 'muted']
            ]
          ),
          VolumeNumber(AudioDeviceType.SPEAKER),
          VolumeSlider(AudioDeviceType.SPEAKER)
        ]
      }),
    ]
  })
}

export function MuteIndicators(monitor = 0) {

  function MuteIcon(type) {

    var icon = "microphone-sensitivity-muted-symbolic"
    if (type === AudioDeviceType.SPEAKER) {
      icon = "audio-volume-muted-symbolic"
    } else {
      icon = "microphone-sensitivity-muted-symbolic"
    }

    return Widget.Revealer({
      revealChild: audio[type].bind("is_muted"),
      transitionDuration: 200,
      transition: "crossfade",
        child: Widget.Icon({
        class_name: "icon",
        size: 36,
        icon: icon,
        tooltip_text: "Muted"
      })
    })

  } 

  // const merged = Utils.merge(
  //     [
  //       audio[AudioDeviceType.MICROPHONE].bind("is_muted"),
  //       audio[AudioDeviceType.SPEAKER].bind("is_muted")
  //     ],
  //     (micMuted, speakerMuted) => { 
  //       var icons = []
  //       if (micMuted) icons.push([MuteIcon(AudioDeviceType.MICROPHONE)])
  //       if (speakerMuted) return icons.push([MuteIcon(AudioDeviceType.SPEAKER)])
  //       return icons
  //     }
  //   )

  const icons = Widget.Box({
    css: "min-width: 2px; min-height: 2px;", // Needed to keep the window alive
    class_name: "muteindicators",
    vertical: false,
    children: [ 
      MuteIcon(AudioDeviceType.SPEAKER),
      MuteIcon(AudioDeviceType.MICROPHONE),
    ]
  })

  return Widget.Window({
    monitor: monitor,
    name: `muteindicators`,
    class_name: "muteindicatorswindow",
    layer: 'overlay',
    keymode: "none",
    anchor: ["top", "right"],
    child: icons 
  })
}

