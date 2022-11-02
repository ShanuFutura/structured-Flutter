import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:model_sample/Constants/constants.dart';
import 'package:model_sample/Models/user_class.dart';
import 'package:model_sample/services/services.dart';

import '../Widgets/user_tile.dart';

class UserListScreen extends StatelessWidget {
   UserListScreen({super.key});

  List<UserClass> user=[];

getData()async{
  Response res=await get(Uri.parse(Constants.baseUrl+'users?page=2'));
  List<Map<String,dynamic>> data= jsonDecode(res.body)['data'];
user= data.map((e) => UserClass.fromJson(e)).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Services.getData('users?page=2'),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return UserTile(
                    imageUrl: user[index].avatar,
                    name: snap.data!['data'][index]['first_name'],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );  
            }
          }),
    );
  }
}