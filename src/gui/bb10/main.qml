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
import bb.system 1.3
import QtQuick 1.0
import Fahrplan 1.0

import "pages"

TabbedPane {
    id: appWindow

    showTabsOnActionBar: true

    Tab {
        id: journeyTab

        title: qsTr("Journey")
        imageSource: Qt.resolvedUrl("icons/journey.png")

        NavigationPane {
            JourneyPage {}
        }
    }

    Tab {
        id: timetableTab

        title: qsTr("Timetable")
        imageSource: Qt.resolvedUrl("icons/timetable.png")
        enabled: fahrplan.parser.supportsTimeTable()

        NavigationPane {
            TimetablePage {}
        }
    }

    Menu.definition: MenuDefinition {
        id: menuDefinition

        actions: [
            ActionItem {
                title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
                imageSource: Qt.resolvedUrl("icons/ic_info.png");

                onTriggered: {
                    Application.menuEnabled = false;
                    activePane.push(aboutPageDefinition.createObject());
                }
            }
        ]
    }

    attachedObjects: [
        ComponentDefinition {
            id: aboutPageDefinition
            AboutPage {}
        },
        FahrplanBackend {
            id: fahrplan

            onParserChanged: {
                // If parser doesn't support timetable,
                // switch to Journey tab
                if (!parser.supportsTimeTable())
                    activeTab = journeyTab;
            }

            onParserErrorOccured: {
                console.debug(msg);
                toast.body = msg;
                toast.show();
            }
        },
        SystemToast {
            id: toast
        },
        Connections {
            target: appWindow.activePane

            onPopTransitionEnded: {
                // Destroy the popped Page once the back transition has ended.
                page.destroy();
                Application.menuEnabled = true;
            }
        }
    ]
}
