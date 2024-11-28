// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';

class CustomTextBox extends StatefulWidget {
  const CustomTextBox({
    super.key,
    this.fieldName,
    this.hintText,
    this.errorText,
    this.hasFocusBorder,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.maxLength,
    this.onEditingComplete,
    this.minLines,
    this.maxLines,
    this.contentPadding,
    this.textAlign,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.autofillHints,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
  });

  final String? fieldName;
  final String? hintText;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Color? fillColor;
  final Color? borderColor;
  final bool? hasFocusBorder;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldName != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.fieldName ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: CustomColors.primary),
            ),
          ),
        TextFormField(
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType ?? TextInputType.name,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          textAlign: widget.textAlign ?? TextAlign.start,
          onChanged: widget.onChanged,
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          cursorColor: CustomColors.secondary,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          autofillHints: widget.autofillHints,
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: const TextStyle(color: CustomColors.border),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                width: 1,
                color: CustomColors.border,
              ),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: CustomColors.border,
              ),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: CustomColors.border,
              ),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
            ),
            fillColor: widget.fillColor ??  CustomColors.placeholder,
            filled: true,
            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
