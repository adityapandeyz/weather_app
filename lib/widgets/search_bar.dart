import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const CitySearchScreen(),
          ),
        );
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.search),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    'Search Your City',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
