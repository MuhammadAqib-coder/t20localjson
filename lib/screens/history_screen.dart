import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/widgets/flag_and_text.dart';
import 'package:t_twenty/widgets/text.dart';

import '../utils/history_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    //  print(screenHeight);
    // print(screenWidth);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("History"),
      ),
      body: FutureBuilder<List<HistoryModel>>(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:  EdgeInsets.only(top: Dimension.height10, left: Dimension.width5, right: Dimension.width5),
                  height: Dimension.height150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.height20),
                      color: Colors.purple),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GetText(text: "Hosted By${snapshot.data![index].host} (${snapshot.data![index].year}) ",),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GetText(
                            text: "Winner",
                          ),
                          GetText(text: "RunnerUp", ),
                        ],
                      ),
                      FlagAndText(
                        flagOne:
                            "assets/flages/${snapshot.data![index].winnerFlag}",
                        teamOne: snapshot.data![index].winner,
                        flagTwo:
                            "assets/flages/${snapshot.data![index].runnerUpFlag}",
                        teamTwo: snapshot.data![index].runnerUp,
                        size: Dimension.height18,
                      ),
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

  Future<List<HistoryModel>> readJson() async {
    var list = <HistoryModel>[];
    var jsonData = await rootBundle.loadString('assets/data/ttwenty.json');
    var decodedData = json.decode(jsonData);
    var historyData = decodedData['history'];
    list = List.generate(
        historyData.length,
        (index) => HistoryModel(
            winner: historyData[index]['winner'],
            runnerUp: historyData[index]['runnerUp'],
            host: historyData[index]['host'],
            winnerFlag: historyData[index]['winnerFlag'],
            runnerUpFlag: historyData[index]['runnerUpFlag'],
            year: historyData[index]['year']));
    return list;
  }
}
