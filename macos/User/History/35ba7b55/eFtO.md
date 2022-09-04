# New generators

## Dimension-class based
- borderRadius
- icons
- image

## merge with others generator project ?
- config gen
- ~~form gen~~

## Column & Row improvement
```dart
Col(
    //params,
    [
        children
    ],
)
```
great syntax, but what to do with row ?
```dart
//shadowing
Row(
    //params
    [

    ],
)

R() //ugly
neat.Row() //too long
import neat/material.dart instead of import flutter/material ?

```

## More build context extension
Media Query
    - isKeyboardOpen
Navigator
    - arguments

## More generator
### border radius
borderRadius: BorderRadius.circular(Dimensions.borderRadius1),

## Padding generation improvements
### Move top/right/left/bottom constant declaration
When padding generated padding is imported within a namespace, constant are also under this namespace. A solution could be to declare padding constant inside neat lib directly

### New only constructor
Padding.left();
Padding.right();
Padding.top();
Padding.bottom();

### New except constructor
Padding.expect(top | left);

## Alternative annotation syntax
NeatGenerator(...option) syntax is not so neat.
if you override padding option and let space empty it's unclear
It not let you use a generator with two differents settings.

### proposition:
```dart
@NeatGenerate([
    Neat.generateSpace,
    Neat.generatePadding,
    ...
])
class Dimensions {}
```

## Better annotation options
Rework annotations options