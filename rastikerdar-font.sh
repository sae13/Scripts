#!/bin/bash
#Myblog: http://sae13.ir
#Saber RastikerdarBlog: https://rastikerdar.blog.ir/ 
which unzip >/dev/null 2>&1
if [ $? -ne 0 ];then
    echo "You Need Install unzip package"
    exit
fi
which wget >/dev/null 2>&1
if [ $? -ne 0 ];then
    echo "You need install wget! thats weird even my grandma has that on her machine"
    exit
fi

fonts_array=(vazir samim tanha shabnam gandom parastoo sahel)
mkdir /tmp/rastikerdar 2>/dev/null
mkdir -p ~/.fonts/rastikerdar 2>/dev/null

for font_name in ${fonts_array[*]}
    do
    echo -e "let Download "$font_name"\n in /tmp/rastikerdar and install in\n"$HOME"/.fonts/rastikerdar\n"
    new_font_address="https://github.com/"`curl -Ls https://github.com/rastikerdar/$font_name-font/releases/latest|grep -m 1 -o "\/.*\.zip"`
    wget -O /tmp/rastikerdar/$font_name.zip $new_font_address
    unzip -n /tmp/rastikerdar/$font_name.zip  -d ~/.fonts/rastikerdar
done
fc-cache -r
