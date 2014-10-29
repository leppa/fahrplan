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

import "../js/style.js" as UI
import "../../about.js" as About

Page {
    id: root

    actionBarVisibility: ChromeVisibility.Overlay
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll

    titleBar: TitleBar {
        title: qsTr("About Fahrplan") + Retranslate.onLocaleOrLanguageChanged
    }
    ScrollView {
        Container {
            topPadding: ui.sdu(UI.paddingTop)
            leftPadding: ui.sdu(UI.paddingLeft)
            bottomPadding: layoutHandler.bottomOverlayHeight
            rightPadding: ui.sdu(UI.paddingRight)

            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }

                ImageView {
                    property int size: 200

                    imageSource: "qrc:/data/fahrplan2-square_256.png"
                    minWidth: size
                    minHeight: size
                    maxWidth: size
                    maxHeight: size
                }

                Container {
                    leftPadding: ui.sdu(UI.paddingLeft)

                    Label {
                        text: "Fahrplan"
                        topMargin: 0
                        bottomMargin: 0
                        textStyle {
                            base: SystemDefaults.TextStyles.TitleText
                        }
                    }
                    Label {
                        text: qsTr("Version: <b>%1</b>").arg(fahrplan.version)
                              + Retranslate.onLocaleOrLanguageChanged
                        textFormat: TextFormat.Html
                        topMargin: 0
                        bottomMargin: 0
                    }
                    Label {
                        text: About.copyright
                        multiline: true
                        topMargin: 0
                        bottomMargin: 0
                    }
                }
            }

            Label {
                text: qsTr("Maintainers") + Retranslate.onLocaleOrLanguageChanged
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Label {
                multiline: true
                text: "- " + About.maintainers.join("\n- ")
//                textFormat: TextFormat.Html
            }

            Label {
                text: qsTr("Code Contributors") + Retranslate.onLocaleOrLanguageChanged
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Label {
                multiline: true
                text: About.codeContributors.join(", ")
//                textFormat: TextFormat.Html
            }

            Label {
                text: qsTr("Translators") + Retranslate.onLocaleOrLanguageChanged
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Label {
                multiline: true
                text: "- " + About.translators.join("\n- ")
//                textFormat: TextFormat.Html
            }

            Label {
                text: qsTr("Support") + Retranslate.onLocaleOrLanguageChanged
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Label {
                multiline: true
                text: About.support + Retranslate.onLocaleOrLanguageChanged
                textFormat: TextFormat.Html
            }

            Label {
                text: qsTr("License") + Retranslate.onLocaleOrLanguageChanged
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Label {
                multiline: true
                text: About.license
                textFormat: TextFormat.Html
            }
        }
    }

    attachedObjects: [
        PageLayoutUpdateHandler {
            id: layoutHandler
        }
    ]
}
