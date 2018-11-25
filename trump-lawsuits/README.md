# Trump Lawsuits

This folder contains the data behind the story [What Trump's Legal Battles Tell Us About Presidential Power]().

Variable	| Description | Values
---|---|----
`docketNumber` | Current docket number
`dateFiled` | Date lawsuit was originally filed
`caseName` | Case name (current)
`plaintiff` | Names of plaintiffs (if more than five, "et al" for plaintiffs who are not in case name)
`defendant` | Names of defendants (if more than five, "et al" for defendants who are not in case name)
`currentLocation` | Court the lawsuit is currently in front of
`previousLocation` | Other courts the case has appeared before 
`jurisdiction` | Where the case is being heard | 1 = Federal; 2 = State
`judge` | Names of the judges the case is currently before
`nature` | PACER code for nature of lawsuit (Not relevant for criminal cases) https://www.pacer.gov/documents/natsuit.pdf
`capacity` | The capacity in which Trump is implicated | 1 = Case directed at Trump personally; 2 = Case directed at action of Trump administration; 3 = Trump as plaintiff; 4 = Trump administration as plaintiff; 5 = Case directed at Trump associate; 6 = Other
`type` | Criminal vs. civil | 1 = Criminal; 2 = Civil
`TrumpCategory` | Whether the case is related to action before Trump was president, his personal conduct as president, or a policy action as president | 1 = Case directed at pre-presidency action; 2 = Case directed at personal action of Trump as president; 3 = Case directed at policy action of Trump as president
`issue` | Key topic area raised in the case (i.e. emoluments, First Amendment, DACA, etc). Categories created based on key policy topic area or legal issue. Calls are subjective and based on reporting and may change.
`docketOrig` | Original docket number, if case has been appealed or changed jurisdiction