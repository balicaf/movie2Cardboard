for i in *.mkv;
 do name=${i%.*}
 echo $name;
 ffmpeg -i "$i" -filter_complex \
 "format=gbrp, lenscorrection=cx=0.5:cy=0.5:k1=0.12:k2=0.08,format=yuv420p, \
 split=2[tmp1][tmp2];\
 [tmp1]crop=iw*(1-0.045*2)+1:ih-1:iw*(0.045-0.002):0,scale=1920:-2[right];\
 [tmp2]crop=iw*(1-0.045*2)+1:ih-1:iw*(0.045+0.002):1,scale=1920:-2[left];\
 [left][right]hstack" -c:v libx264 -crf 9 -preset ultrafast \
 "sbs/$name-sbs.mkv" 
done
