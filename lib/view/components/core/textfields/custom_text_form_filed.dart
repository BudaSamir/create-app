import 'package:flutter/material.dart';

import '../../../constant/color_manager.dart';

// ignore: must_be_immutable
class TextFormFieldsCustom extends StatefulWidget {
  final String? hintText;
  final int? MaxLines;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final bool? enableInteractive ;



  TextFormFieldsCustom({
    Key? key,
    this.hintText,

    this.validator,
    this.onSaved,
    this.MaxLines=1,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = "",
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor = hintColor,
    this.suffixIconToggle,
    this.suffixIconColorToggle = hintColor,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
  this.enableInteractive=true
  }) : super(key: key);

  @override
  State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
}

class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
  //const TextFormFieldsCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection:widget.enableInteractive,
      controller: widget.controller,
      focusNode: widget.focus,
      maxLines:widget.MaxLines ,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
        //onChanged!(value);
        widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      decoration: InputDecoration(
        fillColor: textFieldBackGround,

        filled: true,
        isDense: true,
        hintText: widget.hintText,
        helperText: widget.helperText,
        suffixIcon: widget.suffixIcon,

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: hintColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: fillGrey,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldBackGround,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      obscureText: widget.isPassword!,
      validator: widget.validator,
      onSaved: (value) {
        widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}