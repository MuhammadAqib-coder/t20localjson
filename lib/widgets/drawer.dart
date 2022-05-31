import 'package:flutter/material.dart';
import 'package:t_twenty/screens/history_screen.dart';
import 'package:t_twenty/screens/schedule.dart';
import 'package:t_twenty/screens/team_screen.dart';
import 'package:t_twenty/screens/venue_screen.dart';
import 'package:t_twenty/utils/connection.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/widgets/icon.dart';
import 'package:t_twenty/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Column(
              children: [
                Icon(
                  Icons.highlight,
                  color: Colors.white,
                  size: Dimension.height80,
                ),
                SizedBox(
                  height: Dimension.height20,
                ),
                GetText(
                  text: "T20 World Cup",
                  size: Dimension.height30,
                )
              ],
            ),
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.home,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Home",
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.access_time,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Schedule",
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Schedule()));
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.location_on_outlined,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Venues",
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => VenueScreen()));
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.history,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "History",
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HistoryScreen()));
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.group,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Teams",
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TeamScreen()));
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.tv,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "live Score",
            ),
            onTap: () async {
              Uri _uri = Uri.parse("https://www.icc-cricket.com/");
              if (await Connection().isConnected()) {
                if (!await launchUrl(_uri)) throw "could not launch $_uri";
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("plaese check your internet connection"),
                      );
                    });
              }
            },
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.video_call,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Highlights",
            ),
            onTap: () async {
              Uri _uri = Uri.parse("https://www.youtube.com/c/ICC");
              if (await Connection().isConnected()) {
                if (!await launchUrl(_uri)) throw "could not load $_uri";
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("plaese check your internet connection"),
                      );
                    });
              }
            },
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          ListTile(
            leading: GetIcon(
              icon: Icons.star,
              size: Dimension.height25,
            ),
            title: GetText(
              text: "Rate us",
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
