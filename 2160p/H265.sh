for i in *.mkv;
 do name=`echo $i | cut -d'2160' -f1`;
 echo $name;
 ffmpeg -i "$i" -filter_complex \
 "[0]format=gbrp10le, lenscorrection=cx=0.5:cy=0.5:k1=0.12:k2=0.08,format=yuv420p10le,\
 split=2[tmp1][tmp2];\
 [tmp1]crop=iw*(1-0.045*2)+1:ih-1:iw*(0.045-0.002):0,scale=1920:-2[right];\
 [tmp2]crop=iw*(1-0.045*2)+1:ih-1:iw*(0.045+0.002):1,scale=1920:-2[left];\
 [left][right]hstack" -c:v libx265 -crf 10 -preset medium \
 -pix_fmt yuv420p10le \
 -x265-params "colorprim=bt2020:transfer=smpte2084:colormatrix=bt2020nc" "sbs/${i}-sbs.mkv" 
done
