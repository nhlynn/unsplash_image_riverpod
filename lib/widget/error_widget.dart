import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({super.key, required this.message, required this.tryAgain});

  final String message;
  final Function() tryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        ),
        FilledButton(
          onPressed: tryAgain,
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
