const hyprland = await Service.import("hyprland");
const audio = await Service.import("audio");

const clock_widget = Widget.Label ({
	class_name: 'clock',
	setup: self => self.poll(1000, () => {
		Utils.execAsync('date "+  %A %d %B   %H : %M"').then(clock => self.label = clock)
	}),
})

const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`)

const workspaces_widget = () => Widget.EventBox ({
	child: Widget.Box({
		children: Array.from({ length: 6 }, (_, i) => i+ 1).map(i => Widget.Button({
			label: `${i}`,
			onClicked: () => dispatch(i),
			class_name: hyprland.active.workspace.bind('id').as(id => `${i === id ? 'focused' : ''}`),
		})),
	}),
})

function audio_widget() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 180px",
        children: [icon, slider],
    })
}



const bar = Widget.Window ({
	name: 'bar',
	anchor: [ 'top', 'left', 'right' ],
	exclusivity: "exclusive",
	child: Widget.CenterBox({
		start_widget: workspaces_widget(),
		center_widget: audio_widget(),
		end_widget: clock_widget,
	})
})

App.config({
	windows: [ bar ],
	style: './style.css',
})
