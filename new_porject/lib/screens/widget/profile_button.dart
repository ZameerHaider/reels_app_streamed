import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  final String imageUrl; // Replace with your image URL or asset path

  const CircularProfileImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).disabledColor, // Background color for the circular container
      ),
      child: ClipOval(
        child: Image.asset(
          imageUrl, // Replace with your image URL or use Image.asset for assets
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
