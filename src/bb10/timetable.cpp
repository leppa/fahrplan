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

#include "timetable.h"

Timetable::Timetable(QObject *parent)
    : bb::cascades::QMapListDataModel()
{
    setParent(parent);
}

void Timetable::setTimetableEntries(const TimetableEntriesList &list)
{
    clear();

    QList<QVariantMap> mapList;
    foreach (const TimetableEntry &item, list) {
        QVariantMap map;
        map.insert("currentStation", item.currentStation);
        map.insert("destinationStation", item.destinationStation);
        map.insert("trainType", item.trainType);
        map.insert("platform", item.platform);
        map.insert("time", item.time);
        map.insert("miscInfo", item.miscInfo);
        map.insert("latitude", item.latitude);
        map.insert("longitude", item.longitude);

        mapList << map;
    }

    bb::cascades::QMapListDataModel::append(mapList);
}
