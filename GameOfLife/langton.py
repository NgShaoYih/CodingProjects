# -*- coding: utf-8 -*-
"""
Created on Mon May  3 22:35:09 2021

@author: Emily Ng Shao Yih (46766546)
"""

##Rules##
#if white turn black move right
#if black turn white move left

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import matplotlib.colors as pltcolours

pltcolours.red

'''
#color class
class color:
    def __init__(self, colors, name='from_list', N=None):
        self.name = 
'''

#grid class
class grid:
    def __init__(self, N=256):
        self.grid = np.zeros((N,N), np.uint)
        self.ant = np.matrix(np.zeros((N//2,N//2)))
        self.rows = N
        self.cols = N
        self.white = 0
        self.black = 1
        self.red = 2
        
    def insertAnt(self, index=(0,0)):
        self.grid[index[self.cols/2],index[self.rows/2]] = self.white
        
    def getStates(self):
        return self.grid
    
    def getAnt(self):
        return self.ant
    
    def evolve(self, color, direction):
        updateGrid = np.zeros((self.rows, self.cols), np.uint8)
        if color == self.white:
            if direction == 'up':
                self.right()
            elif direction == 'down':
                self.left()
            elif direction == 'left':
                self.up()
            else:
                self.down()
            
        if color == self.black:
            if direction == 'up':
                self.left()
            elif direction == 'down':
                self.right()
            elif direction == 'left':
                self.down()
            else:
                self.up()
        
    def up(self, index=[0,0]):
        index = [0,-1]
        return index
    
    def down(self, index=[0,0]):
        index = [0,1]
        return index
    
    def left(self, index=[0,0]):
        index = [-1,0]
        return index
        
    def right(self, index=[0,0]):
        index = [1,0]
        return index
    
#plot
'''
fig = plt.figure()

plt.grey()

img = plt.imshow(cells, animated=True)
plt.imshow(cells)

#test if square appears
plt.figure(0)
plt.gray()
plt.imshow(cells)

ax = plt.gca()
# Minor ticks
ax.set_xticks(np.arange(-.5, N, 1), minor=True);
ax.set_yticks(np.arange(-.5, N, 1), minor=True);
#grid
ax.grid(which='minor', color='w', linestyle='-', linewidth=1)

def animate(i):
    """perform animation step"""
    
    ant.evolve()
    cellsUpdated = ant.getStates()
    
    img.set_array(cellsUpdated)
    
    return img,

interval = 200 #ms

#animate 24 frames with interval between them calling animate function at each frame
#ani = animation.FuncAnimation(fig, animate, frames=24, interval=interval, blit=True)

#plt.show()
'''
#run code here
def main():
    N = 64
    ant = grid(N)
    display = ant.getStates()
    pos = ant.getAnt()
    
    
main()
