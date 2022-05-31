import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/widgets/flag_and_text.dart';
import 'package:t_twenty/widgets/text.dart';

import '../utils/schedule_model.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List list = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    //  print(screenHeight);
    // print(screenWidth);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Schedule'),
      ),
      body: list.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: Dimension.height8),
                  child: Container(
                    height: Dimension.height200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.height15),
                        color: Colors.purple),
                    child: Column(
                      children: [
                        GetText(text: list[index].date,size: Dimension.height18,),
                        SizedBox(
                          height: Dimension.height10
                        ),
                        FlagAndText(flagOne: list[index].flagOne, teamOne: list[index].teamOne, flagTwo: list[index].flagTwo, teamTwo: list[index].teamTwo,size: Dimension.height18,),
                        SizedBox(
                          //height: Dimension.height30,
                          height: Dimension.height30,
                        ),
                        GetText(text: list[index].venue,size: Dimension.height18,),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: Dimension.width100
                            ),
                            //width: Dimension.width100,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimension.height8), topLeft: Radius.circular(Dimension.height8))),
                            child: Center(
                                child: GetText(
                                    text: "Group ${list[index].group}",size: Dimension.height18, )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/ttwenty.json');
     //var assestBundle = DefaultAssetBundle.of(context);
    // var bundle = assestBundle.loadString('key');
    // var jsonData = json.decode(bundle);
    // var scheduleData =  jsonData['schedule'];
    final data = await json.decode(response);
    var localList = data['schedule'];
    list = List.generate(
        localList.length, (index) => ScheduleModel.fromJson(localList[index]));
    //await Future.delayed(Duration(seconds: 5));
    setState(() {});
  }
}
