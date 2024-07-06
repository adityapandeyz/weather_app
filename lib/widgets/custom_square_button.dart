import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final VoidCallback ontap;
  final IconData icon;
  final String title;
  const CustomSquareButton({
    super.key,
    required this.ontap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
              ),
              Text(
                title,
                style: const TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
