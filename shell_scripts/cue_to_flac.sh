for artist in *; do
    if [ -d "$artist" ]; then
	      cd "$artist";
	      for album in *; do
	          if [ -d "$album" ]; then
		            cd "$album";
		            for i in *.cue; do
		                if [ -f "${i%.*}.flac" ]; then
			                  shnsplit -f "${i}" -o flac -t "%n-%t" "${i%.*}.flac";
                        rm 00-*;
                        rm "${i%.*}.flac";
                        cuetag "$i" *.flac;
                        rm "$i$";
		                fi;
                    if [ -f "${i%.*}.wav" ]; then
			                  shnsplit -f "${i}" -o flac -t "%n-%t" "${i%.*}.wav";
                        rm 00-*;
                        cuetag "$i" *.flac;
                        rm "${i%.*}.flac" "${i}";
		                fi;
		            done;
		            cd ../;
	          fi;
	      done;
	      cd ../;
    fi;
done;
