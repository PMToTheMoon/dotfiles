# Naming
Bloc:
{Subject}Bloc

States:
base class: {Subject}State
sub-classes: {Subject}{CurrentState}
CurrentState should be either a verb in form of a Present participles or an Adjective. Based on subject and the current state name you should be able to construct a sentence in that form:
The {Subject} is {CurrentState}.
examples:
The patient list is loading
The patient list is ready
The patient list is error
The patient list is empty

# Code
put stream subscriptions AFTER on