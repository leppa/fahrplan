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
import QtQuick 1.0
import Fahrplan 1.0

TitleBar {
    kind: TitleBarKind.FreeForm
    kindProperties: FreeFormTitleBarKindProperties {
        id: tbp
        Container {
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            leftPadding: 20
            Label {
                text: fahrplan.parserName
                verticalAlignment: VerticalAlignment.Center
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
        }
        expandableArea {
            content: ScrollView {
                Container {
                    RadioGroup {
                        id: services

                        selectedIndex: fahrplan.backends.getItemIndexForParserId(fahrplan.parserIndex);

                        onSelectedOptionChanged: {
                            tbp.expandableArea.expanded = false;
                            fahrplan.setParser(fahrplan.backends
                                               .getParserIdForItemIndex(selectedIndex));
                        }

                        attachedObjects: [
                            Repeater {
                                model: fahrplan.backends.getSortedBackendParserList();
                                delegate: Option {
                                    text: modelData
                                }
                            }
                        ]
                    }
                }
            }
        }
    }
}
