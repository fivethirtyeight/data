"""This program will determine the most popular ethnic food based on demographics.
By Annabel Consilvio and Hannah Fowler"""

import csv
import numpy as np
import string
import matplotlib
import matplotlib.pyplot as plt
import operator
import urllib   # urlencode function
import urllib2  # urlopen function (better than urllib version)
import json
from pprint import pprint
import pylab as plt2
from pylab import *
from matplotlib.widgets import Slider, Button, RadioButtons
import matplotlib.ticker as ticker



class Data(object):
	"""Initiates a new class that filters given csv file into useable data."""
	def __init__(self, filename):
		#defines the main attributes of the Data object - filename and age_range
		self.filename = filename  
		self.age_range = '30-44'
	
	def get_numpy_array(self):                                                                                                                                             
		"""Returns a numpy array built from the csv file."""                                                                                                                           
		data = []      
		csv_file = self.filename
		#opens csvfile and adds each line to a row in a numpy array                                                                                                                                                         
		f = open(csv_file, "rU")                                                                                                                                                     
		for row in csv.reader(f):                                                                                                                                              
			data.append(row)                                                                                                                                                    
		length = len(sorted(data,key=len, reverse=True)[0])
		return np.array([x+[]*(length-len(x)) for x in data])  #returns a numpy array

	def fix_data(self):
		"""Removes any N/A elements and sets them to 0 in a numpy array."""
		a = self.get_numpy_array()
		remove = ["N/A"]
		#loops through each element in the indicated numpy array and replaces any 'N/A' string with a 0
		for element in a:
			for index in range(len(element)):
				if element[index] in remove:
					element[index] = 0
		return a #returns a numpy array

	def get_sum_by_age(self):
		"""Takes in filtered numpy array and returns list of sums of each column in data according to age_range.
		>>> data = Data('food-world-cup-data.csv')
		>>> data.get_sum_by_age()
		[110, 431, 380, 421, 120, 557, 104, 389, 398, 370, 159, 269, 777, 932, 872, 135, 962, 246, 270, 1278, 109, 984, 1226, 278, 108, 408, 399, 500, 878, 452, 1130, 138, 1012, 937, 938, 350, 722, 406, 672, 735]"""
		data = self.fix_data()
		final = []
		fn = []
		#loops through the array on the columns that correspond to data regarding countries (not demographics)
		for n in range(3,43):
			column_country_sum = []
			column_country = data[1:,n]  #a column of data that corresponds to a specific country
			for index in range(1,len(column_country)):
				if data[index, 44] == self.age_range:  #checks to see if the demographics of the row in
					try:								#question matches the specified age_range
						column_country_sum.append(int(data[index,n]))  #if it does match, it appends the number to a new list
					except:
						pass
			final.append(sum(column_country_sum))  #sums each filtered list of country data and adds it to final list
		return final  #returns a list


	def get_country_rank_age(self):
		"""Zips a list of countries with its corresponding list of rankings to generate a dictionary of data
		>>> data = Data('food-world-cup-data.csv')
		>>> data.get_country_rank_age()
		{'Brazil': 557, 'Turkey': 350, 'Italy': 1278, 'Ireland': 735, 'Switz': 452, 'Costa Rica': 370, 'France': 932, 'Ethiopia': 406, 'Ivory Coast': 109, 'Argentina': 431, 'Cameroon': 104, 'Nigeria': 108, 'Ecuador': 269, 'Ghana': 135, 'Iran': 270, 'BIH': 120, 'Cuba': 722, 'Germany': 872, 'NLD': 278, 'Chile': 389, 'Belgium': 421, 'China': 1012, 'Spain': 878, 'AUS': 380, 'Vietnam': 672, 'Croatia': 159, 'Thailand': 938, 'Honduras': 246, 'Russia': 399, 'England': 777, 'Algeria': 110, 'Portugal': 408, 'Mexico': 1226, 'Uruguay': 138, 'India': 937, 'US': 1130, 'Colombia': 398, 'Greece': 962, 'Japan': 984, 'South Korea': 500}"""
		countries = ['Algeria','Argentina','AUS','Belgium','BIH','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','NLD','Nigeria','Portugal','Russia','South Korea','Spain','Switz','US','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland']
		country_sum = self.get_sum_by_age()
		country_rank = dict(zip(countries,country_sum))  #generates a dictionary
		return country_rank  #returns a dictionary

class Plot(object):
	"""Initiates a class that plots the data from the previous Data class"""
	def __init__(self, filename):
		self.data = Data(filename)
		self.fig = plt.figure('Title', facecolor = '#0bb7c6', figsize = (10,10))
		self.ax = self.fig.add_subplot(111)

	def make_barplot(self):
		"""Generates a barplot according to the dictionary passed in."""
		self.ax.clear()
		plt.sca(self.ax)  #sets current axis
		D = data.get_country_rank_age()
		for country in D:
			plt.bar(range(len(D)), D.values(), color = '#055d66', edgecolor = '#ffffff') #plots bar graph of data
		plt.xticks(range(len(D)),D.keys(),rotation = 'vertical')
		plt.ylabel('Sum of Rankings', color = '#2b3233', fontsize=13)
		plt.title('Popularity of Ethnic Foods', color='#2b3233',fontsize=15)
		self.make_button() #initalizes buttions
		plt.draw()
		plt.show()

	def make_button(self):
	    """Creates buttons that are shown on the barplot.  Also indicates the function that gets called when 
	    buttons are clicked."""
	    # Make '18-29' button
	    young_button_ax = plt.axes([0.8, 0.92, 0.17, 0.07])
	    button_young = Button(young_button_ax, '18-29')
	    button_young.on_clicked(self.click_18_29_button)
	    young_button_ax._button = button_young

	    # Make '30-44' button
	    middle_button_ax = plt.axes([0.8, 0.85, 0.17, 0.07])
	    button_middle = Button(middle_button_ax, '30-44')
	    button_middle.on_clicked(self.click_30_44_button)
	    middle_button_ax._button = button_middle

	    # Make '45-60' button
	    old_button_ax = plt.axes([0.8, 0.78, 0.17, 0.07])
	    button_old = Button(old_button_ax, '45-60')
	    button_old.on_clicked(self.click_45_60_button)
	    old_button_ax._button = button_old

	    # Make '> 60' button
	    oldest_button_ax = plt.axes([0.8, 0.71, 0.17, 0.07])
	    button_oldest = Button(oldest_button_ax, '> 60')
	    button_oldest.on_clicked(self.click_60_button)
	    oldest_button_ax._button = button_oldest

	def click_18_29_button(self, event):
		"""Generates new bar plot based on specified age range"""
		data.age_range = '18-29'
		self.make_barplot()

	def click_30_44_button(self, event):
		"""Generates new bar plot based on specified age range"""
		data.age_range = '30-44'
		self.make_barplot()

	def click_45_60_button(self, event):		
		"""Generates new bar plot based on specified age range"""
		data.age_range = '45-60'
		self.make_barplot()

	def click_60_button(self, event):		
		"""Generates new bar plot based on specified age range"""
		data.age_range = '> 60'
		self.make_barplot()

if __name__ == '__main__':
    import doctest
    doctest.testmod()


data = Data('food-world-cup-data.csv')
#plot = Plot(data)
#plot.make_barplot()
