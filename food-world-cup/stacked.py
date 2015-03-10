import plotly.plotly as py
from plotly.graph_objs import Data, Bar, Layout, Figure, Margin 
"""This program will determine the most popular ethnic food based on demographics."""

import csv
import numpy as np
import string
import operator
import urllib   # urlencode function
import urllib2  # urlopen function (better than urllib version)
import json

filename = "food-world-cup-data.csv"
py.sign_in('hannah.fowler1217', 'gup5rylbyv')

def get_numpy_array(csv_file):                                                                                                                                             
	"""returns a numpy array built from the csv file. To stop numpy from crapping itself, uneven rows and columns are padded with empty strings so that all rows and            columns have the same number of elements"""                                                                                                                                 
	data = []                                                                                                                                                               
	f = open(csv_file, "rU")                                                                                                                                                     
	for row in csv.reader(f):                                                                                                                                              
		data.append(row)                                                                                                                                                    
	length = len(sorted(data,key=len, reverse=True)[0])
	#print np.array([x+[]*(length-len(x)) for x in data])  
	return np.array([x+[]*(length-len(x)) for x in data])  

def fix_data(filename):
	a = get_numpy_array(filename)
	remove = ["N/A"]
	for element in a:
		for index in range(len(element)):
			if element[index] in remove:
				element[index] = 0
	return a

def sum_by_age(filename,age_range):
	data = fix_data(filename)
	final = []
	fn = []
	for n in range(3,43):
		column_country_sum = []
		column_country = data[1:,n]
		for index in range(1,len(column_country)):
			if data[index, 44] == age_range:
				try:
					column_country_sum.append(int(data[index,n]))
				except:
					pass
		final.append(sum(column_country_sum))
	return final

def sum_countries2(filename):
	data = fix_data(filename)
	final = []
	fn = []
	for n in range(3,43):
		new2 = []
		new = data[1:,n]
		for ele in new:
			try:
				new2.append(int(ele))
			except:
				pass
		final.append(sum(new2))
	return final

def country_rank_age(filename,age_range):
	countries = ['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland']
	country_sum = sum_by_age(filename, age_range)
	country_rank = dict(zip(countries,country_sum))
	print country_rank

def country_rank(filename):
	countries = ['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland']
	country_sum = sum_countries2(filename)
	country_rank = dict(zip(countries,country_sum))
	return country_rank


young = sum_by_age('food-world-cup-data.csv', '18-29')
medium = sum_by_age('food-world-cup-data.csv', '30-44')
old = sum_by_age('food-world-cup-data.csv', '45-60')
older = sum_by_age('food-world-cup-data.csv', '> 60')


trace1 = Bar(
    x=['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland'],
    y=young,
    name = '18 - 29'
)
trace2 = Bar(
    x=['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland'],
    y=medium,
    name = '30 - 44'
)
trace3 = Bar(
    x=['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland'],
    y=old,
    name = '45 - 60'
)
trace4 = Bar(
    x=['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland'],
    y=older,
    name = '60+'
)
title = 'Most Popular Ethnic Foods Depending on Age Range'
data = Data([trace1, trace2, trace3, trace4])
layout = Layout(
    autosize=False,
    title = title,
    margin=Margin(
        l=65,
        r=50,
        b=65,
        t=65
    ),
    barmode='stack'
)
fig = Figure(data=data, layout=layout)
plot_url = py.plot(fig)

