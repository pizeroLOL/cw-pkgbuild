#!/usr/bin/env sh

now=$PWD

cd "/opt/classwidgets-weekly"
setsid ./ClassWidgets
cd "$now"
