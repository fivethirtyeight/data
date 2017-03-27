# Cases in the Tenth Circuit Court of Appeals

The raw data behind the story [For A Trump Nominee, Neil Gorsuch’s Record Is Surprisingly Moderate On Immigration](http://53eig.ht/2nPVCrS)

`tenth-circuit.csv` contains Tenth Circuit cases decided during Gorsuch’s tenure.

Field | Description
------|-------------
Name | Name of the case
Date | Date of decision
Federal Reporter Citation | Case citation, as listed in the Federal Reporter Series
Westlaw Citation | Case citation, Westlaw format
Issue | Issue number, in cases divided into multiple issues
Weight | Weight per issue (total weight per case equals one)
Judge1 | Name of first judge
Judge2 | Name of second judge
Judge3 | Name of third judge
Vote1 | Vote of first judge. 1 = liberal, 0 = conservative.
Vote2 | Vote of second judge. 1 = liberal, 0 = conservative.
Vote3 | Vote of third judge. 1 = liberal, 0 = conservative.
Category | Category of case, immigration or discrimination

**Note:** In immigration cases, partial relief to immigration petitioner is coded as liberal because the petitioner typically seeks just one core remedy (e.g., withholding of removal, adjustment of status, or asylum); in discrimination cases, partial relief is coded as multiple issues because the plaintiff often seeks separate remedies under multiple claims (e.g., disparate treatment, retaliation, etc.) and different sources of law.
