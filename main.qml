import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.0

Window {
    id: window
    width: 640
    height: 280
    visible: true
    color: "#21263B"
    title: qsTr("Web unit converter")
    Material.theme: Material.Light//color general de la aplicacion
    Material.primary: Material.Pink
    Material.accent: Material.Pink //color de los detalles en la app

    function uwu(){
        let input = mainInput.text 
        let option = optionList.currentIndex
        console.log(option)

        //valores
        let pxToVw = 0.11086474501108648
        let pxToVh = 0.052083333333333336
        let pxToEm = 0.063
        let VwToPx = 19.2
        let VhToPx = 9.02
        let EmToPx = 16

        if (option == 0) { 
            res.text = parseFloat(input * pxToVw).toFixed(5)
            inputUnit.text = ("Px")
            outputUnit.text = ("Vw")
            //pixel to viewport width
        } else if (option == 1) {
            res.text = parseFloat(input * pxToVh).toFixed(5)
            inputUnit.text = ("Px")
            outputUnit.text = ("Vh")
            //pixel to viewport Height
        } else if (option == 2){
            res.text = parseFloat(input * pxToEm).toFixed(5)
            inputUnit.text = ("Px")
            outputUnit.text = ("Em")
            //pixel to Em
        } else if (option == 3){
            res.text = parseFloat(input * VwToPx).toFixed(5)
            inputUnit.text = ("Vw")
            outputUnit.text = ("Px")
            //viewport width to Pixel
        } else if (option == 4){//pixel to viewport
            res.text = parseFloat(input * VhToPx).toFixed(5)
            inputUnit.text = ("Vh")
            outputUnit.text = ("Px")
            //viewport Height to Pixel
        } else if (option == 5){//pixel to viewport
            res.text = parseFloat(input * EmToPx).toFixed(5)
            inputUnit.text = ("Em")
            outputUnit.text = ("Px")
            //Em to Pixel
        }
    }
        

    Rectangle {
        id: rectangle
        x: 27
        height: 83
        color: "#E91E63"
        radius: 10
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.rightMargin: 30
        anchors.leftMargin: 30

        Text {
            id: title
            width: 258
            height: 37
            text: qsTr("Web Unit Converter")
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 13
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Material Icons"
        }

        Text {
            id: subtitle
            y: 45
            text: qsTr("An easy to use web unit converter app")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 15
            anchors.leftMargin: 20
            font.family: "codicon"
        }
    }

    Rectangle {
        id: inputs
        y: 130
        //width: 366
        height: 57
        //color: "#1571a5"
        radius: 10
        border.width: 0
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: output.left
        anchors.rightMargin: 30
        focus: false

        TextField {
            id: mainInput
            text: ""
            anchors.fill: parent
            anchors.bottomMargin: 5
            anchors.topMargin: 11
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 60
            selectionColor: "#ffffff"
            placeholderText: qsTr("Measure to convert")
        }
        Text {
            id: inputUnit
            height: 30
            text: qsTr("Px")
            anchors.left: mainInput.right
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 13
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
            font.bold: true
            font.family: "Material Icons"
        }
    }

    Rectangle {
        id: output
        x: 431
        y: 130
        width: 200
        height: 57
        //color: "#584274"
        radius: 10
        border.width: 0
        anchors.right: parent.right
        anchors.rightMargin: 30
        focus: false

        TextField {
            id: res
            anchors.fill: parent
            anchors.bottomMargin: 4
            anchors.leftMargin: 8
            anchors.rightMargin: 65
            anchors.topMargin: 10
            placeholderText: qsTr("Measure converted")
            selectionColor: "#ffffff"
        }
        Text {
            id: outputUnit
            height: 30
            text: qsTr("Vw")
            anchors.left: res.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 13
            anchors.right: parent.left
            anchors.rightMargin: 5
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
            font.bold: true
            font.family: "Material Icons"
        }
    }

    ComboBox {
        id: optionList
        width: 176
        anchors.left: parent.left
        anchors.top: inputs.bottom
        //anchors.bottom: parent.bottom
        //anchors.bottomMargin: 30
        anchors.topMargin: 20
        anchors.leftMargin: 30
        wheelEnabled: false
        verticalPadding: 0.1
        spacing: 0.3
        currentIndex: 0
        editable: false
        flat: false
        //Material.background: Material.Blue
        Material.accent: Material.Pink

        model: ["Px to VW",
                "Px to VH",
                "Px to Em",
                "VW to Px",
                "VH to Px",
                "Em to Px"]
    }

    Button {
        id: exit_btn
        width: 84
        text: qsTr("Exit")
        anchors.top: output.bottom
        anchors.topMargin: 20
        anchors.right: convert_btn.left
        anchors.rightMargin: 30
        Material.background: Material.Pink
        //cuando clickeado, cerrar ventana
        onClicked: window.close()
    }

    Button {
        id: convert_btn
        //x: 529
        //y: 205
        width: 84
        //height: 45
        text: qsTr("Convert")
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: output.bottom
        anchors.topMargin: 20
        Material.background: Material.Cyan

        onClicked: uwu()
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:11}
}
##^##*/
