import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0

ApplicationWindow
{
    id: root

    visible: true
    width: 600
    height: 400
    title: "Tp IHM."

    toolBar: ToolBar
    {
        RowLayout
        {
            ToolButton{
                id: openButton
                text: "Open a new image as input"
                iconSource: "icons/open.svg"
                onClicked: {
                    openfileDialog.visible = true

                }
            }
            ToolButton{
                id: saveButton
                text: "Save the output"
                iconSource: "icons/save.svg"
                onClicked: {
                    openfileDialog.visible = true
                }
            }
        }
    }

    FileDialog {
        id: openfileDialog
        title: "Please choose a file"
        onAccepted: {
            console.log("You chose: " + openfileDialog.fileUrls)
            inputImage.source = openfileDialog.fileUrl
        }
        onRejected: {
            console.log("Canceled")
        }
//        Component.onCompleted: visible = true
    }

    SplitView{
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle{
            Layout.minimumWidth:  toolBoxContent.width + 20
            Layout.maximumWidth: 250
            color: "darkgrey"
            Text{
                id: toolBoxContent
                text: "My toolboxes"
                anchors.centerIn: parent
            }

        }
        SplitView{
            orientation: Qt.Vertical
            Image{
                id: inputImage
                fillMode: Image.PreserveAspectFit

            }
            Image{
                id: outputImage
                fillMode: Image.PreserveAspectFit
            }
        }
    }


}
