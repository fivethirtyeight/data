# fight-songs

This folder contains data behind the story [Our Guide To The Exuberant Nonsense Of College Fight Songs](https://projects.fivethirtyeight.com/college-fight-song-lyrics/).


`fight-songs.csv` contains data about fight songs from all schools in the Power Five conferences — the ACC, Big Ten, Big 12, Pac-12 and SEC — plus Notre Dame. Some schools have more than one fight song, and some of the songs sanctioned as “official” by their schools aren’t the ones that fans sing out. We chose the songs that seemed best-known and best-loved. We also limited our analysis to the lyrics sung most regularly and also published by the school, so some verses were not included in the analysis. The tempo and length information come from the version of the song we chose from those available on Spotify.
 
Column definitions:

Column   | Description
---------|---------------
`school`| School name
`conference`| School college football conference
`song_name`| Song title
`writers`| Song author
`year`| Year the song written. Some values are `Unknown`
`student_writer`| Was the author a student? Some values are `Unknown`
`official_song`| Is the song the official fight song according to the university?
`contest`| Was the song chosen as the result of a contest?
`bpm`| Beats per minute
`sec_duration`| Duration of song in seconds
`fight`| Does the song say “fight”?
`number_fights`| Number of times the song says “fight”?
`victory`| Does the song say “victory”?
`win_won`| Does the song say “win” or “won”? 
`victory_win_won`| Does the song say “victory,” “win” or “won”? 
`rah`| Does the song say “rah”?
`nonsense`| Does the song use nonsense syllables (e.g. "Whoo-Rah" or "Hooperay")
`colors`| Does the song mention the school colors? 
`men`| Does the song refer to a group of men (e.g. men, boys, sons, etc.)?
`opponents`| Does the song mention any opponents?
`spelling`| Does the song spell anything?
`trope_count`| Total number of tropes (`fight`, `victory`, `win_won`, `rah`, `nonsense`,`colors`, `men`, `opponents`, and `spelling`).
`spotify_id`| Spotify id for the song
