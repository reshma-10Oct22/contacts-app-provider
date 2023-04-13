import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String fieldName;
  const InfoBox({
    super.key,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text("OOPS!!"),
            const SizedBox(height: 5),
            Text("Enter a valid $fieldName"),
          ],
        ),
      ),
    );
  }
}
