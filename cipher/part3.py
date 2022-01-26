'''
codebreaking - part 3
'''
from collections import Counter
import string

message = '19 17 17 19 14 20 23 18 19 8 12 16 19 8 3 21 8 25 18 14 18 6 3 18 8 15 18 22 18 11'
letters = string.ascii_letters
capitalLetters = letters[-26:]
totalLetters = 26
#for message
decrypt_message = []

limessagestr = message.split()
#change all items into int
limessage = []
for i in limessagestr:
    limessage.append(int(i))

#count amount of number types (commented out to prevent confusion)
'''
for i in limessage:
    count = limessage.count(i)
    print(i,':',count)
'''

#assume 18 = e
#assume 19 = a
#assume 17 = t
#assume 14 = c
#assume 8 = r
#assume 12 = l
#assume 21 = o
#assume 3 = b
#assume 20 = k
#assume 23 = p
#assume 16 = h
#assume 6 = m
#assume 15 = s
#assume 22 = v
#assume 11 = n

decrypted = []

for i in range(len(limessage)):
    if limessage[i] == 18:
        limessage[i] = 'e'
    elif limessage[i] == 19:
        limessage[i] = 'a'
    elif limessage[i] == 17:
        limessage[i] = 't'
    elif limessage[i] == 14:
        limessage[i] = 'c'
    elif limessage[i] == 8:
        limessage[i] = 'r'
    elif limessage[i] == 12:
        limessage[i] = 'l'
    elif limessage[i] == 21:
        limessage[i] = 'o'
    elif limessage[i] == 3:
        limessage[i] = 'b'
    elif limessage[i] == 20:
        limessage[i] = 'k'
    elif limessage[i] == 23:
        limessage[i] = 'p'
    elif limessage[i] == 16:
        limessage[i] = 'h'
    elif limessage[i] == 6:
        limessage[i] = 'm'
    elif limessage[i] == 15:
        limessage[i] = 's'
    elif limessage[i] == 22:
        limessage[i] = 'v'
    elif limessage[i] == 11:
        limessage[i] = 'n'
    else:
        limessage[i] = 'd'

#make the decrypted message look nicer
strdecrypt = ''
for i in limessage:
    strdecrypt += str(i)

#print("Decryped Message:", "".join(decrypted))
print("Decryped Message:", strdecrypt)


print('end')

