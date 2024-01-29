# Science Giving

This directory contains the data behind the story [When Scientists Donate To Politicians, It’s Usually To Democrats](https://fivethirtyeight.com/features/when-scientists-donate-to-politicians-its-usually-to-democrats).

The data in `science_federal_giving.csv` is from the Federal Election Commission, filtered to donations form the following occupations from 2007 to 2016: 
* computer and information scientists
* mathematical scientists
* agricultural and food scientists
* biological and medical scientists
* environmental life scientists
* chemists
* Earth scientists, geologists and oceanographers
* physicists and astronomers
* other physical and related scientists
* aerospace, aeronautical or astronautical engineers
* chemical engineers
* civil, architectural or sanitary engineers
* electrical or computer hardware engineers
* industrial engineers
* mechanical engineers
* other engineers
* statisticians

Header | Definition
---|---------
`cmte_nm` | Committee name
`cmte_id` | Committee identification, assigned 
`cmte_tp` | Committee type. [List of committee type codes](http://www.fec.gov/finance/disclosure/metadata/CommitteeTypeCodes.shtml)
`cmte_pty` | Committee party. [List of party codes](http://www.fec.gov/finance/disclosure/metadata/DataDictionaryPartyCodeDescriptions.shtml)
`cand_name` | Candidate name
`cand_pty_affiliation` | Political party affiliation reported by the candidate
`cand_office_st` | Candidate state
`cand_office` | Candidate office. H = House, P = President, S = Senate
`cand_office_district` | Candidate district
`cand_status` | Candidate status. C = Statutory candidate, F = Statutory candidate for future election, N = Not yet a statutory candidate, P = Statutory candidate in prior cycle
`rpt_tp` | Report type. [Report type codes](http://www.fec.gov/finance/disclosure/metadata/ReportTypeCodes.shtml)
`transaction_pgi` | The code for which the contribution was made. EYYYY (election plus election year). P = Primary, G = General, O = Other, C = Convention, R = Runoff, S = Special, E = Recount
`transaction_tp` | Transaction type. [Type codes](http://www.fec.gov/finance/disclosure/metadata/DataDictionaryTransactionTypeCodes.shtml)
`entity_tp` | Entity type. Only valid for electronic filings received after April 2002. CAN = Candidate, CCM = Candidate Committee, COM = Committee, IND = Individual (a person), ORG = Organization (not a committee and not a person), PAC = Political Action Committee, PTY = Party Organization
`cleaned_name` | Contributor/lender/transfer name
`city` | City/town
`state` | State
`zip_code` | Zip code
`employer` | Employer
`cleaned_occupation` | Occupation
`classification` | Classification of occupation
`transaction_dt` | Transaction date (MMDDYYYY)
`cycle` | Election cycle
`transaction_amt` | Transaction amount
`2016_dollars` | Transation amount adjusted for inflation
`other_id` | Other identification number. For contributions from individuals this column is null. For contributions from candidates or other committees this column will contain that contributor's FEC ID.
`tran_id` | Transaction ID
`file_num` | A unique identifier associated with each itemization or transaction appearing in an FEC electronic file. Only valid for electronic filings.
`memo_cd` | 'X' indicates that the amount is not to be included in the itemization total.
`memo_text` | A description of the activity.
`sub_id` | FEC record number

Source: [Federal Election Commission](http://www.fec.gov/)
