import { Constants } from "./constants.js"
const audio = await Service.import("audio")

const BOX_SPACING = 2

const AudioDeviceType = {
    SPEAKER: "speaker",
    MICROPHONE: "microphone"
}

export function VolumeMenu() {

    const Title = () => Widget.Label({
        class_name: "title",
        label: "Volume Controls",
        justification: "center"
    })

    const VolumeIndicator = (type, iconPrefix, thresholds) => Widget.Button({
        class_name: "indicator",
        on_clicked: () => audio[type].is_muted = !audio[type].is_muted,
        child: Widget.Icon().hook(audio[type], self => {
            const vol = audio[type].volume * 100;
            var icon = thresholds.find(([threshold]) => threshold <= vol)?.[1];
    
            if (audio[type].is_muted) {
                icon = 'muted'
            }
    
            self.icon = `${iconPrefix}-${icon}-symbolic`;
            self.tooltip_text = `Volume ${Math.floor(vol)}%`;
        })
    })
    
    const VolumeNumber = (type) => Widget.Label({
        class_name: "value",
        justification: "center",
    }).hook(audio[type], self => {
        const volume = Math.floor(audio[type].volume * 100)
        self.label = `${volume}` 
    })
    
    const VolumeSlider = (type) => Widget.Slider({
        hexpand: true,
        drawValue: false,
        onChange: ({ value }) => audio[type].volume = value,
        value: audio[type].bind('volume'),
    })


    return Widget.Box({
        class_name: "volume container",
        vertical: true,
        spacing: Constants.MAIN_BOX_SPACING,
        children: [
            Title(),

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
            })
            
        ]
    })  
}
