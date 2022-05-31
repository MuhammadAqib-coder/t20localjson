import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/utils/team_model.dart';
import 'package:t_twenty/widgets/image_row.dart';
import 'package:t_twenty/widgets/text.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    //  print(screenHeight);
    // print(screenWidth);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<TeamModel>>(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:  EdgeInsets.only(left: Dimension.width10, right: Dimension.width10, top: Dimension.height10),
                  height: Dimension.height130,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(Dimension.height20)),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:Dimension.width8),
                        child: ImageRow(address: snapshot.data![index].flag,height: Dimension.height70,width: Dimension.width100,),
                      ),
                      SizedBox(width: Dimension.width20,),
                      GetText(text: snapshot.data![index].fullName,)
                      ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<TeamModel>> readJson() async {
    var list = <TeamModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var jsonFile = await assetBundle.loadString('assets/data/ttwenty.json');
    var decodedData =  json.decode(jsonFile);
    var teamData = decodedData['teams'];
    for (var map in teamData) {
      var teamModel = TeamModel.fromJson(map);
      list.add(teamModel);
    }
    return list;
  }
}
