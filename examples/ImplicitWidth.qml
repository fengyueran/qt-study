import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/*
下例中rowLayout.implicitWidth 不包含 anchors.margins: 10。在 Qt QML 中：
- implicitWidth 是布局自身内容的隐式宽度，只包含：
  - 子项的宽度
  - 布局的 spacing（子项之间的间距）
  - 子项的 Layout.margins（如果有的话）
- anchors.margins 是用于定位布局在其父容器中的位置，属于外边距，不计入布局自身的 implicitWidth
*/
Item {
    width: rowLayout.implicitWidth
    height: 100
    Rectangle {
        anchors.fill: parent
        width: rowLayout.implicitWidth
        height: 100
        color: "blue"
    }

    RowLayout {
        id: rowLayout
        anchors.margins: 10
        spacing: 30

        Text {
            color: "white"
            text: "Hello, World!"
        }

        Rectangle {
            id: rect
            width: 100
            height: 100
            color: "transparent"
            border.color: "red"
            border.width: 1
            Layout.rightMargin: 50
        }
    }
}
