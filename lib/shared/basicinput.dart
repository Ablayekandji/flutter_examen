import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BasicPhoneInputField extends StatefulWidget {
  final String name;
  final bool? isPrefixIcon;
  final Color? prefixIconColor;
  final bool? isEnabled;
  final String? hintText;
  final TextEditingController? initialValue;

  const BasicPhoneInputField(
      {Key? key,
        required this.name,
        this.isPrefixIcon,
        this.isEnabled,
        this.hintText,
        this.initialValue, this.prefixIconColor})
      : super(key: key);

  @override
  State<BasicPhoneInputField> createState() => _BasicPhoneInputFieldState();
}

class _BasicPhoneInputFieldState extends State<BasicPhoneInputField> {

  TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          //autofocus: true,
          controller: widget.initialValue,
          enabled: widget.isEnabled ?? true,

          cursorColor: Color.fromARGB(255, 18, 18, 18),
          keyboardType: TextInputType.emailAddress,
          name: widget.name,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,//Color.fromARGB(255, 232, 225, 225),
            prefixIcon: widget.isPrefixIcon != null
                ? Icon(
              Icons.email_outlined,
              color: widget.prefixIconColor ?? Colors.green,
            )
                : null,
            hintText: widget.hintText??'Entez votre email',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blueGrey,
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
              [requiredValidator,]),
        ),
      ],
    );
  }
  FormFieldValidator<Object> requiredValidator = FormBuilderValidators.required(
    errorText: 'Champ requis.',
  );
}