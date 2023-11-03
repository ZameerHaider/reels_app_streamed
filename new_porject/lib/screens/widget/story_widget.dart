import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class StoryContainer extends StatelessWidget {
  Widget? icon;
  Widget? imageUrl;

  StoryContainer({super.key, required this.icon, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)],
                ),
                width: 2,
              ),
            ),
            width: 55.0,
            height: 55,
            child: icon != null ? icon! : imageUrl),
        Text('Add Story', style: TextStyle(color: Theme.of(context).cardColor, fontSize: 10))
      ],
    );
  }
}
