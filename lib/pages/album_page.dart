import 'package:app_muscik/pages/music_detail_page.dart';
import 'package:app_muscik/theme/colors.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../json/songs_json.dart';

class AlbumPage extends StatefulWidget {
  final dynamic song;
  const AlbumPage({super.key, this.song});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.song['img'],
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.song['title'],
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 8, bottom: 8),
                        child: Text(
                          'Subsirabe',
                          style: TextStyle(color: white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
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
                      songs.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: Music_Detail_Page(
                                        title: songs[index]["title"],
                                        description: songs[index]
                                            ['description'],
                                        color: songs[index]["color"],
                                        img: songs[index]['img'],
                                        songUrl: songs[index]['song_url']),
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
                                  width: size.width - 210,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        songs[index]['song_count'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        songs[index]['date'],
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
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
              SizedBox(
                height: 30,
              ),
              Column(
                  children: List.generate(songAlbums.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: Music_Detail_Page(
                                title: widget.song["title"],
                                description: widget.song['description'],
                                color: widget.song["color"],
                                img: widget.song['img'],
                                songUrl: widget.song['song_url']),
                            type: PageTransitionType.scale),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: (size.width - 60) * 0.77,
                          child: Text(
                            "${index + 1}  " + songAlbums[index]['title'],
                            style: TextStyle(color: white),
                          ),
                        ),
                        Container(
                          width: (size.width - 60) * 0.23,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                songAlbums[index]['duration'],
                                style: TextStyle(color: grey, fontSize: 14),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: grey.withOpacity(0.8),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    FeatherIcons.moreVertical,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
