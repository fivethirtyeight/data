# coding: utf-8

from datetime import datetime, timedelta
from urllib.request import urlopen
import os


def scrape_station(station):
    '''
    This function scrapes the weather data web pages from wunderground.com
    for the station you provide it.

    You can look up your city's weather station by performing a search for
    it on wunderground.com then clicking on the "History" section.
    The 4-letter name of the station will appear on that page.
    '''

    # Scrape between July 1, 2014 and July 1, 2015
    # You can change the dates here if you prefer to scrape a different range
    current_date = datetime(year=2014, month=7, day=1)
    end_date = datetime(year=2015, month=7, day=1)

    # Make sure a directory exists for the station web pages
    os.mkdir(station)

    # Use .format(station, YYYY, M, D)
    lookup_URL = 'http://www.wunderground.com/history/airport/{}/{}/{}/{}/DailyHistory.html'

    while current_date != end_date:

        if current_date.day == 1:
            print(current_date)

        formatted_lookup_URL = lookup_URL.format(station,
                                                 current_date.year,
                                                 current_date.month,
                                                 current_date.day)
        html = urlopen(formatted_lookup_URL).read().decode('utf-8')

        out_file_name = '{}/{}-{}-{}.html'.format(station, current_date.year,
                                                  current_date.month,
                                                  current_date.day)

        with open(out_file_name, 'w') as out_file:
            out_file.write(html)

        current_date += timedelta(days=1)


# Scrape the stations used in this article
for station in ['KCLT', 'KCQT', 'KHOU', 'KIND', 'KJAX',
                'KMDW', 'KNYC', 'KPHL', 'KPHX', 'KSEA']:
    scrape_station(station)
