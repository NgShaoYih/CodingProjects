from turing_machine import TuringMachine


machine = TuringMachine(
    {
        ('q0', '#'): ('End', '#', 'R'),
        ('End', ''): ('qa', '', 'R'),

        ('q0', '0'): ('FindDelimiter0', 'X', 'R'),
        ('FindDelimiter0', '#'): ('Check0', '#', 'R'),
        ('Check0', '0'): ('FindLeftmost', 'X', 'L'),

        ('q0', '1'): ('FindDelimiter1', 'X', 'R'),
        ('FindDelimiter1', '#'): ('Check1', '#', 'R'),
        ('Check1', '1'): ('FindLeftmost', 'X', 'L'),

        ('FindLeftmost', '0'): ('FindLeftmost', '0', 'L'),
        ('FindLeftmost', '1'): ('FindLeftmost', '1', 'L'),
        ('FindLeftmost', 'X'): ('FindLeftmost', 'X', 'L'),
        ('FindLeftmost', '#'): ('FindLeftmost', '#', 'L'),
        ('FindLeftmost', ''): ('FindNext', '', 'R'),

        ('FindNext', 'X'): ('FindNext', 'X', 'R'),
        ('FindNext', '0'): ('FindDelimiter0', 'X', 'R'),
        ('FindNext', '1'): ('FindDelimiter1', 'X', 'R'),
        ('FindNext', '#'): ('End', '#', 'R'),

        ('FindDelimiter0', '0'): ('FindDelimiter0', '0', 'R'),
        ('FindDelimiter0', '1'): ('FindDelimiter0', '1', 'R'),
        ('FindDelimiter1', '0'): ('FindDelimiter1', '0', 'R'),
        ('FindDelimiter1', '1'): ('FindDelimiter1', '1', 'R'),

        ('Check0', 'X'): ('Check0', 'X', 'R'),
        ('Check1', 'X'): ('Check1', 'X', 'R'),

        ('End', 'X'): ('End', 'X', 'R')
    }
)

w = '10#10' #try some strings here to find out what the machine accepts and rejects
print("Input:",w)
print(machine.debug(w))
print("Accepted?", machine.accepts(w))

'''
Starting State: q0
Accept State: qa
Transition State: FindDelmiter0, FindDelimiter1, FindLeftMost, FindNext, Check0, Check1

This machine accepts strings that contain one '#' which is not the first letter in the string,
and checks if the string before and after the '#' are the same
'''
