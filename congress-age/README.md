# Congress Age

This folder contains the data behind the story [Both Republicans And Democrats Have an Age Problem](https://fivethirtyeight.com/features/both-republicans-and-democrats-have-an-age-problem/)

`congress-terms.csv` has an entry for every member of congress who served at any point during a particular congress between January 1947 and Februrary 2014.

House membership data is from the [@unitedstates project](http://theunitedstates.io/), with Congress meeting numbers added using code from [GovTrack](https://www.govtrack.us/developers/api):

* https://github.com/unitedstates/congress-legislators
* https://github.com/govtrack/govtrack.us-web/blob/master/us.py#L93

Senate membership data is mostly from the [New York Times Congress API](http://developer.nytimes.com/docs/read/congress_api) combined with birthdays from @unitedstates. (It does not include the birthday of Sen. Elmer Thomas.)

In addition, we added an `incumbent` field to each record.
