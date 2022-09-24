import 'package:app_muscik/pages/album_page.dart';
import 'package:app_muscik/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_muscik/json/songs_json.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  getAppbar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.list)
          ],
        ),
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    children: List.generate(song_type_1.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMenu1 = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                song_type_1[index],
                                style: TextStyle(
                                    color:
                                        activeMenu1 == index ? primary : grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              activeMenu1 == index
                                  ? Container(
                                      width: 10,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(
                      songs.length - 5,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      child: AlbumPage(
                                        song: songs[index],
                                      ),
                                      type: PageTransitionType.scale));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        songs[index]['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  songs[index]['title'],
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 180,
                                  child: Text(
                                    songs[index]['description'],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    children: List.generate(song_type_2.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMenu2 = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                song_type_1[index],
                                style: TextStyle(
                                    color:
                                        activeMenu2 == index ? primary : grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              activeMenu2 == index
                                  ? Container(
                                      width: 10,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(
                      songs.length - 5,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: songs[index + 5],
                                    ),
                                    type: PageTransitionType.scale),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        songs[index + 5]['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  songs[index]['title'],
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 180,
                                  child: Text(
                                    songs[index]['description'],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
