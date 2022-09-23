import 'package:app_muscik/pages/home_page.dart';
import 'package:app_muscik/theme/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.book,
      FeatherIcons.search,
      FeatherIcons.settings,
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return IconButton(
                icon: Icon(
                  items[index],
                  color: activeTab == index ? primary : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
              );
            })),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text(
            'Libray',
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Seacry',
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'Setiing',
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
