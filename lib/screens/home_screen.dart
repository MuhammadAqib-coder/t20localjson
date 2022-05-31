import 'package:flutter/material.dart';
import 'package:t_twenty/screens/history_screen.dart';
import 'package:t_twenty/utils/connection.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/widgets/container.dart';
import 'package:t_twenty/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'schedule.dart';
import 'team_screen.dart';
import 'venue_screen.dart';

class HomeScreen extends StatelessWidget {
  TextStyle style = const TextStyle(fontSize: 18, color: Colors.white);
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    // print("height:${Dimension.screenHeight}");
    // print("width:${Dimension.screenWidth}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Twenty 20"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: Dimension.height25,
              ))
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimension.height10,
            left: Dimension.width8,
            right: Dimension.width8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: [
            SmallContainer(
              icon: Icons.access_time,
              text: "Schedule",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Schedule()));
              },
            ),
            SmallContainer(
              icon: Icons.location_on_outlined,
              text: "Venues",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => VenueScreen()));
              },
            ),
            SmallContainer(
              icon: Icons.history,
              text: "History",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HistoryScreen()));
              },
            ),
            SmallContainer(
              icon: Icons.group,
              text: "Teams",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TeamScreen()));
              },
            ),
            SmallContainer(
              icon: Icons.live_tv,
              text: "LiveScore",
              onPressed: () async {
                Uri _url = Uri.parse("https://www.icc-cricket.com/");
                if (await Connection().isConnected()) {
                  if (!await launchUrl(_url)) throw "could not launch $_url";
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content:
                              Text("plaese check your internet connection"),
                        );
                      });
                }
              },
            ),
            SmallContainer(
              icon: Icons.video_call,
              text: "Hightlights",
              onPressed: () async {
                Uri _uri = Uri.parse("https://www.youtube.com/c/ICC");
                if (await Connection().isConnected()) {
                  if (!await launchUrl(_uri)) throw "Could not launch $_uri";
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content:
                              Text("plaese check your internet connection"),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
