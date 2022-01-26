# -*- coding: utf-8 -*-
"""
Determine the shift of the Caesar Cypher

Created on Sat Feb  2 23:03:02 2019

@author: shakes
"""
from collections import Counter
import string

message = "Zyp cpxpxmpc ez wzzv fa le esp delcd lyo yze ozhy le jzfc qppe Ehz ypgpc rtgp fa hzcv Hzcv rtgpd jzf xplytyr lyo afcazdp lyo wtqp td pxaej hteszfe te Escpp tq jzf lcp wfnvj pyzfrs ez qtyo wzgp cpxpxmpc te td espcp lyo ozye esczh te lhlj Depaspy Slhvtyr" 
#message = "Wkh txlfn eurzq ira mxpshg ryhu wkh odcb grj"

#frequency of each letter
letter_counts = Counter(message)
#print(letter_counts)
print(letter_counts)

#find max letter
maxFreq = -1
maxLetter = None
for letter, freq in letter_counts.items(): 
    #print(letter, ":", freq)
    if freq > maxFreq and letter != " ":
        maxLetter = letter
        maxFreq = freq
    #INSERT CODE TO REMEMBER MAX
print("Max Ocurring Letter:", maxLetter)

#predict shift
#assume max letter is 'e'
letters = string.ascii_letters #contains 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
shift = letters.index(maxLetter)-4#COMPUTE SHIFT HERE
print("Predicted Shift:", shift)

#decrypt the message
decrypted = []

invkeys = {}

for index, letter in enumerate(letters):
    if index < 26: #lowercase
        for i in range(0,26):
            if i < shift:
                invkeys[letters[i]] = letters[i+(26-shift)] #use dictionary for letter mapping
            else:
                invkeys[letters[i]] = letters[i-shift]
    else: #uppercase
        for i in range(26,52):
            if i <= (25+shift):
                invkeys[letters[i]] = letters[i+(26-shift)] #use dictionary for letter mapping
            else:
                invkeys[letters[i]] = letters[i-shift]

for a in message:
    if a == ' ':
        decrypted.append(a)
    else:
        decrypted.append(invkeys[a])
print("Decryped Message:", "".join(decrypted))

#assume we dont know the max letter
#Brute Force it
print()
print("Attempt to brute force it")

def brute_force(message,step):
    compiled = []
    invKEYs = {}
    for index, letter in enumerate(letters):
                if index < 26: #lowercase
                    for i in range(0,26):
                        if i < step:
                            invKEYs[letters[i]] = letters[i+(26-step)] #use dictionary for letter mapping
                        else:
                            invKEYs[letters[i]] = letters[i-step]
                else: #uppercase
                    for i in range(26,52):
                        if i <= (25+step):
                            invKEYs[letters[i]] = letters[i+(26-step)] #use dictionary for letter mapping
                        else:
                            invKEYs[letters[i]] = letters[i-step]
    for i in message:
        if i == ' ':
            compiled.append(i)
        else:
            compiled.append(invKEYs[i])
    return ("".join(compiled))
                
for i in range(0,26):
    print("Step " + str(i) + ": ")
    print(brute_force(message,i))
    print()





        
