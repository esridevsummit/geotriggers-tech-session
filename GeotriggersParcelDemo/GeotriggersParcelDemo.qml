// [WriteFile Name=GeotriggersParcelDemo, Category=Analysis]
// [Legal]
// Copyright 2022 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// [Legal]

import QtQuick 2.12
import QtQuick.Controls 2.12
import Esri.Samples 1.0

Item {

    // add a mapView component
    MapView {
        id: view
        anchors.fill: parent

        Component.onCompleted: {
            // Set and keep the focus on SceneView to enable keyboard navigation
            forceActiveFocus();
        }
    }

    Button {
        id: whereClauseButton
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
        }
        text: "\"RecAC > .18\""
        onClicked: {
            model.useWhereClause = true;
            highlighted = true;
        }
    }
    Button {
        anchors {
            top: whereClauseButton.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }
        text: "bufferDistance = 10"
        onClicked: {
            model.useBufferDistance = true;
            highlighted = true;
        }
    }

    Rectangle {
        id: startRect
        height: 20
        width: 20
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: 50
        }
        color: "lightgreen"
        opacity: 0.5
        MouseArea {
            anchors.fill: parent
            onClicked: { model.runGeotriggers(); }
        }
    }

    // Declare the C++ instance which creates the scene etc. and supply the view
    GeotriggersParcelDemoSample {
        id: model
        mapView: view
    }
}
