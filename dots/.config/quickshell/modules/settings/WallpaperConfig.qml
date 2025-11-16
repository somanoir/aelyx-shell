import qs.services
import qs.widgets 
import qs.config
import Quickshell.Widgets
import Quickshell
import Quickshell.Io
import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

ContentMenu {
    title: "Wallpaper"
    description: "Manage your wallpapers"

    ContentCard {
        StyledText {
            text: "Current Wallpaper:"
            font.pixelSize: 20
            font.bold: true
        }

        StyledRect {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignCenter
            id: wpPreview
            width: 960
            height: 640
            radius: 12
            color: Appearance.m3colors.m3paddingContainer
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: wpPreview.width
                    height: wpPreview.height
                    radius: wpPreview.radius
                }
            }
            Image {
                anchors.fill: parent
                source: Config.options.background.wallpaperPath
                fillMode: Image.PreserveAspectCrop
                cache: true
                opacity: 0.9
            }
        }

        StyledButton {
            icon: "wallpaper"
            text: "Change Wallpaper"
            Layout.fillWidth: true 
            onClicked: Quickshell.execDetached(["qs", "ipc", "call", "background", "change"])
        }

        StyledSwitchOption {
            title: "Visible";
            description: "Change wallpaper's visiblity."
            prefField: "background.wallpaperEnabled"
        }
    }
}
