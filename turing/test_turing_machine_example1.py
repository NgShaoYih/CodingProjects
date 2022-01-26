from turing_machine import TuringMachine


machine = TuringMachine(
    {
        ('q0', '#'): ('saw_#', '#', 'R'),
        ('saw_#', '#'): ('saw_##', '#', 'R'),
        ('saw_##', ''): ('qa', '', 'R'),
    }
)

w = "##" #try some strings here to find out what the machine accepts and rejects
print("Input:",w)
print(machine.debug(w))
print("Accepted?", machine.accepts(w))

'''
Starting State: q0
Accept State: qa
Transition States: saw_#, saw_##

This machine accepts string that contain exactly 2#s
'''
