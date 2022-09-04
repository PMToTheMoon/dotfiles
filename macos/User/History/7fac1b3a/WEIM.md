# Fonctionnement du theme dans flutter

# Typography
Chaque typo contient une couleur en plus des proptiétées de texte.

see: https://m3.material.io/styles/typography/applying-type

displayLarge,
displayMedium,
displaySmall,

headlineLarge,
headlineMedium,
headlineSmall,

titleLarge,
titleMedium,
titleSmall,

bodyLarge,
bodyMedium,
bodySmall,

labelLarge,
labelMedium,
labelSmall,


# Colors
De manière générale, éviter les couleurs avec de la transparence.
La transparence à un impacte sur le code sur les performances. Elle ne doit être utilisée que lorsque l'on souhaite que la couleur affichée soit influencée par les éléments en fond.
ex: ombres, hover

voir: https://m3.material.io/styles/color/the-color-system/key-colors-tones

## tokens

primary
The color displayed most frequently across your app’s screens and components.

onPrimary
A color that's clearly legible when drawn on primary.

primaryContainer
A color used for elements needing less emphasis than primary.

onPrimaryContainer
A color that's clearly legible when drawn on primaryContainer.

secondary
An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.

onSecondary
A color that's clearly legible when drawn on secondary.

secondaryContainer
A color used for elements needing less emphasis than secondary.

onSecondaryContainer
A color that's clearly legible when drawn on secondaryContainer.

tertiary
A color used as a contrasting accent that can balance primary and secondary colors or bring heightened attention to an element, such as an input field.

tertiaryContainer
A color used for elements needing less emphasis than tertiary.

surface
The background color for widgets like Card.

onSurface
A color that's clearly legible when drawn on surface.

surfaceVariant
A color variant of surface that can be used for differentiation against a component using surface.

onSurfaceVariant
A color that's clearly legible when drawn on surfaceVariant.

background
A color that typically appears behind scrollable content.

onBackground
A color that's clearly legible when drawn on background.

error
The color to use for input validation errors, e.g. for InputDecoration.errorText.

onError
A color that's clearly legible when drawn on error.

errorContainer
A color used for error elements needing less emphasis than error.

onErrorContainer
A color that's clearly legible when drawn on errorContainer.

inversePrimary
An accent color used for displaying a highlight color on inverseSurface backgrounds, like button text in a SnackBar.

inverseSurface
A surface color used for displaying the reverse of what’s seen in the surrounding UI, for example in a SnackBar to bring attention to an alert.

onInverseSurface
A color that's clearly legible when drawn on inverseSurface.

onTertiary
A color that's clearly legible when drawn on tertiary.

onTertiaryContainer
A color that's clearly legible when drawn on tertiaryContainer.

outline
A utility color that creates boundaries and emphasis to improve usability.

shadow
A color use to paint the drop shadows of elevated components.

surfaceTint
A color used as an overlay on a surface color to indicate a component's elevation.




