# Naming
Bloc:
{Subject}Bloc

## States:
base class: {Subject}State
sub-classes: {Subject}{Description}
CurrentState should be either a verb in form of a Present participles or an Adjective. Based on subject and the current state name you should be able to construct a sentence in that form:
The {Subject} is {Description}.
examples:
The patient list is loading
The patient list is ready
The patient list is error
The patient list is empty

**NEVER** use a state description at past tense, otherwise it will be confused with events.

## Events:
base class: {Subject}Event
sub-classes: {Subject}{Event}
CurrentState should be either a verb in past tense. Based on subject and the current state name you should be able to construct a sentence in that form:
The {Subject}'s {action} has been {Event}.
examples:
The patient list fetch has been requested.
The patient list is ready
The patient list is error
The patient list is empty

**NEVER** use a state description at past tense, otherwise it will be confused with events.

# Code
put stream subscriptions AFTER on