import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 18.0, right: 18),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    ':(',
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  ),
                  Text(
                    'Oops! Something went wrong. Please try again later or contact support if the problem persists.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
