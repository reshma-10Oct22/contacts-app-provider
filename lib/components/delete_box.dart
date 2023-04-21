import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DeleteBox extends StatelessWidget {
  const DeleteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
        Text("Are you sure?"),
        SizedBox(height: 10),
        Text("Do you want to delete this contact"),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("NO"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("YES"),
            ),
          ],
        )
      ],
    );
  }
}
