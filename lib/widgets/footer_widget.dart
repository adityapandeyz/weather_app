import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Data provided in part by',
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://openweathermap.org/themes/openweathermap/assets/vendor/owm/img/icons/logo_60x60.png',
              scale: 2,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'OpenWeather',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
