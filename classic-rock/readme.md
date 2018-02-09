# Classic Rock

This folder contains the data behind the story [Why Classic Rock Isn’t What It Used To Be](https://fivethirtyeight.com/features/why-classic-rock-isnt-what-it-used-to-be/).

Each line represents a play of a song on a radio station.
- The first element, RAW_SONG, is the song text scraped from the radio station
- The second element, Song Clean, is the song's title. It's been made so that all versions
	of the RAW_SONG — be they (live) or spelled differently point to the same text in this \
	field. So even if we scraped "{Don't Fear} The Reaper" or "(Don't Fear) The Reaper"
	or merely "The Reaper" by Blue Oyster Cult, the text in Song Clean is always "(Don't Fear) The Reaper"
- The third element, RAW_ARTIST, is the artist text scraped from the radio station
- The fourth element, ARTIST CLEAN, is a unified version of Raw Artist. So even if we scraped
	"Blue Öyster Cult" or "Blue Oyster Cult" or "Blue ?yster Cult", this field would always
	read as "Blue Oyster Cult".
- The fifth element is that station callsign of the song play
- The sixth element is time the song was pulled. Python measures time as seconds since January 1, 1970.
- The seventh element is a unique ID assigned to each play, formed by the callsign of the
	station that played it and a four digit number, where 0001 is the last song played on the station
	in our set and the highest number is the first song we pulled, if you want to order them.
- The eight element combines Song Clean and ARTIST CLEAN. It can be used for connecting
	this data set to the dataset of unique songs.
- The ninth element is a zero or one used to find if this is the first mention of a given song,
	it's pretty pointless.

classic-rock-song-list:

Each line represents one song in the set
- Song Clean is the name of the song
- ARTIST CLEAN is the name of the artist
- Release Year is the release year, according to SongFacts. If there isn't  a listed year, I couldn't
	find an entry for the song on SongFacts
- COMBINED is the combined song and artist and can be used to connect this dataset to classic-rock-raw-data
- First? is always 1
- Year? is 1 if there was a found year and 0 if no year was found
- PlayCount is the number of plays of the song across all stations.
- F*G is the number of plays of the song across all stations, if a year was found.


`radio.py` is the program to scrape the data from radio sites.

`compiling_radio.py` is the program to consolidate the output of radio.py into one file per station.
