# Class Generator

Generate const class

Code objects are referenced using one of the following syntax. There is no type checking. A correct type should reference to a valid code object at compile time, just like regular code. You can use built-in types or custom ones but in that case make sure dependencies files are correctly imported without name conflict.

**external object**
```yaml
fieldname: Type
```
Reference an external object
`fieldname`: Name used inside the generator to reference your object `Type`
`Type`: Exact type of the object referenced in code.

**generate new class**
```yaml
fieldname:
    fieldA: Type
    fieldB: Type
```
Generate a new class of name `fieldname` in PascalCase.
`fieldname`: Name used inside the generator to reference your object `Type`
child fields are used as class members.
If a child has also child, a sub-class will be used to generate a nested class.
There's no limit in the depth of sub-class

```yaml
fieldname:
    fieldA: Type
    fieldB:
        field1: Type
        field2: Type
```