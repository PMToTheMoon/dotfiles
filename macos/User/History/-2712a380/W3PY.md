# Naming
## Bloc and State machines:
{Subject}Bloc

### States:
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

### Events:
base class: {Subject}Event
sub-classes: {Subject}{Action}{Event}
CurrentState should be either a verb in past tense. Based on subject and the current state name you should be able to construct a sentence in that form:
The {Subject}'s {action} has been {Event}.
The {action} of {Subject}'s has been {Event}.
examples:
The fetch of the patient list has been requested.
The fetch of the patient list has failed.
The fetch of the patient list has succeed.

## Defining shared behavior for State with state machine bloc

# Code
put stream subscriptions AFTER on