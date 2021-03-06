/****************************************************************************
**
**  This file is a part of Fahrplan.
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License along
**  with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

import QtQuick 1.1
import com.nokia.meego 1.1

Item {
    id: root

    property bool active: false
    property string text

    function show(labelText)
    {
        text = labelText ? labelText : "";
        state = "Active"
    }

    function hide()
    {
        state = "";
    }

    clip: true

    anchors {
        topMargin: root.actvie ? 20 : 0
        left: parent.left
        leftMargin: 20
        right: parent.right
        rightMargin: 20
    }

    Label {
        id: progressLabel

        text: root.text
        wrapMode: Text.WordWrap
        anchors {
            left: parent.left
            right: progressIndicator.left
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
    }

    BusyIndicator {
        id: progressIndicator

        running: root.active
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        platformStyle: BusyIndicatorStyle { size: "small" }
    }

    states: [
        State {
            name: "Active"
            PropertyChanges {
                target: root
                active: true
                height: Math.max(progressLabel.height, progressIndicator.height) + 20
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "Active"
            reversible: true

            SequentialAnimation {
                NumberAnimation { property: "height"; duration: 200 }
            }
        }
    ]
}

