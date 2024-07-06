import 'package:flutter/material.dart';

/// A custom button widget that displays an color background and a text overlay.
class CustomButton extends StatelessWidget {
  final String hintText;
  final VoidCallback ontap;

  /// Creates a custom button.
  ///
  /// The [ontap] parameter is required and specifies the callback function to be called when the button is tapped.
  /// The [hintText] parameter is required and specifies the text to be displayed on the button.
  const CustomButton({
    Key? key,
    required this.ontap,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            hintText,
            style: const TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
