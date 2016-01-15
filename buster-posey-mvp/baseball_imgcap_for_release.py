from PIL import ImageFile
from PIL import ImageGrab
from PIL import *
import time
import sys
import glob
import math
import os
import gc
from multiprocessing import Process
import win32ui
import win32gui
import win32con

def piccap(i, w=300, h=300):
    hwnd = win32gui.GetDesktopWindow()
    wDC = win32gui.GetWindowDC(hwnd)
    dcObj = win32ui.CreateDCFromHandle(wDC)
    cDC = dcObj.CreateCompatibleDC()
    dataBitMap = win32ui.CreateBitmap()
    dataBitMap.CreateCompatibleBitmap(dcObj, w, h)
    cDC.SelectObject(dataBitMap)
    cDC.BitBlt((0, 0), (w, h), dcObj, (800, 300), win32con.SRCCOPY)
    dataBitMap.SaveBitmapFile(cDC, "./" + str(i) + "img.png")
    win32gui.DeleteObject(dataBitMap.GetHandle())
    dcObj.DeleteDC()
    cDC.DeleteDC()
    win32gui.ReleaseDC(hwnd, wDC)
    gc.collect()

def piccapCom2(cut):
    i = 0
    for i in range(0, cut):
        ti = time.clock()
        piccap(i)
        while time.clock() < (ti + .05):
                pass

'''first, capture all the screens'''
'''movies needs to play simultaneously'''
piccapCom2(int(sys.argv[1]))
