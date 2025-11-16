import qs.core.config
import qs.core.appearance
import qs.common.widgets
import qs.services
import Quickshell.Widgets
import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts


BaseMenu {
    title: "Appearance"
    description: "Adjust how the desktop looks like to your preference."

    BaseCard {

        /* ---------- Dark Mode Row ---------- */
        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            ColumnLayout {
                StyledText { 
                    text: "Dark mode"
                    font.pixelSize: 16
                }
                StyledText { 
                    text: "Whether to use dark color schemes."
                    font.pixelSize: 12
                }
            }

            Item { Layout.fillWidth: true }

            StyledSwitch {
                checked: Config.options.appearance.theme === "dark"
                onToggled: {
                    Quickshell.execDetached({
                        command: ['qs', 'ipc', 'call', 'global', "toggleTheme"]
                    })
                }
            }
        }

        component SwitchOption: RowLayout {
            id: main
            property string title: "Title"
            property string description: "Description"
            property string prefField: ''

            ColumnLayout {
                StyledText { text: main.title; font.pixelSize: 16;  }
                StyledText { text: main.description; font.pixelSize: 12; }
            }
            Item { Layout.fillWidth: true }
            StyledSwitch {
                checked: Config.options[main.prefField.split('.')[0]][main.prefField.split('.')[1]]
                onToggled: {
                    Config.setNestedValue(main.prefField, checked)
                }
            }
        }

        SwitchOption {
            title: "Enabled screen borders"
            description: "Whether to keep screen borders or not."
            prefField: "background.borderEnabled"
        }

        SwitchOption {
            title: "Show Clock"
            description: "Whether to show or disable the clock on the background."
            prefField: "background.showClock"
        }
    }
}
