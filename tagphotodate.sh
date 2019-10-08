#!/bin/bash

for i in *.[Jj][pP][gG]; do
    t=`echo "$i" | sed -e 's/IMG//;s/.JPG/.jpg/'`
	mkdir -p rename
	idate=`identify -verbose paisaje_font.jpg |grep -i exif:datetimeOriginal |cut -c28-37 |sed "s|:|-|g"`
	ihour=`identify -verbose paisaje_font.jpg |grep -i exif:datetimeOriginal |cut -c39-46`
	dashd=`identify -verbose paisaje_font.jpg |grep -i exif:datetimeOriginal |cut -c28-37| sed "s|:||g"`
	dashh=`identify -verbose paisaje_font.jpg |grep -i exif:datetimeOriginal |cut -c39-46| sed "s|:||g"`
    echo mv -f "$i" rename/"${dashd}_${dashh}_olym.jpg"
	#echo convert  -fill red -stroke red -font LiquidCrystal-Normal.otf -pointsize 200 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
	#echo convert  -fill red -stroke red -font LiquidCrystal-Normal.otf -pointsize 200 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
    cat >aa.sh <<EOF
	echo convert  -fill red -stroke red -font digital_display_tfb.ttf -pointsize 300 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
EOF
    bash aa.sh

done
