#!/usr/bin/env sh

# 设置默认的 XDG_CONFIG_HOME 和 XDG_CACHE_HOME 如果没有设置
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
XDG_CACHE_HOME=${XDG_CONFIG_HOME:-~/.cache}

now=$PWD

# 检测 $XDG_CONFIG_HOME/classwidgets-nightly 是否存在，若不存在则从 /opt/classwidgets-nightly/config 拷贝
if [ ! -d "$XDG_CONFIG_HOME/classwidgets-nightly" ]; then
    mkdir -p "$XDG_CONFIG_HOME/classwidgets-nightly"
    cp -r /opt/classwidgets-nightly/config/* "$XDG_CONFIG_HOME/classwidgets-nightly/"
fi

# 检测 $XDG_CACHE_HOME/classwidgets-nightly 是否存在，若不存在则创建
if [ ! -d "$XDG_CACHE_HOME/classwidgets-nightly" ]; then
    mkdir -p "$XDG_CACHE_HOME/classwidgets-nightly"
fi

# 将所有 /opt/classwidgets-nightly 下所有文件和文件夹链接到 $XDG_CACHE_HOME/classwidgets-nightly/ 除了 config 文件夹
for item in /opt/classwidgets-nightly/*; do
    if [ "$(basename "$item")" != "config" ]; then
        ln -sf "$item" "$XDG_CACHE_HOME/classwidgets-nightly/"
    fi
done

# 检测 $XDG_CACHE_HOME/classwidgets-nightly/config 是否链接到 $XDG_CONFIG_HOME 如果没有则链接
if [ ! -L "$XDG_CACHE_HOME/classwidgets-nightly/config" ]; then
    ln -sf "$XDG_CONFIG_HOME/classwidgets-nightly" "$XDG_CACHE_HOME/classwidgets-nightly/config"
fi

cd "$XDG_CACHE_HOME/classwidgets-nightly"
setsid ./ClassWidgets
cd "$now"
