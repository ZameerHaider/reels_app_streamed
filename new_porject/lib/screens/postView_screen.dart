// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:new_porject/screens/make_offer/makeofferscreen.dart';
import 'package:new_porject/screens/widget/bottom_nav_buttons.dart';
import 'package:new_porject/screens/widget/profile_button.dart';
import 'package:new_porject/screens/widget/rounded_button.dart';
import 'package:new_porject/screens/widget/story_widget.dart';
import 'package:provider/provider.dart';

import '../constants/image_constants.dart';
import '../provider/post_view_provider.dart';
import '../utils/dimension.dart';

class PostViewScreen extends StatefulWidget {
  static const routeName = '/post-view';
  const PostViewScreen({super.key});

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> icons = [
      Icon(Icons.add_outlined, color: Theme.of(context).cardColor),
      Icon(Icons.camera_outlined, color: Theme.of(context).cardColor),
      Icon(Icons.shopping_bag_outlined, color: Theme.of(context).cardColor),
      Icon(Icons.music_note_outlined, color: Theme.of(context).cardColor),
      Icon(Icons.shopping_bag_outlined, color: Theme.of(context).cardColor),
      Icon(Icons.music_note_outlined, color: Theme.of(context).cardColor),
    ];
    final provider = Provider.of<PostViewProvider>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Stack(
          children: [
            PageView.builder(
              itemCount: provider.images.length,
              controller: PageController(viewportFraction: 1.0),
              onPageChanged: (index) {
                provider.setCurrentIndex(index);
              },
              itemBuilder: (context, index) {
                return Image.asset(provider.images[index], fit: BoxFit.cover);
              },
            ),
            SizedBox(
              height: 55.0, // Adjust the height as needed
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (BuildContext context, int index) {
                  return StoryContainer(icon: icons[index], imageUrl: '');
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("MacBook Air 2013",
                        style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).cardColor, fontWeight: FontWeight.w500)),
                    Text("AED 12,00",
                        style: TextStyle(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w800)),
                    Text("Lorem Ipsum is simply dummy text of the printing\n and typesetting industry.\n #lorem #new #mac",
                        style: TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL, color: Theme.of(context).cardColor, fontWeight: FontWeight.w600)),
                    const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/united_arab_emirates_round_icon_64.png', // Replace with your UAE flag asset
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Dubai, United Arab Emirates',
                            style: TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL, color: Theme.of(context).cardColor, fontWeight: FontWeight.normal))
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                              child: Text(
                                'View Website',
                                style: TextStyle(color: Theme.of(context).cardColor, fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: provider.images.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {
                            provider.setCurrentIndex(entry.key);
                          },
                          child: Container(
                            width: provider.currentIndex == entry.key ? 15 : 8,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: provider.currentIndex == entry.key ? BorderRadius.circular(10) : null,
                              shape: provider.currentIndex == entry.key ? BoxShape.rectangle : BoxShape.circle,
                              color: provider.currentIndex == entry.key ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 308,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundedGradientButton(
                      iconData: Icons.offline_pin_rounded,
                      text: 'Offers',
                      onPressed: () {
                        // Handle button click
                      },
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    RoundedGradientButton(
                      iconData: Icons.favorite,
                      text: '4.8K',
                      onPressed: () {
                        // Handle button click
                      },
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    RoundedGradientButton(
                      iconData: Icons.comment_bank_outlined,
                      text: '13.7K',
                      onPressed: () {
                        // Handle button click
                      },
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    RoundedGradientButton(
                      iconData: Icons.shape_line,
                      text: '77',
                      onPressed: () {
                        // Handle button click
                      },
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MakeOfferScreen()));
                        },
                        child: const CircularProfileImage(imageUrl: ImagesConstants.profile))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
