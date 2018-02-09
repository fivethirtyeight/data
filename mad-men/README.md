# Mad Men

This directory contains the data behind the story [‘Mad Men’ Is Ending. What’s Next For The Cast?](http://fivethirtyeight.com/datalab/mad-men-is-ending-whats-next-for-the-cast/)

The primary file `show-data.csv` contains data of actors who appeared on at least half the episodes of television shows that were nominated for an Emmy for Outstanding Drama since the year 2000. It contains the following variables:

Header | Definition
---|---------
`Performer` | The name of the actor, according to IMDb. This is not a unique identifier - two performers appeared in more than one program
`Show` | The television show where this actor appeared in more than half the episodes
`Show Start` | The year the television show began
`Show End` | The year the television show ended, "PRESENT" if the show remains on the air as of May 10. 
`Status?` | Why the actor is no longer on the program:  "END" if the show has concluded, "LEFT" if the show remains on the air.
`CharEnd` | The year the character left the show. Equal to "Show End" if the performer stayed on until the final season. 
`Years Since` | 2015 minus CharEnd
`#LEAD` | The number of leading roles in films the performer has appeared in since and including "CharEnd", according to OpusData
`#SUPPORT` | The number of leading roles in films the performer has appeared in since and including "CharEnd", according to OpusData
`#Shows` | The number of seasons of television of which the performer appeared in at least half the episodes since and including "CharEnd", according to OpusData
`Score` | #LEAD + #Shows + 0.25*(#SUPPORT)
`Score/Y` | "Score" divided by "Years Since"
`lead_notes` | The list of films  counted in #LEAD
`support_notes` | The list of films  counted in #SUPPORT
`show_notes`| The seasons of shows counted in #Shows

The supplemental file `performer-scores.csv` is the consolidated data from `show-data.csv` made into a pivot table.