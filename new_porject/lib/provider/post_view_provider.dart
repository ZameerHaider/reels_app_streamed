import 'package:flutter/material.dart';
import 'package:new_porject/constants/image_constants.dart';

class PostViewProvider with ChangeNotifier {
  final List<String> images = [
    ImagesConstants.photo1,
    ImagesConstants.photo2,
    ImagesConstants.photo3,
    // Add more image URLs here
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
