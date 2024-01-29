# The Next Bechdel Test

This folder contains data behind the story [The Next Bechdel Test](https://projects.fivethirtyeight.com/next-bechdel/).

`nextBechal_allTests.csv` and shows the high-level breakdown of which movies passed and failed
    - Each row is one of the 50 top-grossing movies from 2016.
    - Each column is one of the tests. A `0` means the movie failed that test, a `1` means it passed.

`nextBechal_castGender.csv` contains the estimated gender for the entire cast for every movie, including whether a role was supporting or main. Data was obtained from [The Numbers](http://the-numbers.com).

Variable | Definition
---|---------
`MOVIE` | Title of the film
`ACTOR` | Full name of the actor
`CHARACTER` | All characters played by the actor in that movie
`TYPE` | Leading, Supporting, Cameo or Lead Ensemble Member
`BILLING` | Billing number
`GENDER` | Estimated gender of the actor


`nextBechal_crewGender.csv` contains data for the crew for every movie, by probablity that a give first name is male.

Variable | Definition
---|---------
`MOVIE` | Title of the film
`DEPARTMENT` | Full name of the actor
`FULL_NAME` | Actor's first and last name
`FIRST_NAME` | Just first name of actor
`IMDB` | Actor's IMDB page
`GENDER_PROB` | Percent chance that a given name is male
`GENDER_GUESS` | Based on the probablity, guess if the name is male or female
