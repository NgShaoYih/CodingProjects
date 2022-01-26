# -*- coding: utf-8 -*-
"""
The Game of Life (GoL) module named in honour of John Conway

This module defines the classes required for the GoL simulation.

Created on Tue Jan 15 12:21:17 2019

@author: shakes
"""
import numpy as np
from scipy import signal

class GameOfLife:
    '''
    Object for computing Conway's Game of Life (GoL) cellular machine/automata
    '''
    def __init__(self, N=256, finite=False, fastMode=False):
        self.grid = np.zeros((N,N), np.uint)
        self.neighborhood = np.ones((3,3), np.uint) # 8 connected kernel
        self.neighborhood[1,1] = 0 #do not count centre pixel
        self.finite = finite
        self.fastMode = fastMode
        self.aliveValue = 1
        self.deadValue = 0
        self.rows = N
        self.cols = N
        self.convolutionMatrix = np.ones((3,3), np.uint8) #get the 3x3 matrix
        self.convolutionMatrix[1,1] = 0 #dont count the middle cell
        
    def getStates(self):
        '''
        Returns the current states of the cells
        '''
        return self.grid
    
    def getGrid(self):
        '''
        Same as getStates()
        '''
        return self.getStates()
               
    def evolve(self):
        '''
        Given the current states of the cells, apply the GoL rules:
        - Any live cell with fewer than two live neighbors dies, as if by underpopulation.
        - Any live cell with two or three live neighbors lives on to the next generation.
        - Any live cell with more than three live neighbors dies, as if by overpopulation.
        - Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction
        '''
        dead = self.deadValue
        alive = self.aliveValue
        #get weighted sum of neighbors
        #PART A & E CODE HERE
        weight = signal.convolve2d(self.grid, self.convolutionMatrix, mode='same', boundary='wrap', fillvalue=0)
        
        #implement the GoL rules by thresholding the weights
        #PART A CODE HERE
        updateGrid = np.zeros((self.rows, self.cols), np.uint8)
        
        #i is row, j is column
        for i in range(self.rows-1):
            for j in range(self.cols-1):
                current = self.grid.item(i,j)
                neighborCheck = weight.item(i,j)
                #neighborCheck = self.neighborhoodWeight(i,j)
                if current == alive and neighborCheck < 2:
                    updateGrid[i,j] = dead
                elif current == alive and (neighborCheck == 2 or 
                                                neighborCheck == 3):
                    updateGrid[i,j] = alive
                elif current == alive and neighborCheck > 3:
                    updateGrid[i,j] = dead
                elif current == dead and neighborCheck == 3:
                    updateGrid[i,j] = alive
                else:
                    continue
                neighborCheck = 0
        
        #update the grid
        self.grid = updateGrid #UNCOMMENT THIS WITH YOUR UPDATED GRID
    
    
    def neighborhoodWeight(self, i, j):
        #check for amount of 1's in surrounding area
        #i,j are coordinates for current location
        ones = 0
        rows = i-1
        endRows = i+2
        cols = j-1
        endCols = j+2
        
        for a in range (rows,endRows):
            for b in range (cols,endCols):
                if a == i and b == j:
                    continue
                else:
                    check = self.grid.item(a,b)
                    if check == 1:
                        ones += 1
        return ones
    
    def insertBlinker(self, index=(0,0)):
        '''
        Insert a blinker oscillator construct at the index position
        '''
        self.grid[index[0], index[1]+1] = self.aliveValue
        self.grid[index[0]+1, index[1]+1] = self.aliveValue
        self.grid[index[0]+2, index[1]+1] = self.aliveValue
        
    def insertGlider(self, index=(0,0)):
        '''
        Insert a glider construct at the index position
        '''
        self.grid[index[0], index[1]+1] = self.aliveValue
        self.grid[index[0]+1, index[1]+2] = self.aliveValue
        self.grid[index[0]+2, index[1]] = self.aliveValue
        self.grid[index[0]+2, index[1]+1] = self.aliveValue
        self.grid[index[0]+2, index[1]+2] = self.aliveValue
        
    def insertGliderGun(self, index=(0,0)):
        '''
        Insert a glider construct at the index position
        '''
        self.grid[index[0]+1, index[1]+25] = self.aliveValue
        
        self.grid[index[0]+2, index[1]+23] = self.aliveValue
        self.grid[index[0]+2, index[1]+25] = self.aliveValue
        
        self.grid[index[0]+3, index[1]+13] = self.aliveValue
        self.grid[index[0]+3, index[1]+14] = self.aliveValue
        self.grid[index[0]+3, index[1]+21] = self.aliveValue
        self.grid[index[0]+3, index[1]+22] = self.aliveValue
        self.grid[index[0]+3, index[1]+35] = self.aliveValue
        self.grid[index[0]+3, index[1]+36] = self.aliveValue
        
        self.grid[index[0]+4, index[1]+12] = self.aliveValue
        self.grid[index[0]+4, index[1]+16] = self.aliveValue
        self.grid[index[0]+4, index[1]+21] = self.aliveValue
        self.grid[index[0]+4, index[1]+22] = self.aliveValue
        self.grid[index[0]+4, index[1]+35] = self.aliveValue
        self.grid[index[0]+4, index[1]+36] = self.aliveValue
        
        self.grid[index[0]+5, index[1]+1] = self.aliveValue
        self.grid[index[0]+5, index[1]+2] = self.aliveValue
        self.grid[index[0]+5, index[1]+11] = self.aliveValue
        self.grid[index[0]+5, index[1]+17] = self.aliveValue
        self.grid[index[0]+5, index[1]+21] = self.aliveValue
        self.grid[index[0]+5, index[1]+22] = self.aliveValue
        
        self.grid[index[0]+6, index[1]+1] = self.aliveValue
        self.grid[index[0]+6, index[1]+2] = self.aliveValue
        self.grid[index[0]+6, index[1]+11] = self.aliveValue
        self.grid[index[0]+6, index[1]+15] = self.aliveValue
        self.grid[index[0]+6, index[1]+17] = self.aliveValue
        self.grid[index[0]+6, index[1]+18] = self.aliveValue
        self.grid[index[0]+6, index[1]+23] = self.aliveValue
        self.grid[index[0]+6, index[1]+25] = self.aliveValue
        
        self.grid[index[0]+7, index[1]+11] = self.aliveValue
        self.grid[index[0]+7, index[1]+17] = self.aliveValue
        self.grid[index[0]+7, index[1]+25] = self.aliveValue
        
        self.grid[index[0]+8, index[1]+12] = self.aliveValue
        self.grid[index[0]+8, index[1]+16] = self.aliveValue
        
        self.grid[index[0]+9, index[1]+13] = self.aliveValue
        self.grid[index[0]+9, index[1]+14] = self.aliveValue

    def openFile(self, filename, index=(0,0)):
        rle = open(filename, 'r')
        mainLine = rle.read()
        lines = mainLine.split('\n')
        value = ''
        number = '0123456789'
        placeholdNum = ''
        endArray = []
        #start at the line after'#'
        past = 1
        for x in lines:
            if x.startswith('#'):
                past += 1
                
        for a in range(past, len(lines)):
                value += lines[a]
                
        #o = alive, b = dead, ends with number = space, ! = end        
        
        for a in value:
            if a in number:
                placeholdNum += a
            
            elif a == 'b':
                if placeholdNum != '':
                    times = int(placeholdNum)
                    while times != 0:
                        endArray.append(a)
                        times -= 1
                else:
                    endArray.append(a)
                placeholdNum = ''
            elif a == 'o':
                if placeholdNum != '':
                    times = int(placeholdNum)
                    while times != 0:
                        endArray.append(a)
                        times -= 1
                else:
                    endArray.append(a)
                placeholdNum = ''
            else:
                if placeholdNum != '':
                    times = int(placeholdNum)
                    while times != 0:
                        endArray.append(a)
                        times -= 1
                else:
                    endArray.append(a)
                placeholdNum = ''
        
        x = 0
        y = 0
        
        for k in endArray:
            if k == 'o':
                self.grid[index[0]+(2+y), index[1]+(2+x)] = self.aliveValue
                x += 1
            elif k == 'b':
                self.grid[index[0]+(2+y), index[1]+(2+x)] = self.deadValue
                x += 1
            else:
                x = 0
                y += 1
        
        
