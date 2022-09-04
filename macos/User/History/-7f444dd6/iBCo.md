import 'dart:ffi';

Would be cool if instead of doing
`jsonField('id', refer('String'))` we could do `jsonField('id', String)` for literals
this should also support: 
`jsonField('id', 'UnexistingType', 'url', name: 'test')`