# The Next Bechdel Test 
Data for [The Next Bechdel Test](http://google.com) story.

## Data included

1. `nextBechal_allTests.csv` powers the graphics on the page, and shows the high-level breakdown of which movies passed and failed 
    - Each row is one of the 50 top-grossing movies from 2016
    - Each column is one of the tests. A `0` means the movie failed that test, a `1` means it passed. 

2. `nextBechal_castGender.csv` Gender for the entire cast for every movie, including whether a role was supporting or main 
    Variable | Definition
    ---|---------
    `movie` | Title of the film
    `actor` | Full name of the actor
    `Character` | All characters played by the actor in that movie
    `Type` | Leading, Supporting, Cameo or Lead Ensemble Member
    `Billing` | Billing number
    `Gender` | Gender of the actor.


3. `nextBechal_crewGender.csv` crew for every movie, by probablity that a give first name is male.  
    Variable | Definition
    ---|---------
    `movie` | Title of the film
    `department` | Full name of the actor
    `Full name` | Actor's first and last name
    `First name` | Just first name of actor
    `IMBD` | Actor's imdb page
    `Gender Probablity` | Percent chance that a given name is male
    `Gender Guess` | Based on the probablity, guess if the name is male or female