import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.name,
    // required this.type,
    // required this.controller,
    required this.invokeWidget,
  });

  final String name;
  // final Reference type;
  // final Reference controller;
  final Expression invokeWidget;

  // Field toField() => Field((f) => f
  //   ..name = name
  //   ..type = type
  //   ..modifier = FieldModifier.final$);
}

abstract class FormFieldWidget {
  Expression invokeWidget(Expression accessValue);
}

abstract class FormField extends MetaObject<FormFieldMetaData> {}

abstract class SingleFormField extends MetaObject<FormFieldMetaData> {
  SingleFormField({
    required this.name,
    required this.accessController,
    required this.controller,
    required this.widget,
  });

  final Expression accessController;
  final String name;
  // final Reference valueType;
  final FormFieldController controller;
  final FormFieldWidget widget;

  @override
  FormFieldMetaData build(BuildStep step) {
    return FormFieldMetaData(
      name: name,
      invokeWidget: widget.invokeWidget(
        controller.accessValue(accessController),
      ),
    );
  }
}

// /// Responsibility: generate form widget
// abstract class FormField extends MetaObject<FormFieldMetaData> {
//   FormField(
//     String name,
//   ) : name = name.camelCase;

//   final String name;

//   /// An expression that return the controller corresponding to the current field
//   Reference get referController => refer('_controller.$name');

//   /// The type of the data for the current field
//   Reference get type;

//   /// The controller type used by this field
//   Reference get controller;

//   /// instantiate a the form field widget
//   Expression get invokeWidget;

//   /// instantiate the controller
//   Expression get invokeController;

//   /// access the value from controller
//   Expression get getValue;

//   @override
//   FormFieldMetaData build(BuildStep step) {
//     return FormFieldMetaData(
//       name: name,
//       type: type,
//       controller: controller,
//       invokeWidget: invokeWidget,
//       invokeController: invokeController,
//       getValue: getValue,
//     );
//   }
// }
