import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTittles extends StatelessWidget {
  final String title,subtitle;
  const TopTittles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
              height: kToolbarHeight + 12,
            ),
          if(title=="Login" || title =="Create Account") 
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios)
            ),
          // BackButton(),
          // CupertinoButton(
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
              
          //   },
          //   child: Icon(
          //     Icons.arrow_back,
          //     size: 35,
          //   ),
          // ),
         SizedBox(
              height: 12.0,
            ),
            Text(title,style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 10,
            ),
            Text(subtitle,
            style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            ),),
      ],
    );
  }
}