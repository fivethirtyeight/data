"""This program will determine the most popular ethnic food based on demographics."""

import csv

def manage_data(filename):	
	empty = []
	with open(filename,"rU") as csvfile:
		spamreader = csv.reader(csvfile,  quotechar = '|')
		for row in spamreader:
			lines = ', '.join(row)
			lines = lines.split(",")
			empty.append(lines)
		return empty

def make_dictionary(filename):
	d = {}
	data = manage_data(filename)
	for line in data:
		if "N/A" in line:
			print "this"
	d[line[0]] = line[1:]
	print d

#compile the rankings per country excluding n/a
#sum the ith element of evert list to retrive country rank
def rank_country(filename):
	d = make_dictionary(filename)
	countries = ['Algeria','Argentina','Australia','Belgium','Bosnia and Herzegovia','Brazil','Cameroon','Chile','Colombia','Costa Rica','Croatia','Ecuador','England','France','Germany','Ghana','Greece','Honduras','Iran','Italy','Ivory Coast','Japan','Mexico','Netherlands','Nigeria','Portugal','Russia','South Korea','Spain','Switzerland','United States','Uruguay','China','India','Thailand','Turkey','Cuba','Ethiopia','Vietnam','Ireland']
	ranking = []
	for key in d:
		value = d.get(key)
		for index in range(3,42):
			print value




#manage_data("food-world-cup-data.csv")
#rank_country("food-world-cup-data.csv")
make_dictionary("food-world-cup-data.csv")
