# Next Generators

## l10n ?
reson: avaoid string based api in ipr
{
  'key': value
}
final key = value

# Notes for next version

## Use build_runner to facilitate creation of customs bricks


```dart
//declaration is copied to output dir
@FormFieldSeed(
  value: int,
  controller: TextEditingController,
  controllerInitialization: 'TextEditingController(text: initialValue?.$name.toString(),)',
  accessData: 'int.parse($name.text)',
)
class MultiLineTextFormField extends StatelessWidget {
  ...
}
```

```dart
// params are extracted from constructor
@seed<MultiLineTextFormField>(constructor: 'namedConstructor')
final multiLineTextFormField = FormFieldSeed(
  value: int,
  controller: TextEditingController,
  controllerInitialization: 'TextEditingController(text: initialValue?.$name.toString(),)',
  accessData: 'int.parse($name.text)',
);
```

Form field
```dart
@FormFieldSeed<int>(
value: int,
controller: TextEditingController,
controllerInitialization: 'TextEditingController(text: initialValue?.$name.toString(),)',
accessData: 'int.parse($name.text)',
params: {
  'hint': String,
  'validator': String? Function(String?),
  'decorations': InputDecoration,
})
const multiLineTextFormField = r"""
MultiLineTextFormField(
  controller: {{ controller }},
  hint: {{ hint }},
  validator: {{ validator }},
  decorations: {{ decorations }},
)""";
```

Form Section
```dart
// children is shared for all form sections, no need to specify it
@FormSectionSeed({
  'required': bool,
})
const myFormSection = """
CustomWidget(
  required: {{ required }}
  children: {{ children }},
)""";
```

## Introduce a "Meta-object tree" parent lookup similar to flutter's InheritedWidget
The goal is to access parent widget data from childs
use case:
  Config meta-object, similar to flutter's theme, used to define default behaviors for objects.
  ex: TextFormFields should use label or hint by default ?
  ex: use l10n ?

## Introduces basic code representation object
Similar to `Field`, and `Fields`, this kind of object should be shared for all generator.
They aims to be used with mustache template (that's what differentiate them from code builder) or as meta data.
ex:
  Type object
  Class ?

use_case:
  fields:
    declare constructor and members based on a single list
    should be able to transform to function call and assign value
    use named and unamed params,
    manage required etc (maybe from Type type ?)
  literal/value:
    exemple for string: "'string_literal'" is anoying to write. but should also support "context.l10n.my_string";

**Note**
Maybe this object are MetaObject too ?

## Generator should feature a header system that support:
  - separated header for ipr/output
  - ability to influence header from inside and outside the model, depending on the build type (ipr/output)
use cases:
a generated model have 'part of' directive inside output, but not inside ipr (target part doesn't exist in ipr).
the part of should target an arbitrary file.
inside the ipr, model should generate required imports directives

## Formater system
A formater can be setup for a set of file type
Formater should also run on header
Manage header duplicata

# Note fro Form
Can be cool to have ability to use a hook to define a section instead of having to inherit from FormSection;

Form is composed by the following elements:
  Form:
    Main user interface.
    Form is composed by one or more form section.
    Form define the spacing between sections.
    Form collects all dependencies and add the them to the top of the files (controller and snapshot are imported using part directive)
  FormSection:
    FormSection is composed by a set of FormFields or FormSections
    It define nescessary spacing inside this section
    It collect all sub-sections and fields dependencies and expose them to Form
    It should be relatively easy to make new types of section
  FormField