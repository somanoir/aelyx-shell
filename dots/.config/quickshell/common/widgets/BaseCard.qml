import qs.core.appearance
import qs.common.widgets
import QtQuick
import QtQuick.Layouts

Item {
    id: baseCard
    anchors.left: parent.left
    anchors.right: parent.right
    implicitHeight: wpBG.implicitHeight

    default property alias content: contentArea.data
    property alias color: wpBG.color
    property alias radius: wpBG.radius
    property int cardMargin: Appearance.margin.normal
    property int cardSpacing: Appearance.margin.small
    property int verticalPadding: Appearance.margin.verylarge
    property bool useAnims: false

    Rectangle {
        id: wpBG
        anchors.left: parent.left
        anchors.right: parent.right
        implicitHeight: contentArea.implicitHeight + baseCard.verticalPadding

        // Animate implicitHeight using Appearance animation
        Behavior on implicitHeight {
            NumberAnimation {
                duration: !baseCard.useAnims ? 0 : Appearance.animation.durations.fast
                easing.type: Easing.BezierSpline
                easing.bezierCurve: Appearance.animation.curves.expressiveEffects
            }
        }

        color: Appearance.colors.colLayer1
        Behavior on color {
            ColorAnimation {
                duration: !baseCard.useAnims ? 0 : Appearance.animation.durations.fast
                easing.type: Easing.BezierSpline
                easing.bezierCurve: Appearance.animation.curves.expressiveEffects
            }
        }

        radius: Appearance.rounding.normal
    }

    ColumnLayout {
        id: contentArea
        anchors.top: wpBG.top
        anchors.left: wpBG.left
        anchors.right: wpBG.right
        anchors.margins: baseCard.cardMargin
        spacing: baseCard.cardSpacing
    }
}
