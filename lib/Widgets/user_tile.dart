
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
   UserTile({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);
String imageUrl;
    String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
          Text(
            name,
          ),
        ],
      ),
    );
  }
}
