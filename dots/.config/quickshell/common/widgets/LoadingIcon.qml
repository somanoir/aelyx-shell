import QtQuick
import qs.core.appearance
import qs.common.widgets
Item {
    id: root
    property alias icon: mIcon.icon
    property real size: 28
    width: size
    height: size

    MaterialSymbol {
        id: mIcon
        anchors.centerIn: parent
        icon: "progress_activity"
        iconSize: root.size
        color: Appearance.m3colors.m3primary
        renderType: Text.QtRendering
    }
    RotationAnimator on rotation {
        target: mIcon
        running: true
        loops: Animation.Infinite
        from: 0
        to: 360
        duration: 1000
    }
}