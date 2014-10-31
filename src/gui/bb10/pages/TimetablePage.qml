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

import bb.cascades 1.3
import Fahrplan 1.0

import "../delegates"
import "../js/style.js" as UI

Page {
    actionBarVisibility: ChromeVisibility.Overlay
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll

    titleBar: TitleBar {
        title: qsTr("%1 - %2")
               .arg(fahrplan.mode === FahrplanBackend.ArrivalMode ? qsTr("Arrivals")
                                                                  : qsTr("Departures"))
               .arg(fahrplan.currentStationName)
               + Retranslate.onLocaleOrLanguageChanged
    }

    ListView {
        topPadding: ui.sdu(UI.paddingTop)
        leftPadding: ui.sdu(UI.paddingLeft)
        bottomPadding: layoutHandler.bottomOverlayHeight
        rightPadding: ui.sdu(UI.paddingRight)

        property FahrplanBackend fp: fahrplan
        dataModel: fahrplan.timetable
        listItemComponents: [
            ListItemComponent {
                TimetableEntryDelegate {
                    fahrplan: ListItem.view.fp
                }
            }
        ]
    }

    attachedObjects: [
        PageLayoutUpdateHandler {
            id: layoutHandler
        }
    ]
}
