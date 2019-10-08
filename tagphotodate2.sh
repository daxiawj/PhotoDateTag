#!/bin/bash

for i in *.[Jj][pP][gG]; do
    t=`echo "$i" | sed -e 's/IMG//;s/.JPG/.jpg/'`
	mkdir -p rename
    datestring=`identify -verbose paisaje_font.jpg |grep -i exif:datetimeOriginal `
	idate=`echo $datestring | cut -c28-37 |sed "s|:|-|g"`
	ihour=`echo $datestring  |cut -c39-46`
	dashd=`echo $datestring  |cut -c28-37| sed "s|:||g"`
	dashh=`echo $datestring  |cut -c39-46| sed "s|:||g"`
    echo mv -f "$i" rename/"${dashd}_${dashh}_olym.jpg"
	#echo convert  -fill red -stroke red -font LiquidCrystal-Normal.otf -pointsize 200 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
	#echo convert  -fill red -stroke red -font LiquidCrystal-Normal.otf -pointsize 200 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
    cat >aa.sh <<EOF
    echo convert  -fill red -stroke red -font digital_display_tfb.ttf -pointsize 300 -gravity SouthEast -draw 'text 50,50 "${idate} ${ihour}"' $i  rename/"font_${dashd}_${dashh}_olym.jpg"
EOF

    mv -f "$i" rename/"${dashd}_${dashh}_olym.jpg"
    bash aa.sh

done
