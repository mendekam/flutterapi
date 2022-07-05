import 'dart:convert';

import 'package:flutterapi/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Phone> allData = [];
  _getPhoneData() async {
    try {
      var response = await get(Uri.parse("https://api-mobilespecs.azharimm.site/v2/brands"));
      print(response.body);
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      //print(data);
      data.forEach((element) {
        allData.add(Phone.fromJson(element));
      });

      print(allData.length);

    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Brand Handphone"),
      ),
      body: FutureBuilder(
          future: _getPhoneData(),
          builder: ((context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(allData[index].brand_name),
                  subtitle: Text("Jumlah Seri Model : ${allData[index].device_count}"),
                ),
              );
            }
          })),
    );
  }
}