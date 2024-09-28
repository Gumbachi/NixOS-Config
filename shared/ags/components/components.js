import { Constants } from "../constants.js"

export const Title = (title) => Widget.Label({
    label: title,
    class_name: "title",
    justification: "center",
})

export function Container({ name, ...rest }) {
    return Widget.Box({
        ...rest, // spread passed parameters
        vertical: true,
        spacing: Constants.MAIN_BOX_SPACING,
        class_name: `container ${name}`
    })
}


