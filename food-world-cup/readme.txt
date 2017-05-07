README

Ethnic Food Visualization
Annabel Consilvio and Hannah Fowler

------------
SET-UP
------------
In order to get this program to run, first make sure the program and data set "food-world-cup-data.csv" are in the same directory.  

------------
DATA
------------
If you are looking for only the data used in the plots as your output, print a Data object that calls get_country_rank_age()  The default age range used is 30-44.  This can be changed in the function __init__ in the Data class or can be reset before you run get_country_rank_age() in line.

------------
PLOTTING
------------
If you are looking to plot, create a data object with the specified file name.  Then make this data object a plot object - Plot(Data(filename)).  Then call make_barplot on this plot object.


------------
DATA KEY
------------
If you are looking for more information on the data set used in this program, please visit five-thirty-eight's github repository.  The data was created by ranks on the scale defined below.  We assumed that N/A data points could be called 0 for a variety of reason, the largest being that when the data was taken, if a person was not asked a specific question the data would return N/A but the data would also return N/A if the person specifically said they didn't know about the food.  Because of this ambiguity, we had to assume that any N/A data point was equal to 0.

Anwser key for the responses to the "Please rate how much you like the traditional cuisine of X:" questions.

5: I love this country's traditional cuisine. I think it's one of the best in the world.
4: I like this country's traditional cuisine. I think it's considerably above average.
3: I'm OK with this county's traditional cuisine. I think it's about average.
2: I dislike this country's traditional cuisine. I think it's considerably below average.
1: I hate this country's traditional cuisine. I think it's one of the worst in the world.
N/A: I'm unfamiliar with this country's traditional cuisine.