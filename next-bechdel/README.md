# The Next Bechdel Test

This folder contains data behind the story [The Next Bechdel Test](https://projects.fivethirtyeight.com/next-bechdel/).

A series of tests were conducted to determine if movies' casts and/or grews had a gender imbalance. `nextBechal_allTests.csv` shows which movies passed and failed the tests. Each row represents one of the 50 top-grossing movies from 2016. Each column represents one test; a `0` means that a movie failed a test and a `1` means that a movie passed a test.

`nextBechal_castGender.csv` contains data about movies' casts. The data includes actors' first and last names and the characters that actors portrayed. The data was obtained from [The Numbers](http://the-numbers.com).

The following table provides a definition for each header in `nextBechal_castGender.csv`:

Header | Definition
---|---------
`MOVIE` | The title of the movie that an actor is in
`ACTOR` | The actor's first and last name
`CHARACTER` | The characters that the actor portrayed in the movie
`TYPE` | Indicates if the actor was a "Leading", "Supporting", "Cameo", or "Lead Ensemble" actor
`BILLING` | The billing number
`GENDER` | A _guess_ for the actor's gender


`nextBechal_crewGender.csv` contains data about movies' crews. The data includes crew members' first and last names and crew members' departments.

The following table provides a definition for each header in `nextBechal_crewGender.csv`:

Header | Definition
---|---------
`MOVIE` | The title of the movie that the crew member worked on
`DEPARTMENT` | The crew member's department
`FULL_NAME` | The crew member's first and last name
`FIRST_NAME` | The crew member's first name
`IMDB` | The crew member's IMDB page
`GENDER_PROB` | The percent chance that the crew member's name is male
`GENDER_GUESS` | A _guess_ for the crew member's gender which is based on `GENDER_PROB`