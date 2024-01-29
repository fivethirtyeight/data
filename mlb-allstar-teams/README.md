# MLB All-Star Teams

This folder contains data behind the story [The Best MLB All-Star Teams Ever](http://fivethirtyeight.com/features/the-best-mlb-all-star-teams-ever/).

Estimates of most talented MLB All-Star teams, 1933-2015

`allstar_team_talent.csv` contains team talent estimates with the following headers:

Header | Definition
---|---------
`yearID` | The season in question
`gameNum` | Order of All-Star Game for the season (in years w/ multiple ASGs; set to 0 when only 1 per year)
`gameID` | Game ID at Baseball-Reference.com
`lgID` | League of All-Star team
`tm_OFF_talent` | Total runs of offensive talent above average per game (36 plate appearances)
`tm_DEF_talent` | Total runs of fielding talent above average per game (36 plate appearances)
`tm_PIT_talent` | Total runs of pitching talent above average per game (9 innings)
`MLB_avg_RPG` | MLB average runs scored/game that season
`talent_RSPG` | Expected runs scored per game based on talent (MLB R/G + team OFF talent)
`talent_RAPG` | Expected runs allowed per game based on talent (MLB R/G - team DEF talent- team PIT talent)
`unadj_PYTH` | Unadjusted pythagorean talent rating; PYTH =(RSPG^1.83)/(RSPG^1.83+RAPG^1.83)
`timeline_adj` | Estimate of relative league quality where 2015 MLB = 1.00
`SOS` | Strength of schedule faced; adjusts an assumed .500 SOS downward based on timeline adjustment
`adj_PYTH` | Adjusted pythagorean record; =(SOS*unadj_Pyth)/((2*unadj_Pyth*SOS)-SOS-unadj_Pyth+1)
`no_1_player` | Best player according to combo of actual PA/IP and talent
`no_2_player` | 2nd-best player according to combo of actual PA/IP and talent

`allstar_player_talent.csv` contains team player estimates with the following headers:

Header | Definition
---|---------
`bbref_ID` | Player's ID at Baseball-Reference.com
`yearID` | The season in question
`gameNum` | Order of All-Star Game for the season (in years w/ multiple ASGs; set to 0 when only 1 per year)
`gameID` | Game ID at Baseball-Reference.com
`lgID` | League of All-Star team
`startingPos` | Postion (according to baseball convention; 1=pitcher, 2=catcher, etc.) if starter
`OFF600` | Estimate of offensive talent, in runs above league average per 600 plate appearances
`DEF600` | Estimate of fielding talent, in runs above league average per 600 plate appearances
`PITCH200` | Estimate of pitching talent, in runs above league average per 200 innings pitched
`asg_PA` | Number of plate appearances in the All-Star Game itself
`asg_IP` | Number of innings pitched in the All-Star Game itself
`OFFper9innASG` | Expected offensive runs added above average (from talent) based on PA in ASG, scaled to a 9-inning game
`DEFper9innASG` | Expected defensive runs added above average (from talent) based on PA in ASG, scaled to a 9-inning game
`PITper9innASG` | Expected pitching runs added above average (from talent) based on IP in ASG, scaled to a 9-inning game
`TOTper9innASG` | Expected runs added above average (from talent) based on PA/IP in ASG, scaled to a 9-inning game

