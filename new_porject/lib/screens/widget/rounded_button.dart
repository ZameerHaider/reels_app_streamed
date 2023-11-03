import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;

  const RoundedGradientButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)], // Define your gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: Icon(iconData, size: 25, color: Theme.of(context).cardColor),
          ),
          Text(text, style: TextStyle(color: Theme.of(context).cardColor, fontSize: 10.0)),
        ],
      ),
    );
  }
}
