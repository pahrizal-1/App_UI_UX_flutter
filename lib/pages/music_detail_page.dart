import 'package:app_muscik/theme/colors.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Music_Detail_Page extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const Music_Detail_Page({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.img,
    required this.songUrl,
  });

  @override
  State<Music_Detail_Page> createState() => _Music_Detail_PageState();
}

// ignore: camel_case_types
class _Music_Detail_PageState extends State<Music_Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(context),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FeatherIcons.moreVertical,
            color: white,
          ),
        ),
      ],
    );
  }
}

Widget getBody(context) {
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Container(
                width: size.width - 60,
                height: size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
