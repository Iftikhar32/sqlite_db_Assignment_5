import 'package:flutter/material.dart';

class StudentItemInfoWidget extends StatelessWidget {
  final String title, value;
  const StudentItemInfoWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100,
          child: Flexible(child: Text(title, style: const TextStyle(fontSize: 20),)),

        ),
        Flexible(
          child: Text(value, style: const TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}