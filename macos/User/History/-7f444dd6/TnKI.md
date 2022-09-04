import 'dart:ffi';

# Field improvements
Would be cool if instead of doing
`jsonField('id', refer('String'))` we could do `jsonField('id', String)` for literals
this could also support: 
`jsonField('id', 'ToBeGeneratedModel', 'url', name: 'test')`
`jsonField('id', metaObject, name: 'test')`

# Remove Path
Maybe we can use folder structure to imply meta objects path, similar to frog ?