# -*- coding: utf-8 -*-
"""
Created on Thu May  6 19:03:30 2021

@author: Emily Ng Shao Yih (46766546)
"""

##Rule 1 - two colors
#if white turn black move right
#if black turn white move left

##Rule 2 - LLRR four colors
#if white turn black move left
#if black turn red move left
#if red turn green move right
#if green turn white move right

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import matplotlib.colors as pltcolors

#grid size
N = 100

#making grid + ant
grid = np.zeros((N,N), np.uint)
antPos = np.matrix([[N//2], [N//2]]) #ant starting location
point = np.matrix('0;-1') #initial direction ant is pointing

#add colors
antColMap = pltcolors.ListedColormap(['w','k','r','g'])

#turning directions
left = np.matrix('0 -1; 1 0') 
right = np.matrix('0 1; -1 0')

#move ant function
def move(grid, antPos, point):
    antPos[:] = antPos + point
    
    
    #Unncoment this for Rule 1
    #Comment this out for Rule 2
    if grid[antPos[0,0], antPos[1,0]] == 0: #check if square is white
        grid[antPos[0,0], antPos[1,0]] = 1
        point[:] = right*point
    elif grid[antPos[0,0], antPos[1,0]] == 1: #check if square is black
        grid[antPos[0,0], antPos[1,0]] = 0
        point[:] = left*point

    '''
    #Uncomment this for Rule 2
    #Comment this out to run Rule 1
    if grid[antPos[0,0], antPos[1,0]] == 0: #check if square is white
        grid[antPos[0,0], antPos[1,0]] = 1
        point[:] = left*point
    elif grid[antPos[0,0], antPos[1,0]] == 1: #check if square is black
        grid[antPos[0,0], antPos[1,0]] = 2
        point[:] = left*point
    elif grid[antPos[0,0], antPos[1,0]] == 2: #check if square is red
        grid[antPos[0,0], antPos[1,0]] = 3
        point[:] = right*point
    elif grid[antPos[0,0], antPos[1,0]] == 3: #check if square is green
        grid[antPos[0,0], antPos[1,0]] = 0 
        point[:] = right*point
    '''
    
#Plotting    
fig = plt.figure()       
img=plt.imshow(grid,interpolation='none', vmin = 0,vmax = 4, cmap = antColMap)  

#animation
def animate(i):
    move(grid, antPos, point) #run move function
    img.set_data(grid)
    return [img]

anim = animation.FuncAnimation(fig, animate,frames=24, interval=0, blit=True)

plt.show()
plt.title('Emily Ng Shao Yih (46766546)')

