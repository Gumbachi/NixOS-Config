const audio = await Service.import("audio")

const BUTTON_SIZE = 20
const BOX_SPACING = 2


const volumeIndicator = Widget.Button({
    on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
    child: Widget.Icon({
        // size: BUTTON_SIZE,
    })
        .hook(audio.speaker, self => {
            const vol = audio.speaker.volume * 100;
            var icon = [
                [101, 'overamplified'],
                [67, 'high'],
                [34, 'medium'],
                [1, 'low'],
                [0, 'muted'],
            ].find(([threshold]) => threshold <= vol)?.[1];

            if (audio.speaker.is_muted) {
                icon = 'muted'
            }

            self.icon = `audio-volume-${icon}-symbolic`;
            self.tooltip_text = `Volume ${Math.floor(vol)}%`;
        }),
})
 
const micIndicator = Widget.Button({
    on_clicked: () => audio.microphone.is_muted = !audio.microphone.is_muted,
    child: Widget.Icon({
        // size: BUTTON_SIZE,
        // css: "min-width: 24px;"
    })
        .hook(audio.microphone, self => {
            const vol = audio.microphone.volume * 100;
            var icon = [
                [50, 'high'],
                [1, 'medium'],
                [0, 'muted'],
            ].find(([threshold]) => threshold <= vol)?.[1];

            if (audio.microphone.is_muted) {
                icon = 'muted'
            }

            self.icon = `microphone-sensitivity-${icon}-symbolic`;
            self.tooltip_text = `Volume ${Math.floor(vol)}%`;
        }),
})

const VolumeLabel = (type) => Widget.Label({
    justification: "center",
    css: "min-width: 40px; font-weight: bold;",
})
.hook(audio[type], self => {
    const volume = Math.floor(audio[type].volume * 100)
    self.label = `${volume}` 
})

const VolumeSlider = (type = 'speaker') => Widget.Slider({
    hexpand: true,
    drawValue: false,
    onChange: ({ value }) => audio[type].volume = value,
    value: audio[type].bind('volume'),
})

const speakerSlider = Widget.Box({
    spacing: BOX_SPACING,
    children: [
        volumeIndicator,
        VolumeLabel('speaker'),
        VolumeSlider('speaker')     
    ]
})

const micSlider = Widget.Box({
    spacing: BOX_SPACING,
    children: [
        micIndicator,
        VolumeLabel('microphone'),
        VolumeSlider('microphone')     
    ]
})


const label = Widget.Label({
    class_name: "title",
    label: "Volume Controls",
    justification: "center",
})

export function VolumeMenu() {
    return Widget.Box({
        class_name: "volume",
        css: "min-width: 350px;",
        vertical: true,
        spacing: 12,
        children: [
            label,
            speakerSlider,
            micSlider
         ]
     })     
}
