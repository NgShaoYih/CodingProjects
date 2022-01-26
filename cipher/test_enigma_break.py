# -*- coding: utf-8 -*-
"""
Create and test an Enigma machine encryption and decoding machine

This code is based on the implementation of the Enigma machine in Python 
called pyEnigma by Christophe Goessen (initial author) and Cédric Bonhomme
https://github.com/cedricbonhomme/pyEnigma

Created on Tue Feb  5 12:17:02 2019

@author: uqscha22
"""
import string
import enigma
import rotor

letters = string.ascii_letters #contains 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
capitalLetters = letters[-26:]
#print(capitalLetters)

ShakesHorribleMessage = "Xm xti ca idjmq Ecokta Rkhoxuu! Kdiu gm xex oft uz yjwenv qik parwc hs emrvm sfzu qnwfg. Gvgt vz vih rlt ly cnvpym xtq sgfvk jp jatrl irzru oubjo odp uso nsty jm gfp lkwrx pliv ojfo rl rylm isn aueuom! Gdwm Qopjmw!"
crib = "Hail Shakes!"
crib_substring = ShakesHorribleMessage[-12:]
print(crib_substring)

##Break the code via brute force search
#INSERT CODE HERE

#add counter
count = 1
#loop
loop = 0
for i in capitalLetters:
    for a in capitalLetters:
        
        for n in capitalLetters:
            keyCombo = i+a+n
            engine = enigma.Enigma(rotor.ROTOR_Reflector_A, rotor.ROTOR_I,
                                   rotor.ROTOR_II, rotor.ROTOR_III, keyCombo,
                                   plugs="AA BB CC DD EE")
            decode = engine.encipher(ShakesHorribleMessage)
            crib_decode = decode[-12:]
            if crib == crib_decode:
                print('Decoded Crib:', crib_decode)
                break
            else:
                count += 1
        if crib == crib_decode:
            break
    if crib == crib_decode:
        break
    

#Print the Decoded message
#INSERT CODE HERE
print('Key Combination:', keyCombo)
print('Decoded Message:', decode)
print('Number of tries:', count)

#number of tries = 11772
#it took around 14 seconds
#it wouldve probably taken about 5 hours back then to decypher

##it would probably take about 20-30 minutes

