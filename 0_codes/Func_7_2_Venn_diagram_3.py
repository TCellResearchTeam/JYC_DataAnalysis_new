#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 18 00:00:34 2017

@author: yolandatiao
"""

#####------------------ Import START ------------------#####
import os # For changing directory
import subprocess # For calling bash 
from astropy.io import ascii # For using ascii table to open csv
from astropy.table import Table, Column, join   # For using astropy table functions
import seaborn as sns # For plotting
import matplotlib.pyplot as plt # For plotting
import pandas as pd # For using pandas in seaborn plot
import numpy as np # For using numpy matrix
from matplotlib_venn import venn3, venn3_circles, venn2
import Tkinter,tkFileDialog
import math
import matplotlib.pyplot as plt
#####------------------ Import END ------------------#####



#####------------------ Config START ------------------#####
code_dir="/Volumes/Huitian/Exp122_169_GSE88987/codes"
#####------------------ Config END ------------------#####



#####------------------ Self Defined functions START ------------------#####
os.chdir(code_dir)
import fc_basic_astropy_subprocess as fc

# A function to call bash commands
def run_sh(command):                                     
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    retcode = process.wait()
    if retcode != 0:
        raise Exception, "Problem running command: " + command
    stdout, stderr = process.communicate()
    return stdout

#####------------------ Self Defined functions END ------------------######


#####------------------ Main START ------------------######
def Venn3_gui():
    #--- Open input files
    root = Tkinter.Tk()
    root.withdraw()
    root.update()
    print 'Please choose 3 files for making venn diagram: '
    in_filenames = list(tkFileDialog.askopenfilenames(parent=root,title='Choose a file'))
    in_filenames_len = len(in_filenames) #Get number of opened files
    #--- Check numbers and names of files
    print "You are opening %d files: " % (in_filenames_len) 
    for x in xrange (0, in_filenames_len):
    	print in_filenames[x].split('/')[-1] #Get rid of directory
    print '\n'
    
    #--- Name files
    print 'Please name the data from the 3 files, seperate by comma: '
    for x in xrange(0, in_filenames_len):
        print fc.filenamenoformat(fc.Getfilename(in_filenames[x]))
    plot_names=raw_input()
    plot_nameslist=plot_names.split(",")
    
    #--- Getting data lists from files
    data_1=ascii.read(in_filenames[0])
    data_2=ascii.read(in_filenames[1])
    data_3=ascii.read(in_filenames[2])
    
    data_1=fc.setcolnames(data_1)
    data_2=fc.setcolnames(data_2)
    data_3=fc.setcolnames(data_3)
    
    set_1=set(list(data_1.columns[0]))
    set_2=set(list(data_2.columns[0]))
    set_3=set(list(data_3.columns[0]))
    
    
    venn3([set_1,set_2,set_3],(plot_nameslist[0],plot_nameslist[1],plot_nameslist[2]))
    


#####------------------ Main END ------------------######































