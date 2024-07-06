import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A custom button widget that displays an color background and a text overlay.
class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final VoidCallback ontap;

  /// Creates a custom button.
  ///
  /// The [ontap] parameter is required and specifies the callback function to be called when the button is tapped.
  /// The [hintText] parameter is required and specifies the text to be displayed on the button.
  const SearchBarWidget({
    super.key,
    required this.ontap,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextFormField(
            // controller: widget.controller,
            decoration: InputDecoration(
              hintText: 'Enter City, eg. Delhi',
              filled: true,
              hintStyle: GoogleFonts.jost(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.only(
                  left: 18.0, bottom: 16.0, top: 16.0, right: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            // validator: (val) {
            //   if (val!.isEmpty) {
            //     return 'Please enter ${widget.titleText.isNotEmpty == true ? widget.titleText : widget.hintText}';
            //   }
            //   return null;
            // },
          ),
        ),
        SizedBox(
          width: 100,
          child: InkWell(
            onTap: ontap,
            child: Container(
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
          ),
        ), // Add spacing between the text field and the button
      ],
    );
  }
}
