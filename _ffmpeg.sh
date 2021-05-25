#ffmpeg -framerate 25 -i %05d.jpg out.mp4


 fr=10
 cdir=$(pwd)
 for d in xsc_2105242218/ xsc_2105242251/ xsc_2105242253/ xsc_2105242255/ xsc_2105242293/ xsc_2105242295/ xsc_2105242297/ xsc_2105242233/ xsc_2105242252/ xsc_2105242254/ xsc_2105242256/ xsc_2105242294/ xsc_2105242296/ xsc_2105242299/ ; do 
	 echo $d  
	 cd $d'CP'
	 mkdir -p outputdir
	 for f in *.jpg; do jpegtran -optimize -copy none -perfect -v "$f" > "outputdir/$f"; done
	 cd outputdir

	 fn=$(echo $d | sed -e 's/\///g') && \
		 ffmpeg   -framerate $fr -i %05d.jpg -codec copy  $cdir/$fn'_fr'$fr'_full.mp4' 
	 cd $cdir
done
