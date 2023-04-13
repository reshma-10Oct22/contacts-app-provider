import 'package:flutter/material.dart';

class ActionLoader extends StatelessWidget {
  const ActionLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: Column(
          children: const [
            SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 20),
            Text("Loading"),
          ],
        ),
      ),
    );
  }
}
