import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(12, 37, 67, 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const BottomNavigationButton(
                  icon: Icons.home_filled,
                  gradientColors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)],
                  label: 'Home',
                  textcolor: Colors.cyan,
                ),
                BottomNavigationButton(
                  icon: Icons.search,
                  label: 'Discover',
                  gradientColors: [Theme.of(context).disabledColor, Theme.of(context).cardColor],
                  textcolor: Theme.of(context).disabledColor,
                ),
                const SizedBox(width: 50),
                BottomNavigationButton(
                  icon: Icons.offline_bolt,
                  label: 'Settings',
                  gradientColors: [Theme.of(context).disabledColor, Theme.of(context).cardColor],
                  textcolor: Theme.of(context).disabledColor,
                ),
                BottomNavigationButton(
                  icon: Icons.person,
                  label: 'Profile',
                  gradientColors: [Theme.of(context).disabledColor, Theme.of(context).cardColor],
                  textcolor: Theme.of(context).disabledColor,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)], // Define your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 30,
              width: 45,
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<Color>? gradientColors;
  final Color? textcolor;

  const BottomNavigationButton({super.key, required this.icon, required this.label, this.gradientColors, this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: gradientColors!,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Icon(icon, size: 22, color: Theme.of(context).cardColor),
        ),
        Text(label, style: TextStyle(color: textcolor!, fontSize: 10)),
      ],
    );
  }
}
