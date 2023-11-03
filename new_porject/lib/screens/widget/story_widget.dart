import 'package:flutter/material.dart';

class StoryContainer extends StatefulWidget {
  final Widget icon;
  final String imageUrl;

  const StoryContainer({super.key, required this.icon, required this.imageUrl});

  @override
  State<StoryContainer> createState() => _StoryContainerState();
}

class _StoryContainerState extends State<StoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 45.0,
      height: 45.0,
      child: Stack(
        children: [
          Container(
            width: 45.0,
            height: 45.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 2.0),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  widget.imageUrl.isNotEmpty
                      ? Container(
                          width: 37.0,
                          height: 37.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.icon,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
