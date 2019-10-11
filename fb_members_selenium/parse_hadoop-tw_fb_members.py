# -*- coding: utf-8 -*-
import codecs
from bs4 import BeautifulSoup

soup = BeautifulSoup(codecs.open("hadoop-tw.html","r","utf-8").read(),"lxml")
f = open("hadoop-tw.csv","w+")
# class="uiProfileBlockContent _61ce"
for block in soup.select("._61ce"):        
    ID=block.select("a")
    ADDBY=block.select("._60rj")
    if ID:
        out1 = ID[0].get("ajaxify")
    if ADDBY:
        out2 = ADDBY[0].text.rstrip().lstrip().encode('utf-8')

    if out1 is not None:
        print >>f, out1 + ";" + out2
