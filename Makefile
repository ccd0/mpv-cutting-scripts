clip.mkv: clip.sh val-start val-end val-filename
	./clip.sh

clip.webm: encode.sh clip.mkv val-filename val-humanstart
	./encode.sh

clean:
	rm -rf *.mkv *.ass *.webm ~/.fonts/tmp

.PHONY: clean

