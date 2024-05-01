# Quiet Caucus 2024

This directory contains the data behind “[The 8 Types Of Democrats And Republicans In The House](https://projects.fivethirtyeight.com/types-democrats-republicans-house-2024/)” (May 1, 2024). 

`clustered_congress.csv` contains data for each member of the U.S. House of Representatives. In particular, it includes their official caucus affiliations, partisanship, term length, DW-NOMINATE scores and the clusters to which they were assigned in 538’s analysis. 

Brief descriptions for each column are in the table below. For detailed information, see the methodology section at the bottom of [the interactive](https://projects.fivethirtyeight.com/types-democrats-republicans-house-2024/). 

Header | Definition
---|---------
`icpsr` | ICPSR ID number for the member, defined by the University of Michigan [Institute for Social Research](https://www.icpsr.umich.edu/web/pages/index.html)
`name` | Name of the member
`last_name` | Last name of the member
`party` | `D` or `R`, indicating if the member is a Democrat or Republican
`district` | District of the member
`terms_pct` | Number of terms each member has served, calculated as described in the methodology 
`2020_margin` | Margin by which Trump or Biden won the district in the 2020 presidential election
`cluster` | Name of the cluster to which the lawmaker was assigned in 538’s analysis. If the member was unable to be categorized (see methodology), this column will be blank.
`agreement_score` | Percent of votes on which this member agrees with the average behavior of their caucus, as described in the methodology
`progressive` | Whether the lawmaker is a member of the Congressional Progressive Caucus. `TRUE` if yes, blank otherwise
`new_dems` | Whether the lawmaker is a member of the New Democrat Coalition. `TRUE` if yes, blank otherwise
`blue_dogs` | Whether the lawmaker is a member of the Blue Dog Coalition. `TRUE` if yes, blank otherwise
`problem_solvers` | Whether the lawmaker is a member of the Problem Solvers Caucus. `TRUE` if yes, blank otherwise
`RMSP` | Whether the lawmaker is a member of the Republican Main Street Partnership. `TRUE` if yes, blank otherwise
`governance` | Whether the lawmaker is a member of the Republican Governance Group. `TRUE` if yes, blank otherwise
`study` | Whether the lawmaker is a member of the Republican Study Committee. `TRUE` if yes, blank otherwise
`freedom` | Whether the lawmaker is a member of the Freedom Caucus. `TRUE` if yes, blank otherwise
`dw_nominate_dim1` | Dimension 1 DW-NOMINATE score, as calculated by VoteView
`dw_nominate_dim2` | Dimension 2 DW-NOMINATE score, as calculated by VoteView
`notes` | Notes about the lawmaker

Sources: [VoteView](https://voteview.com/data), [Daily Kos](https://www.dailykos.com/stories/2022/11/14/1163009/-Daily-Kos-Elections-presidential-results-by-congressional-district-for-2020), official caucus websites, [Pew Research Center](https://www.pewresearch.org/short-reads/2023/01/23/freedom-caucus-likely-to-play-a-bigger-role-in-new-gop-led-house-so-who-are-they/)
