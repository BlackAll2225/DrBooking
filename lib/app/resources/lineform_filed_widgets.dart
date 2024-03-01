import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LineFormFieldWidget extends StatelessWidget {
  LineFormFieldWidget({
    super.key,
    this.focusNode,
    this.icon,
    this.errorText = "",
    this.labelText,
    this.controllerEditting,
    required this.setValueFunc,
    this.textInputType = TextInputType.text,
    this.isObscureText = false,
    this.isEnabled = true,
    this.initValue,
    this.padding = 0,
    this.suffixIcon,
    this.enableInteractiveSelection = true,
    this.styleInput ,
    this.radiusBorder = 2.0,
  });
  final FocusNode? focusNode;
  final IconButton? icon;
  final Widget? suffixIcon;
  String? errorText;
  final String? labelText;
  final TextEditingController? controllerEditting;
  final Function setValueFunc;
  final TextInputType textInputType;
  final bool isObscureText;
  final bool? isEnabled;
  final String? initValue;
  final double? padding;
  final bool? enableInteractiveSelection;
  final TextStyle? styleInput;
  final double? radiusBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: styleInput,
      enableInteractiveSelection: enableInteractiveSelection,
      initialValue: initValue,
      enabled: isEnabled,
      obscureText: isObscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(horizontal: padding!),
        errorText: errorText != "" ? errorText : null,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder ?? 20),
        ),
        hintText: labelText,
        hintTextDirection: TextDirection.ltr,
        hintMaxLines: 3,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
      controller: controllerEditting,
      onChanged: (value) {
        setValueFunc(value);
      },
    );
  }
}
