import matplotlib.pyplot as plt
import pandas as pd
from datetime import datetime

'''
This is an example to generate the Philadelphia, PA weather chart.

If you want to make the chart for another city, you will have to modify
this code slightly to read that city's data in, change the title, and
likely change the y-axis of the chart to fit your city's temperature range.

I also use a custom matplotlib style as the basis for these charts, which you
can find here: https://gist.githubusercontent.com/rhiever/d0a7332fe0beebfdc3d5/raw/223d70799b48131d5ce2723cd5784f39d7a3a653/tableau10.mplstyle
'''

weather_data = pd.read_csv('KPHL.csv', parse_dates=['date'])
print(weather_data.describe())

# Generate a bunch of histograms of the data to make sure that all of the data
# is in an expected range.
with plt.style.context('https://gist.githubusercontent.com/rhiever/d0a7332fe0beebfdc3d5/raw/223d70799b48131d5ce2723cd5784f39d7a3a653/tableau10.mplstyle'):
    for column in weather_data.columns:
        if column in ['date']:
            continue
        plt.figure()
        plt.hist(weather_data[column].values)
        plt.title(column)
        plt.savefig('{}.png'.format(column))

    # Make sure we're only plotting temperatures for July 2014 - June 2015
    weather_data_subset = weather_data[weather_data['date'] >= datetime(year=2014, month=7, day=1)]
    weather_data_subset = weather_data_subset[weather_data_subset['date'] < datetime(year=2015, month=7, day=1)].copy()
    weather_data_subset['day_order'] = range(len(weather_data_subset))

    day_order = weather_data_subset['day_order']
    record_max_temps = weather_data_subset['record_max_temp'].values
    record_min_temps = weather_data_subset['record_min_temp'].values
    average_max_temps = weather_data_subset['average_max_temp'].values
    average_min_temps = weather_data_subset['average_min_temp'].values
    actual_max_temps = weather_data_subset['actual_max_temp'].values
    actual_min_temps = weather_data_subset['actual_min_temp'].values

    fig, ax1 = plt.subplots(figsize=(15, 7))

    # Create the bars showing all-time record highs and lows
    plt.bar(day_order, record_max_temps - record_min_temps, bottom=record_min_temps,
            edgecolor='none', color='#C3BBA4', width=1)

    # Create the bars showing average highs and lows
    plt.bar(day_order, average_max_temps - average_min_temps, bottom=average_min_temps,
            edgecolor='none', color='#9A9180', width=1)

    # Create the bars showing this year's highs and lows
    plt.bar(day_order, actual_max_temps - actual_min_temps, bottom=actual_min_temps,
            edgecolor='black', linewidth=0.5, color='#5A3B49', width=1)

    new_max_records = weather_data_subset[weather_data_subset.record_max_temp <= weather_data_subset.actual_max_temp]
    new_min_records = weather_data_subset[weather_data_subset.record_min_temp >= weather_data_subset.actual_min_temp]

    # Create the dots marking record highs and lows for the year
    plt.scatter(new_max_records['day_order'].values + 0.5,
                new_max_records['actual_max_temp'].values + 1.25,
                s=15, zorder=10, color='#d62728', alpha=0.75, linewidth=0)

    plt.scatter(new_min_records['day_order'].values + 0.5,
                new_min_records['actual_min_temp'].values - 1.25,
                s=15, zorder=10, color='#1f77b4', alpha=0.75, linewidth=0)

    plt.ylim(-15, 111)
    plt.xlim(-5, 370)

    plt.yticks(range(-10, 111, 10), [r'{}$^\circ$'.format(x)
                                     for x in range(-10, 111, 10)], fontsize=10)
    plt.ylabel(r'Temperature ($^\circ$F)', fontsize=12)

    month_beginning_df = weather_data_subset[weather_data_subset['date'].apply(lambda x: True if x.day == 1 else False)]
    month_beginning_indeces = list(month_beginning_df['day_order'].values)
    month_beginning_names = list(month_beginning_df['date'].apply(lambda x: x.strftime("%B")).values)
    month_beginning_names[0] += '\n\'14'
    month_beginning_names[6] += '\n\'15'

    # Add the last month label manually
    month_beginning_indeces += [weather_data_subset['day_order'].values[-1]]
    month_beginning_names += ['July']

    plt.xticks(month_beginning_indeces,
               month_beginning_names,
               fontsize=10)

    ax2 = ax1.twiny()
    plt.xticks(month_beginning_indeces,
               month_beginning_names,
               fontsize=10)

    plt.xlim(-5, 370)
    plt.grid(False)

    ax3 = ax1.twinx()
    plt.yticks(range(-10, 111, 10), [r'{}$^\circ$'.format(x)
                                     for x in range(-10, 111, 10)], fontsize=10)
    plt.ylim(-15, 111)
    plt.grid(False)

    plt.title('Philadelphia, PA\'s weather, July 2014 - June 2015\n\n', fontsize=20)

    plt.savefig('philadelphia-weather-july14-june15.png')
