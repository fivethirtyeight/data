from numpy import array
from scipy.cluster.vq import vq, kmeans, whiten
import math

# TK: Load data from file as array and assign to bobross
 
# Normalizes according to st.dev.                
whitened = whiten(bobross)
output = kmeans(whitened,10)
print output

# Determines distance between each of 403 vectors and each centroid, and finds closest neighbor
for i in range(0,403):
	print i+1 
	# Dist between centroid 0 and vector
	distance = math.sqrt(sum((whitened[i] - output[0][0]) ** 2)) 
	# Group is the centroid it is closest to so far, set initally to centroid 0
	group = 0
	# Combo combines distance and group into a single entity
	combo = (distance, group)
	# Tests the vector i against the 10 centroids, finds nearest neighbor:
	for x in range (0,10):
		distance_temp = math.sqrt(sum((whitened[i] - output[0][x]) ** 2))
		if distance_temp < combo[0]:
			combo = (distance_temp,x)
	print combo	
