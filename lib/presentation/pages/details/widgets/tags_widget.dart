import 'package:flutter/material.dart';

class PhotoTags extends StatelessWidget {

  final List<String> tags = [
    "Girl",
    "Woman",
    "Mood",
    "People",
    "Free Pictures",
    "Free asd",
    "Free ASD",
    "Free aD",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            padding: const EdgeInsets.all(8),
            child: Text(tag,
                style: TextStyle(color: Colors.grey[800])),
          ),
        );
      }).toList(),
    );
  }

}