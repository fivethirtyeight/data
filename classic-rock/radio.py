import time
import urllib2
import sys

"""
next step: make it create new file each time, run cleanup op
"""

def cc_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		offset = 0
		new_last_song = last_song
		page = response.read()
		while (counter < 20):
			offset = page.find('}},{"track":')
			song = page[page.find('":"')+3:page.find('","')]
			artist = page[page.find('artistName":"')+13:page.find('","amgArtistId"')]
			page = page[offset + 3:]
			song = song.replace("\/","/")		
			artist = artist.replace("\/","/")
			counter = counter + 1
			entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
			if (song == last_song):
				break
			elif (counter == 1):	
				new_last_song = song
				record.write(entry)
			else:
				record.write(entry)
		y = (x[0],iteration,x[2],new_last_song)
		time.sleep(3)
		record.close()
		return y
	except:
		time.sleep(3)
		return x


def gm_pull(x):
	try:	
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True
		new_last_song = last_song	
		while (counter < 10000):
			line = response.readline()
			if '" -' in line:
				song = line[line.find('"')+1:line.find(" -")-1]
				artist = line[line.find("- ")+1:]
				artist = artist.strip()
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"		
				record.write(entry)
				"""
				line = response.readline()
				line = response.readline()
				line = response.readline()
				line = response.readline()
				if "Visit iTunes" in line:
					itunes_link = line[line.find('href="')+5:line.find('" target="')]
					TO DO: CREATE FILE
					WRITE ITUNES LINKS TO IT
					THEN, LATER, GRAB ALBUM RELEASE YEARS
				"""
			counter = counter + 1
		y = (x[0],iteration,x[2],new_last_song)
		record.close()	
		time.sleep(3)
		return y		
	except:
		time.sleep(3)
		return x

def cx_pull(x):
	try:	
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True	
		new_last_song = last_song
		while (counter < 10000):
			line = response.readline()
			if 'cmPlaylistContent' in line:
				song = line[line.find('/">')+3:line.find("</a></strong>")]
				artist = line[line.find("alt=")+5:line.find('" class="')]
				artist = artist.strip()
				song = song.replace("&#39;","'")		
				artist = artist.replace("&#39;","'")			
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
				if (song == last_song):
					break
				elif first:	
					new_last_song = song
					record.write(entry)
					first = False
				else:
					record.write(entry)
				"""	
				if "Download Song:" in line:
					line = response.readline()
					line = response.readline()
					if "apple" in line:
						itunes_link = line[line.find('href="')+5:line.find('">iTu')			
						TO DO: CREATE FILE
						WRITE ITUNES LINKS TO IT
						THEN, LATER, GRAB ALBUM RELEASE YEARS
				"""		
			counter = counter + 1
		y = (x[0],iteration,x[2],new_last_song)
		record.close()	
		time.sleep(3)
		return y
	except:
		time.sleep(3)
		return x	

def cb_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True	
		new_last_song = last_song	
		while (counter < 10000):
			line = response.readline()
			if '<div class="track_title"' in line:
				song = line[line.find('rel=')+5:line.find('">')]
				line = response.readline()
				line = response.readline()
				artist = line[line.find('rel=')+5:line.find('">')]
				line = response.readline()
				line = response.readline()
				album = line[line.find('rel=')+5:line.find('">')]
				song = song.replace("&#039;","'")		
				artist = artist.replace("&#039;","'")
				album = album.replace("&#039;","'")						
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
				record.write(entry)
			counter = counter + 1	
		y = (x[0],iteration,x[2],new_last_song)
		time.sleep(3)
		record.close()	
		return y	
	except:
		time.sleep(3)
		return x
	

def tg_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True
		new_last_song = last_song		
		while (counter < 10000):
			line = response.readline()
			if '<div class="song"><' in line:
				counter = counter + 1
			elif '<div class="song">' in line:
				song = line[line.find('"song">')+7:line.find('</div>')]
				song = song.replace("&#39;","'")
				line = response.readline()
				artist = line[line.find('<div>')+5:line.find(' <span')]
				song = song.replace("&#39;","'")		
				artist = artist.replace("&#39;","'")
				song = song.replace("&amp;","&")		
				artist = artist.replace("&amp;","&")			
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
				if (song == last_song):
					break
				elif first:	
					new_last_song = song
					record.write(entry)
					first = False
				else:
					record.write(entry)
			counter = counter + 1	
		y = (x[0],iteration,x[2],new_last_song)
		time.sleep(3)
		record.close()	
		return y		
	except:
		time.sleep(3)
		return x

def ll_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		new_last_song = last_song	
		while (counter < 10000):
			line = response.readline()
			if 'var songs = ' in line:
				tencount = 0
				while (tencount < 10):
					song = line[line.find('"title":"')+9:line.find('","')]
					line = line[line.find('"artist":')+10:]
					artist = line[:line.find('"')]
					line = line[line.find('},{"timestamp":'):]
					entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
					new_last_song = song
					record.write(entry)	
					tencount = tencount + 1					
				break	
			counter = counter + 1	
		y = (x[0],iteration,x[2],new_last_song)
		time.sleep(3)
		record.close()	
		return y
	except:
		time.sleep(3)
		return x


def kx_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True	
		new_last_song = last_song
		while (counter < 10000):
			line = response.readline()
			if 'play-song' in line:
				song = line[line.find('>')+1:line.find("</")]
				line = response.readline()
				artist = line[line.find('by ')+3:line.find('</')]
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
				if (song == last_song):
					break
				elif first:	
					new_last_song = song
					record.write(entry)
					first = False
				else:
					record.write(entry)
			counter = counter + 1	
		y = (x[0],iteration,x[2],new_last_song)
		time.sleep(3)
		record.close()	
		return y	
	except:
		time.sleep(3)
		return x

def ke_pull(x):
	try:
		iteration = x[1] + 1
		url = x[0]
		callsign = x[2]
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		record = open(filename,"w")	
		last_song = x[3]
		response = urllib2.urlopen(url)
		counter = 0 
		first = True
		new_last_song = last_song		
		while (counter < 10000):
			line = response.readline()
			if 'views-field-field-title' in line:
				song = line[line.find('field-content">')+15:line.find("</div>")]
				line = response.readline()
				artist = line[line.find('<span>')+6:line.find('</span>')]
				song = song.replace("&#039;","'")		
				artist = artist.replace("&#039;","'")
				entry = song + "|" + artist + "|" + callsign + "|" + str(time.time()) + "\n"
				if (song == last_song):
					break
				elif first:	
					new_last_song = song
					record.write(entry)
					first = False
				else:
					record.write(entry)
			counter = counter + 1
		y = (x[0],iteration,x[2],new_last_song)
		record.close()	
		time.sleep(3)
		return y	
	except:
		time.sleep(3)
		return x





cc1 = ("http://www.q1043.com/services/now_playing.html?streamId=1465&limit=25",0,"WAXQ","")
cc2 = ("http://www.lonestar925.com/services/now_playing.html?streamId=3379&limit=25",0,"KZPS","")
cc3 = ("http://www.wbig.com/services/now_playing.html?streamId=2505&limit=25",0,"WBIG","")
cc4 = ("http://www.big1059.com/services/now_playing.html?streamId=557&limit=25",0,"WBGG","")
cc5 = ("http://www.thefox.com/services/now_playing.html?streamId=393&limit=25",0,"KRFX","")
cc6 = ("http://www.dve.com/services/now_playing.html?streamId=2017&limit=25",0,"WDVE","")
cc7 = ("http://www.wrfx.com/services/now_playing.html?streamId=1613&limit=25",0,"WRFX","")
cc8 = ("http://www.kzep.com/services/now_playing.html?streamId=4051&limit=25",0,"KZEP","")
cc9 = ("http://www.101kgb.com/services/now_playing.html?streamId=237&limit=25",0,"KGB","")
gm1 = ("http://www.wcsx.com/recentlyplayed.aspx",0,"WCSX","")
gm2 = ("http://www.wmgk.com/broadcasthistory.aspx",0,"WMGK","")
cx1 = ("http://www.1073theeagle.com/lsp/",0,"WXGL","")
cx2 = ("http://www.houstonseagle.com/lsp/",0,"KGLK","")
cx3 = ("http://www.971theriver.com/lsp/",0,"WSRV","")
cb1 = ("http://wzlx.cbslocal.com/playlist/",0,"WZLX","")
cb2 = ("http://wncx.cbslocal.com/playlist/",0,"WNCX","")
cb3 = ("http://kzok.cbslocal.com/playlist/",0,"KZOK","")
tg1 = ("http://wlup.tunegenie.com/onair/",0,"WLUP","")
tg2 = ("http://wofx.tunegenie.com/onair/",0,"WOFX","")
tg3 = ("http://kgon.tunegenie.com/onair/",0,"KGON","")
tg4 = ("http://kcfx.tunegenie.com/onair/",0,"KCFX","")
tg5 = ("http://klos.tunegenie.com/onair/",0,"KLOS","")
tg6 = ("http://kseg.tunegenie.com/onair/",0,"KSEG","")
tg7 = ("http://kufx.tunegenie.com/onair/",0,"KUFX","")
ll1 = ("http://player.listenlive.co/24751/en/songhistory",0,"KQRS","")
ll2 = ("http://player.listenlive.co/25951/en/songhistory",0,"KSAN","")
ke1 = ("http://www.kshe95.com/broadcasthistory",0,"KSHE","")
kx1 = ("http://kslx.com/playlist",0,"KSLX","")


while True:
	now = time.time()
	timer = time.localtime(now)
	#on the hour
	if (timer[4] == 58):
		cc1 = cc_pull(cc1)
		cc2 = cc_pull(cc2)
		cc3 = cc_pull(cc3)
		cc4 = cc_pull(cc4)
		cc5 = cc_pull(cc5)
		cc6 = cc_pull(cc6)
		cc7 = cc_pull(cc7)
		cc8 = cc_pull(cc8)
		cc9 = cc_pull(cc9)
		cx1 = cx_pull(cx1)
		cx2 = cx_pull(cx2)
		cx3 = cx_pull(cx3)
		tg1 = tg_pull(tg1)
		tg2 = tg_pull(tg2)
		tg3 = tg_pull(tg3)
		tg4 = tg_pull(tg4)
		tg5 = tg_pull(tg5)
		tg6 = tg_pull(tg6)
		tg7 = tg_pull(tg7)
		ll1 = ll_pull(ll1)
		ll2 = ll_pull(ll2)
		ke1 = ke_pull(ke1)
		kx1 = kx_pull(kx1)
		time.sleep(30)	
	elif (timer[4] == 28):
		cx1 = cx_pull(cx1)
		cx2 = cx_pull(cx2)
		cx3 = cx_pull(cx3)
		ll1 = ll_pull(ll1)
		ll2 = ll_pull(ll2)
		kx1 = kx_pull(kx1)
		time.sleep(30)	
	elif (timer[4] == 54 and timer[3] == 23):
		gm1 = gm_pull(gm1)
		gm2 = gm_pull(gm2)
		cb1 = cb_pull(cb1)
		cb2 = cb_pull(cb2)
		cb3 = cb_pull(cb3)
		time.sleep(30)		
	time.sleep(30)





