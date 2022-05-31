import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:t_twenty/utils/dimension.dart';
import 'package:t_twenty/widgets/text.dart';

import '../utils/venue_model.dart';

class VenueScreen extends StatefulWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    //  print(screenHeight);
    // print(screenWidth);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Venues"),
      ),
      body: FutureBuilder<List<VenueModel>>(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:  EdgeInsets.only(left: Dimension.width10,right: Dimension.width10 ,top: Dimension.height10),
                  height: Dimension.height300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimension.height20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: Dimension.height15, ),
                      GetText(text: 'country: ${snapshot.data![index].country}',color: Colors.black,),
                      SizedBox(height: Dimension.height15, ),
                      GetText(text: 'city: ${snapshot.data![index].city}',color: Colors.black,),
                      SizedBox(height: Dimension.height15),
                      GetText(text: snapshot.data![index].stadium,color: Colors.black,),
                      SizedBox(height: Dimension.height15,),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimension.height10),
                          child: Image.asset(snapshot.data![index].image,fit: BoxFit.cover,width: double.infinity,),
                        ),
                      )
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

  Future<List<VenueModel>> readJson() async {
    var list = <VenueModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var jsonFile = await assetBundle.loadString('assets/data/ttwenty.json');
    var decodedData =  json.decode(jsonFile);
    var venueData = decodedData['venues'];
    for (var map in venueData) {
      var venueModel = VenueModel.fromJson(map);
      list.add(venueModel);
    }
    return list;
  }
}
