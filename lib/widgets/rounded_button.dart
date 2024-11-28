import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loadingText,
    this.color,
    this.textColor,
    this.borderRadius,
    this.isLoading,
    this.padding,
  });

  final String text;
  final String? loadingText;
  final Function onTap;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final bool? isLoading;
  final EdgeInsetsGeometry? padding;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.isLoading == true ? null : () => widget.onTap(),
      disabledColor: Colors.grey,
      color: widget.color ?? CustomColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
      ),
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _validation(),
        ],
      ),
    );
  }

  Color? _getColor() {
    if (widget.textColor != null) {
      return widget.textColor;
    } else {
      return Colors.white;
    }
  }

  _validation() {
    if (widget.isLoading == false) {
      return Text(widget.text, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: _getColor(), letterSpacing: 1));
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.isLoading == true)
            Text(
              widget.loadingText.toString(),
              style: TextStyle(color: _getColor(), letterSpacing: 1),
            ).paddingOnly(right: 10),
          const SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          ).paddingOnly(right: 10),
        ],
      );
    }
  }
}
