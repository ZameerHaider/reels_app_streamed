import 'package:flutter/material.dart';
import 'package:new_porject/constants/image_constants.dart';
import 'package:new_porject/screens/widget/chat_bubble_message.dart';
import 'package:new_porject/screens/widget/profile_button.dart';
import 'package:new_porject/utils/dimension.dart';

class MakeOfferScreen extends StatefulWidget {
  const MakeOfferScreen({super.key});

  @override
  State<MakeOfferScreen> createState() => _MakeOfferScreenState();
}

class _MakeOfferScreenState extends State<MakeOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationWidget(context),
        backgroundColor: const Color.fromRGBO(29, 59, 133, 0.894),
        appBar: AppBar(
          toolbarHeight: 65,
          centerTitle: true,
          leadingWidth: 45,
          backgroundColor: const Color.fromRGBO(12, 37, 67, 1),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Theme.of(context).cardColor)),
            ],
          ),
          title: Row(
            children: [
              const CircularProfileImage(imageUrl: ImagesConstants.profile),
              const SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Abu Hamza", style: TextStyle(color: Theme.of(context).cardColor, fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Text("Posted this item for sale", style: TextStyle(color: Theme.of(context).cardColor, fontSize: Dimensions.FONT_SIZE_SMALL))
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).cardColor,
                )),
          ],
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: Column(
              children: [
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).disabledColor, borderRadius: BorderRadius.circular(5)),
                      height: 25,
                      width: 54,
                      alignment: Alignment.center,
                      child: const Text('Today', style: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Row(children: [ChatBubble(message: 'im interested to buy \n your product with counter offer', time: '10:30 AM', isMe: false)]),
                const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(12, 37, 67, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        const Text('Counter Offer', style: TextStyle(color: Color.fromARGB(255, 2, 198, 224), fontWeight: FontWeight.w600)),
                        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(ImagesConstants.photo1, fit: BoxFit.fill))),
                        const SizedBox(height: 10),
                        Text('DSLR NiKON 520D with 18mm Lense', style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Row(
                            children: [
                              Text('Location : ', style: TextStyle(color: Theme.of(context).cardColor, fontSize: Dimensions.FONT_SIZE_SMALL)),
                              const Text('Bur Dubai, United Arab Emirated',
                                  style: TextStyle(color: Color.fromARGB(255, 2, 198, 224), fontSize: Dimensions.FONT_SIZE_SMALL)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text('Offered : ', style: TextStyle(color: Theme.of(context).cardColor, fontSize: Dimensions.FONT_SIZE_SMALL)),
                            const Text('\$1200 + 200 Saltaries + Product',
                                style: TextStyle(color: Color.fromARGB(255, 2, 198, 224), fontSize: Dimensions.FONT_SIZE_SMALL)),
                          ],
                        ),
                        SizedBox(
                          height: 93,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                6,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 45,
                                    width: 80,
                                    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12), child: Image.asset(ImagesConstants.profile, fit: BoxFit.cover)),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 53,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.5),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Reject')),
                            )),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.5),
                                      gradient: const LinearGradient(
                                          colors: [Color.fromARGB(255, 35, 104, 160), Colors.cyan, Color.fromARGB(255, 102, 237, 255)],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight),
                                    ),
                                    height: 53,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.5),
                                            ),
                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                        ),
                                        child: const Text('Accept')))),
                          ],
                        ),
                        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bottomNavigationWidget(BuildContext context) {
  bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: EdgeInsets.only(bottom: _keyboardVisible ? 340 : 0),
    height: 80,
    color: const Color.fromRGBO(12, 37, 67, 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Theme.of(context).cardColor),
              decoration: InputDecoration(
                border: InputBorder.none, // Remove the border
                labelText: 'Typing messages...',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt_outlined, color: Theme.of(context).cardColor),
                    const SizedBox(width: 10),
                    Icon(Icons.location_on, color: Theme.of(context).cardColor),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 102, 237, 255), shape: BoxShape.circle),
          child: Icon(Icons.send_sharp, color: Theme.of(context).cardColor),
        )
      ],
    ),
  );
}
