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

Container {
    property FahrplanBackend fahrplan

    Container {
        layout: StackLayout { orientation: LayoutOrientation.LeftToRight }

        Container {
            layoutProperties: StackLayoutProperties { spaceQuota: 1 }
            Label {
                text: Qt.formatTime(ListItemData.time, Qt.DefaultLocaleShortDate)
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    fontWeight: FontWeight.Bold
                }
            }
            Label {
                text: ListItemData.trainType
                topMargin: 0
                textStyle {
                    fontWeight: FontWeight.Bold
                }
            }
        }

        Container {
            layoutProperties: StackLayoutProperties { spaceQuota: 3 }
            Label {
                text: "%1 <b>%2</b>"
                      .arg(fahrplan.mode === FahrplanBackend.ArrivalMode ? qsTr("from")
                                                                         : qsTr("to"))
                      .arg(ListItemData.destinationStation)
                textFormat: TextFormat.Html
                multiline: true
                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                }
            }
            Label {
                text: {
                    var plst;
                    if (ListItemData.platform) {
                        plst = qsTr("Pl. %1").arg(ListItemData.platform);
                        if (ListItemData.currentStation) {
                            plst += " / " + ListItemData.currentStation;
                        }
                    } else {
                        plst = ListItemData.currentStation;
                    }
                    return plst;
                }
                multiline: true
                visible: text != ""
                topMargin: 0
            }
            Label {
                text: ListItemData.miscInfo
                multiline: true
                textFormat: TextFormat.Html
                visible: text != ""
                topMargin: 0
                textStyle {
                    fontWeight: FontWeight.Bold
                }
            }
        }
    }
    Divider {}
}
