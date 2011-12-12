#!/usr/bin/python
# -*- coding: utf-8 -*-

import csv

regs = []
locs = []
endlocs = []
endregs = []

def parents (data):
    for i in data:
        if i[0][-9] == '0' and i[0][-3:] == '000' and i[1] == '1':					regs.append(i)
        if i[0][-9] == '0' and i[0][-3:] != '000':							locs.append(i)
        if i[0][-9] == '1' and i[0][-6:-3] == '000' and not i[3] and i[2][-1] != '/':			locs.append(i)
        if i[0][-9] == '2' and i[0][-6:-3] == '000' and i[0][-3:] != '000':				locs.append(i)
        if i[0][-9] == '4' and i[0][-6:-3] == '000' and i[0][-8:-6] != '00' and i[2][-1] != '/':	locs.append(i)
        if i[0][-9] == '5' and i[0][-6:-3] == '000' and i[0][-8:-6] != '00' and i[2][-1] != '/':	locs.append(i)
        if i[0][-6] == '3' and i[0][-2:] != '00':							locs.append(i)
        if i[0][-6] == '5' and i[2][-1] != '/':#exclude Moskows and St.Piterburgs districts
            if i[0][-11:-9] != '40' and i[0][-11:-9] != '45':						locs.append(i)
        if i[0][-6] == '6' and i[2][-1] != '/':								locs.append(i)
        if i[0][-6] == '8' and i[0][-3:] != '000':							locs.append(i)
        if i[0][-6] == '9' and i[0][-3:] != '000':							locs.append(i)
    nregion = 1
    for r in regs:
        endregs.append([ nregion, r[0], r[1], r[2], r[3] ])
        for l in locs:
            if r[0][-11:-9] == l[0][-11:-9]: endlocs.append([ l[0], l[1], l[2], l[3], nregion ])
        nregion += 1

    csv.writer(open('locs.csv', 'w'), dialect='excel').writerows(endlocs)
    csv.writer(open('regs.csv', 'w'), dialect='excel').writerows(endregs)

    #Difference between okato and locations
    #for i in data:
    #    if i not in locs: print i[0], i[1], i[2]

csv_data = "./okato.fns.csv"

cdata =  [i for i in csv.reader(open(csv_data))]

parents (cdata)

