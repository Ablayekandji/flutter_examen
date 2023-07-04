import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordInputField extends StatefulWidget {
  final String name;
  final bool? isPrefixIcon;
  final Color? prefixIconColor;
  final bool? isEnabled;
  final String? hintText;
  final TextEditingController? initialValue;

  const PasswordInputField(
      {Key? key,
      required this.name,
      this.isEnabled,
      this.hintText,
      this.initialValue,
      this.isPrefixIcon,
      this.prefixIconColor})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final passwordValidator =
      FormBuilderValidators.minLength(8, errorText: "Taille minimale est 8");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          //autofocus: true,
          controller: widget.initialValue,
          enabled: widget.isEnabled ?? true,
          obscureText: true,
          cursorColor: Colors.black,
          keyboardType: TextInputType.visiblePassword,
          name: widget.name,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 232, 225, 225),
            prefixIcon: widget.isPrefixIcon != null
                ? Icon(
                    Icons.lock_outline,
                    color: widget.prefixIconColor ?? Colors.green,
                  )
                : null,
            hintText: widget.hintText ?? 'Mot de passe',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 232, 225, 225),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: FormBuilderValidators.compose(
              [requiredValidator, passwordValidator]),
        ),
      ],
    );
  }
   FormFieldValidator<Object> requiredValidator = FormBuilderValidators.required(
  errorText: 'Champ requis.',
);
}