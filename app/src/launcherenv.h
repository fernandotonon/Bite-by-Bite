// Bite by Bite - MIT License, see LICENSE
#pragma once

#include <QObject>
#include <QtQml/qqmlregistration.h>

/// The language the QtMesh Games launcher asked for (QTMESH_LANG). Empty when the
/// game was started on its own. Web builds receive the same value as --lang= instead,
/// because a page cannot see the launcher's environment.
class LauncherEnv : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString language READ language CONSTANT)
public:
    explicit LauncherEnv(QObject *parent = nullptr);

    QString language() const;
};
