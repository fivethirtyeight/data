# Puerto Rico Media

This folder contains data behind the stories:
* [The Media Really Has Neglected Puerto Rico](https://fivethirtyeight.com/features/the-media-really-has-neglected-puerto-rico/)
* [The Media Really Started Paying Attention To Puerto Rico When Trump Did](https://fivethirtyeight.com/features/the-media-really-started-paying-attention-to-puerto-rico-when-trump-did/)

### Online News Data

Data about Online News was collected using the [Media Cloud](https://mediacloud.org/) dashboard, an open source suite of tools for analyzing a database of online news.

* `mediacloud_hurricanes.csv` contains the number of sentences per day that mention Hurricanes Harvey, Irma, Jose, and Maria in online news.
* `mediacloud_states.csv` **(Updated through 10/10/2017)** contains the number of sentences per day that mention Puerto Rico, Texas, and Florida in online news.
* `mediacloud_trump.csv` **(Updated through 10/10/2017)** contains the number of headlines that mention Puerto Rico, Texas, and Florida, as well as headlines that mention those three locations along with 'President' or 'Trump'.
* `mediacloud_top_online_news.csv` contains a list of sources included in Media Cloud's "U.S. Top Online News" collection.


### TV News Data

TV News Data was collected from the [Internet TV News Archive](https://archive.org/details/tv) using the [Television Explorer](https://television.gdeltproject.org/cgi-bin/iatv_ftxtsearch/iatv_ftxtsearch) tool. 

* `tv_hurricanes.csv` - contains the percent of sentences per day in TV News that mention Hurricanes Harvey, Irma, Jose, and Maria.
* `tv_hurricanes_by_network.csv` - contains the percent of sentences per day in TV News per network that mention Hurricanes Harvey, Irma, Jose, and Maria.
* `tv_states.csv` **(Updated through 10/10/2017)** - contains the percent of sentences per day in TV News that mention Puerto Rico, Texas, and Florida.

### Google Search Queries

Google search data was collected using the [Google Trends](https://trends.google.com/trends/) dashboard.

* `google_trends.csv` - Contains data on google trend searches for Hurricanes Harvey, Irma, Jose, and Maria.
