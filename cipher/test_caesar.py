# -*- coding: utf-8 -*-
"""
Caesar cypher script

Encode and decode messages by scrambling the letters in your message

Created on Fri Feb  1 23:06:50 2019

@author: shakes
"""
import string

letters = string.ascii_letters #contains 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

#message = "The quick brown fox jumped over the lazy dog" #type your message here
message = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"
#message = "the quick brown fox jumped over the lazy dog"
print("Message:", message)

#create the Caesar cypher
offset = 5 #choose your shift
totalLetters = 26
#attempt 1
keys = {}
invkeys = {} #use dictionary for inverse letter mapping, you could use inverse search from original dict
for index, letter in enumerate(letters):
    # cypher setup
    if index < totalLetters: #lowercase
        #INSERT CODE HERE
        for i in range(0,26):
            if i >= (totalLetters-offset):
                keys[letters[i]] = letters[i-(totalLetters-offset)] #use dictionary for letter mapping
            else:
                keys[letters[i]] = letters[i+offset]
                
    else: #uppercase
        #INSERT CODE HERE
        for i in range(26,52):
            if i >= (52-offset):
                keys[letters[i]] = letters[i-(totalLetters-offset)] #use dictionary for letter mapping
            else:
                keys[letters[i]] = letters[i+offset]

#the same for invkeys
'''
easy way out
invkeys = {a:b for b, a in keys.items()}             
'''

#not so easy way out
for index, letter in enumerate(letters):
    # cypher setup
    if index < totalLetters: #lowercase
        #INSERT CODE HERE
        for i in range(0,26):
            if i < offset:
                invkeys[letters[i]] = letters[i+(totalLetters-offset)] #use dictionary for letter mapping
            else:
                invkeys[letters[i]] = letters[i-offset]
    else: #uppercase
        #INSERT CODE HERE
        for i in range(26,52):
            if i <= (25+offset):
                invkeys[letters[i]] = letters[i+(totalLetters-offset)] #use dictionary for letter mapping
            else:
                invkeys[letters[i]] = letters[i-offset]

                
print("Cypher Dict:", keys)

#encrypt
encryptedMessage = []
for letter in message:
    if letter == ' ': #spaces
        encryptedMessage.append(letter)
    else:
        encryptedMessage.append(keys[letter])
print("Encrypted Message:", ''.join(encryptedMessage)) #join is used to put list into string

#decrypt
decryptedMessage = []
for letter in encryptedMessage:
    if letter == ' ': #spaces
        decryptedMessage.append(letter)
    else:
        decryptedMessage.append(invkeys[letter])
print("Decrypted Message:", ''.join(decryptedMessage)) #join is used to put list inot string
