#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import ast
import collections
import time
import numpy as np
import scipy.stats as stats
from scipy.stats import norm
import os.path


def parametric_circle(t,xc,yc,R):
    x = xc + R*np.cos(t)
    y = yc + R*np.sin(t)
    return x,y

def inv_parametric_circle(x,xc,R):
    t = np.arccos((x-xc)/R)
    return t

def circular(Min,Max,sigma,N):
    R = 1
    xc = 1
    yc = 0.0
    start_point = (xc + R*np.cos(0), yc + R*np.sin(0))
    end_point   = (xc + R*np.cos(np.pi), yc + R*np.sin(np.pi))
    
    
    start_t = inv_parametric_circle(start_point[0], xc, R)
    end_t   = inv_parametric_circle(end_point[0], xc, R)
    
    # step in angle
    arc_T = np.linspace(start_t, end_t, N)
    ys = []
    for i in range (len(arc_T)):
        ys.append((Max-sigma-(Min+sigma))*np.sin(arc_T[i])+Min+sigma +np.random.uniform(-sigma,sigma))          
    return ys

def uniform(Min,Max,sigma,N):
        np.random.seed(int(time.time()))
        ys = []
        for i in range(3):
                x = range(int(N/3))
                if i in [0,2]:         
                        y =  [Min+np.random.uniform(-sigma,sigma) for i in x]
                        ys.extend(y)
                if i == 1:
                        y =  [Max+np.random.uniform(-sigma,sigma) for i in x]
                        ys.extend(y)
        while not(len(ys) == N):
                ys.append(Max+np.random.uniform(-sigma,sigma))
        return ys


def arg_as_list(s):
        s = str(s)
        v = ast.literal_eval(s)
#        print (v)
        if type(v) is not list:
            raise argparse.ArgumentTypeError("Argument \"%s\" is not a list" % (s))
#        for i in (sum(v, [])):
#            if not isinstance(i,(int,float)):
#                raise argparse.ArgumentTypeError("The list should not cointain any literal! "% (s))
        return v
class MsgCreator(object):
         
    ids = []
    def parser(self):
        parser = argparse.ArgumentParser('Msg Creator')
#        parser.add_argument('-id', action="store", dest="id", type=int, nargs="+", help="Mote id")
        parser.add_argument('-n', action="store", dest="id", type=int, nargs="+", help="Num. of Motes.")
        parser.add_argument('-l', action="store", dest="lsize", type=int, nargs="+", help="Num of messages per mote to generate.")
        parser.add_argument('-f', action="store", dest="freq", type=int, nargs="+", help="Freq. in Hz")
        parser.add_argument('-c', action="store", dest="loop", type=int, nargs="+", help="Loop cycles")
#        parser.add_argument('-s', action="store", dest="sensors", type=str, help="list of sensors [0- vref, 1- photo, 2- radiation, 3- temperature , 4- humidity]")
        parser.add_argument("-s",action="store", dest="sensors", type=arg_as_list, default=[], nargs="+", 
                            help='list of sensors: 0 vref 0..5V,\n 1 photo 0..3500 lux, 2 radiation 0..500 lux, 3 temperature 0..40 C , 4 humidity 0..100')
        parser.add_argument("-d",action="store", dest="dist", type=arg_as_list, default=[], nargs="+", help="nested list, foreach sensor a list [type, min, max, stdev]")
#        parser.print_help()

        if os.path.exists('MsgCreatorConf.txt') == True:
                try:
                        my_file = open('MsgCreatorConf.txt','r')
                        first_line = my_file.readline().rstrip()
                        #print(first_line)
                        arglist = first_line.split( )
                        #arglist.append(sys.argv[1])
                        #print(arglist)
                        #print (sys.argv[1])
                        #print(arglist)
                        res = parser.parse_args(arglist)
                        return res
                except IOError:
                        print("The file \"RGBMatrixConf.txt\" doesn't exist!")
        else:
                results = parser.parse_args()
                return results
           
    def testSensors(self, lista):
        for i in lista:
            if int(i) not in range(5):
                raise argparse.ArgumentTypeError("Sensor \"%s\" not in the list of sensors."%(i))
        return list(collections.OrderedDict.fromkeys(lista))
        
    
    def testDist(self, llista):
        if len(llista) != len(self.sensors):
            raise argparse.ArgumentTypeError("The number of dists = \"%s\" is diferent of the number of sensors = \"%s\"."%(len(llista),len(self.sensors)))
        for i in llista:
            if type(i) is not list:
                raise argparse.ArgumentTypeError("Argument \"%s\" in dist is not a list" % (i))
            if len(i)!=4:
                raise argparse.ArgumentTypeError("Dist neads 4 args: type,min,max,std \"%s\"" % (i))
            for k in i[1:]:
                if not isinstance(k,(int,float)):
                    raise argparse.ArgumentTypeError("Argument \"%s\" in dist is not an integer or float" % (k))
#            if (i[0]>i[1]):
#                raise argparse.ArgumentTypeError("min > max in dist \"%s\"" % (i))
    
    def idToidR(self, moteId):
        strHex = "0x%0.4X" % moteId
        strHex = strHex[2:]
        hexStr = strHex[:2] + ' ' + strHex[2:]
#        hexStr = str(hex(moteId)[2:]).upper()
#        hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#        if len(hexStr) < 2:
#                hexStr.insert(0,'00')
#        hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
        return hexStr
    
    # Read: https://www.advanticsys.com/wiki/index.php?title=TestCM5000
    def vrefTovrefR(self,vref):
        # 2.96V -> 4046
        # Voltage = value/4096 × Vref x 2, Vref = 1.5V
        
        lower = 0.0
        upper = 5.0
        
        if (vref<lower) :
            vref = lower
        if (vref > upper):
            vref = upper
        
        if 0 not in self.sensors:
            vref = 3
        if isinstance(vref,(int,float)):
            vrefR = int((vref/3)*4096)
            strHex = "0x%0.4X" % vrefR
            strHex = strHex[2:]
            hexStr = strHex[:2] + ' ' + strHex[2:]
#            vrefR = int((vref/3)*4096)
#            hexStr = str(hex(vrefR)[2:]).upper()
#            hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#            if len(hexStr) < 2:
#                hexStr.insert(0,'00')
#            hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
            
            return hexStr
            
    
    def photoTophotoR(self,photo):
        # 462.95 Lux -> 205
        # photo = round((photoR/4096.0*vref/2.0/10**5)*0.625*10**6*10**3,2)
        #   Vsensor = (ADCvalue/4096) × Vref , Vref=1.5V
        #      I = Vsensor / 100000
        #   S1087 lx = 0.625 × 10^6 × I × 1000
        
        lower = 0
        upper = 3500
        
        if (photo<lower) :
            photo = lower
        if (photo > upper):
            photo = upper
        
        if not 1 in self.sensors:
            return "00 00"
        else:
            if isinstance(photo,(int,float)):
                photoR = int(((photo/0.625/10**4)/1.5)*4096)
                strHex = "0x%0.4X" % photoR
                strHex = strHex[2:]
                hexStr = strHex[:2] + ' ' + strHex[2:]
#                intensity = photo/0.625/10**6/1000
#                vsensor = intensity*10**5
#                photoR = int((vsensor/1.5)*4096)
#                hexStr = str(hex(photoR)[2:]).upper()
#                hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#                if len(hexStr) < 2:
#                    hexStr.insert(0,'00')
#                hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
#                print ("Photo = ",photo, " ", hexStr)
                return hexStr
            
                
    def radiationToradiationR(self,radiation):
        # 70.85 Lux -> 255
        # rad = round((radR/4096.0*vref/2.0/10**5)*0.769*10**5*10**3,2)
        #   Vsensor = (ADCvalue/4096) × Vref , Vref=1.5V
        #   I = Vsensor / 100000
        #   S1087-01 lx = 0.769 × 10^5 × I × 1000
        
        lower = 0
        upper = 500
        
        if (radiation<lower) :
            radiation = lower
        if (radiation > upper):
            radiation = upper
        
        if not 2 in self.sensors:
            return "00 00"
        else:
            if isinstance(radiation,(int,float)):
                adcvalue = int((radiation/0.769/1000/1.5)*4096)
                strHex = "0x%0.4X" % adcvalue
                strHex = strHex[2:]
                hexStr = strHex[:2] + ' ' + strHex[2:]
#                intensity = radiation/0.769/10**5/1000
#                vsensor = intensity*10**5
#                radiationR = int((vsensor/1.5)*4096)
#                hexStr = str(hex(radiationR)[2:]).upper()
#                hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#                if len(hexStr) < 2:
#                    hexStr.insert(0,'00')
#                hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
                return hexStr
        
    def temperatureTotemperatureR(self,temperature):
        # 25.08 ºC -> 6468
        # T = -39.6 + 0.01 × SOT, 3V & 14 bit in Celsius
        
        lower = 0
        upper = 40
        
        if (temperature<lower) :
            temperature = lower
        if (temperature > upper):
            temperature = upper
        
        if 3 not in self.sensors:
            return "00 00"
        else:
            if isinstance(temperature,(int,float)):
                tempR = int((temperature + 39.6)/0.01)
                strHex = "0x%0.4X" % tempR
                strHex = strHex[2:]
                hexStr = strHex[:2] + ' ' + strHex[2:]
#                hexStr = str(hex(int((temperature + 39.6)/0.01))[2:]).upper()
#                hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#                if len(hexStr) < 2:
#                    hexStr.insert(0,'00')
#                hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
                return hexStr
        
    def humidityTohumidityR(self,humidity):
        # 34.5% -> 921
        # 100% -> 3081
        # 2,05% -> 0
        # humR = msg.humidity
        # humLinear = 2.0468 + (0.0367*humR) + (-1.5955 *(10**-6)*(humR**2)) #%
        # humTrue = round((temp - 25)*(0.01 + 0.00008* humR) + humLinear,2) #%
        
        lower = 0
        upper = 100
        
        if (humidity<lower) :
            humidity = lower
        if (humidity > upper):
            humidity = upper
        
        if 4 not in self.sensors:
            return "00 00"
        else:
            if isinstance(humidity,(int,float)):
                humR = int((humidity/(100-2.05))*3081)
                strHex = "0x%0.4X" % humR
                strHex = strHex[2:]
                hexStr = strHex[:2] + ' ' + strHex[2:]
                # humLinear = humidity
#                humR =int((humidity/(100-2.05))*3081)
#                hexStr = str(hex(int(humR))[2:]).upper()
#                hexStr = [hexStr[i:i+2] for i in range(0,len(hexStr),2)]
#                if len(hexStr) < 2:
#                    hexStr.insert(0,'00')
#                hexStr = ' '.join(str(i).zfill(2) for i in hexStr)
                return hexStr
  
    def __init__(self):
        self.res = self.parser()
        self.id = self.res.id[0]
        self.lsize = self.res.lsize[0]
        self.freq = self.res.freq[0]
        self.sensors = self.testSensors(self.res.sensors[0])
        self.testDist(self.res.dist[0])
        self.dist = self.res.dist[0]
        self.loop = self.res.loop[0]
   
    
    
def main():
    myMsgCreator = MsgCreator();
    
#    print (myMsgCreator.lsize)
#    print (myMsgCreator.freq)
#    print (myMsgCreator.sensors)
#    print (myMsgCreator.dist)
 
    
    hashmap = {}
    for i in range(len(myMsgCreator.sensors)):
#        mu, sigma = myMsgCreator.dist[i][0], myMsgCreator.dist[i][1]
#        lower, upper = 0, 0
#        # [0- vref [0..5 V], 1- photo, 2- radiation, 3- temperature , 4- humidity]
#        if myMsgCreator.sensors[i] == 0:
#            lower = 0
#            upper = 5
#        else:
#            if myMsgCreator.sensors[i] == 1:
#                lower = 0
#                upper = 3500
#            else:
#                if myMsgCreator.sensors[i] == 2:
#                    lower = 0
#                    upper = 500
#                else:
#                    if myMsgCreator.sensors[i] == 3:
#                        lower = 0
#                        upper = 40
#                    else:
#                        if myMsgCreator.sensors[i] == 4:
#                            lower = 0
#                            upper = 100
        if myMsgCreator.dist[i][0] == 'U':
                Min, Max, Sigma = myMsgCreator.dist[i][1], myMsgCreator.dist[i][2], myMsgCreator.dist[i][3]
                data = uniform(Min,Max,Sigma,myMsgCreator.lsize*myMsgCreator.id)
                #print (len(data)," ",myMsgCreator.lsize)
                hashmap[myMsgCreator.sensors[i]] = data
        if myMsgCreator.dist[i][0] == 'C':
                Min, Max, Sigma = myMsgCreator.dist[i][1], myMsgCreator.dist[i][2], myMsgCreator.dist[i][3]
                data = circular(Min,Max,Sigma,myMsgCreator.lsize*myMsgCreator.id)
                #print (len(data)," ",myMsgCreator.lsize)
                hashmap[myMsgCreator.sensors[i]] = data
        #hashmap[myMsgCreator.sensors[i]] = stats.truncnorm.rvs((lower-mu)/sigma,(upper-mu)/sigma,loc=mu,scale=sigma,size=myMsgCreator.lsize).tolist()
#        print (hashmap.keys())
#        print ("Sensor %s Min %s Max %s Mean %s Stdev %s"%(myMsgCreator.sensors[i],lower, upper, mu, sigma))
#        print(hashmap[myMsgCreator.sensors[i]])
#        print ()
    
    header1 = "7E 45 00 FF FF"
    header2 = "0A 3F 0C"
    

    np.random.seed(int(time.time()))
    #ids = np.random.randint(1,65534,size=myMsgCreator.id,dtype=np.uint16)
    ids = range(myMsgCreator.id+1)
    ids = ids[1:]
#    print (ids)
#    porra =""
#    for i in range(len(ids)):
#        porra += ' '+myMsgCreator.idToidR(ids[i])
#    print (porra)
    
    if (myMsgCreator.loop == 0):
        while 1:
            for i in range(myMsgCreator.lsize*myMsgCreator.id):
                str0=''
                str0 += header1
                #id
                str0 += ' '+myMsgCreator.idToidR(ids[i%myMsgCreator.id])
                str0+=' '+header2
                #vref
                if 0 not in myMsgCreator.sensors:
                    str0+=' 00 00'
                else:
                   str0 += ' '+myMsgCreator.vrefTovrefR(hashmap[0][i])
                #photo
                if 1 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.photoTophotoR(hashmap[1][i])
                #radiation
                if 2 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.radiationToradiationR(hashmap[2][i])
                #temperature
                if 3 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.temperatureTotemperatureR(hashmap[3][i])
                #humidity
                if 4 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.humidityTohumidityR(hashmap[4][i])
                str0 +=' '+myMsgCreator.idToidR(np.random.randint(1,65534,dtype=np.uint16)) #2 Bytes CRC
                str0 +=' '+"7E"
                print(str0)
                time.sleep(1.0/(myMsgCreator.freq*myMsgCreator.id))
    else:
        for c in range (myMsgCreator.loop):
            for i in range(myMsgCreator.lsize*myMsgCreator.id):
                str0=''
                str0 += header1
                #id
                str0 += ' '+myMsgCreator.idToidR(ids[i%myMsgCreator.id])
                str0+=' '+header2
                #vref
                if 0 not in myMsgCreator.sensors:
                    str0+=' 00 00'
                else:
                   str0 += ' '+myMsgCreator.vrefTovrefR(hashmap[0][i])
                #photo
                if 1 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.photoTophotoR(hashmap[1][i])
                #radiation
                if 2 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.radiationToradiationR(hashmap[2][i])
                #temperature
                if 3 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.temperatureTotemperatureR(hashmap[3][i])
                #humidity
                if 4 not in myMsgCreator.sensors:
                    str0 +=' 00 00'
                else:
                    str0 += ' '+myMsgCreator.humidityTohumidityR(hashmap[4][i])
                str0 +=' '+myMsgCreator.idToidR(np.random.randint(1,65534,dtype=np.uint16)) #2 Bytes CRC
                str0 +=' '+"7E"
                print(str0)
                time.sleep(1.0/(myMsgCreator.freq*myMsgCreator.id))  

                 
        
    
#    # int randomNum = min + (int)(Math.random() * (max - min));
#    # O desvio padrão populacional ou amostral é a raiz quadrada da variância 
#    mu, sigma = 1, 0.1 # mean and standard deviation
#    
#    lower, upper = 3.5, 6
#    mu, sigma = 5, 0.7
##    X = scipy.stats.truncnorm((lower - mu) / sigma, (upper - mu) / sigma, loc=mu, scale=sigma)
##    N = stats.norm(loc=mu, scale=sigma)
#    
#    s = stats.truncnorm.rvs((lower-mu)/sigma,(upper-mu)/sigma,loc=mu,scale=sigma,size=100).tolist()
#    print (s,"\n",min(s), max(s))


    

if __name__ == "__main__":
    main()

# ./MsgCreator.py -i 5 -s [1,2,3] -d [[1,0.1],[1,0.1],[1,0.1]] -n 10 -f 1
# ./MsgCreatorV2.py -n 5 -s [1,2,3] -d [[1,0.1],[1,0.1],[1,0.1]] -n 10 -f 1 -l 20
