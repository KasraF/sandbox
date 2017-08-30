# This script, when run in the parent directory of my
# music collections, will look through all .cue files
# and prints the names of ones that contain the 
# character.
for artist in *; do
    if [ -d "$artist" ]; then
	cd "$artist";
	for album in *; do
	    if [ -d "$album" ]; then
		cd "$album";
		for i in *.cue; do
		    if [ -f "$i" ]; then
			if [[ $(cat "$i" | grep ) ]]; then
			    echo "$i";
			fi;
		    fi;
		done;
		cd ../;
	    fi;
	done;
	cd ../;
    fi;
done;
