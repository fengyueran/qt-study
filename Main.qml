import QtQuick
import QtQuick.Controls

import "components"

ApplicationWindow {
    height: 600
    title: "Zoomable Quantum Circuit Editor"
    visible: true
    width: 800

    ZoomableArea {
        id: zoomableCanvas

        anchors.fill: parent

        // 将 QuantumCircuit 作为内容加载到 ZoomableArea
        contentItemProvider: Component {
            Rectangle {
                id: rectangle

                anchors.centerIn: parent // 将矩形居中
                border.color: "black"
                border.width: 2
                color: "blue"
                height: 10
                width: 10
            }

            // QuantumCircuit {
            //     id: circuit
            //     width: parent.width
            //     height: 400

            //     // 添加量子门
            //     Component.onCompleted: {
            //         addGate("H", 0, 100);   // 添加 H 门到第 0 个量子比特线上
            //         addGate("X", 1, 200);   // 添加 X 门到第 1 个量子比特线上
            //         addCNOTGate(0, 1, 300); // 添加 CNOT 门
            //     }
            // }
        }
    }

    // 工具栏按钮
    Row {
        anchors.margins: 10
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 10

        Button {
            text: "+"

            onClicked: zoomableCanvas.scaleFactor = Math.min(2.0, zoomableCanvas.scaleFactor + 0.1)
        }
        Button {
            text: "-"

            onClicked: zoomableCanvas.scaleFactor = Math.max(0.5, zoomableCanvas.scaleFactor - 0.1)
        }
        Button {
            text: "Reset"

            onClicked: {
                zoomableCanvas.scaleFactor = 1.0;
                zoomableCanvas.translateX = 0;
                zoomableCanvas.translateY = 0;
            }
        }
    }
}
