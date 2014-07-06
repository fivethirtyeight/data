def hr_pull(x,y):
	iteration = 0
	callsign = x[2]
	new_filename = callsign + ".txt"
	songlist = ""
	while (iteration < y):
		iteration = iteration + 1
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		readfile = open(filename,"r")
		newchunk = readfile.read()
		songlist = newchunk + "\n" + songlist
		readfile.close()
	writefile = open(new_filename,"w")
	writefile.write(songlist)
	writefile.close()
		
def hh_pull(x,y):
	iteration = 0
	callsign = x[2]
	new_filename = callsign + ".txt"
	songlist = ""
	while (iteration < y):
		iteration = iteration + 1
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		readfile = open(filename,"r")
		newchunk = readfile.read()
		songlist = newchunk + "\n" + songlist
		readfile.close()
	writefile = open(new_filename,"w")
	writefile.write(songlist)
	writefile.close()	

def dy_pull(x,y):
	iteration = 0
	callsign = x[2]	
	new_filename = callsign + ".txt"
	songlist = ""
	while (iteration < y):
		iteration = iteration + 1
		filename = callsign + str(iteration).rjust(3,'0') + ".txt"
		readfile = open(filename,"r")
		newchunk = readfile.read()
		songlist = newchunk + "\n" + songlist
		readfile.close()
	writefile = open(new_filename,"w")
	writefile.write(songlist)
	writefile.close()
	
	
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

hr_pull(cc1,121)
hr_pull(cc2,121)
hr_pull(cc3,121)
hr_pull(cc4,121)
hr_pull(cc5,121)
hr_pull(cc6,121)
hr_pull(cc7,121)
hr_pull(cc8,121)
hr_pull(cc9,121)
hr_pull(tg1,121)
hr_pull(tg2,121)
hr_pull(tg3,121)
hr_pull(tg4,121)
hr_pull(tg5,121)
hr_pull(tg6,121)
hr_pull(tg7,121)
hr_pull(ke1,121)
hh_pull(cx1,241)
hh_pull(cx2,241)
hh_pull(cx3,241)
hh_pull(ll1,241)
hh_pull(ll2,241)
hh_pull(kx1,241)
dy_pull(gm1,6)
dy_pull(gm2,6)
dy_pull(cb1,6)
dy_pull(cb2,6)
dy_pull(cb3,6)
	
	
print "Done"
	