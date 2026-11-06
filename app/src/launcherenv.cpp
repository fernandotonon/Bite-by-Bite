// Bite by Bite - MIT License, see LICENSE
#include "launcherenv.h"

#include <QtGlobal>

LauncherEnv::LauncherEnv(QObject *parent)
    : QObject(parent)
{
}

QString LauncherEnv::language() const
{
    return qEnvironmentVariable("QTMESH_LANG");
}
