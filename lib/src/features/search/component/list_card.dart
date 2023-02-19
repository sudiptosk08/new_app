import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/src/features/search/model/search_model.dart';
import 'package:new_app/style/kColors.dart';
import 'package:new_app/style/kSize.dart';
import 'package:new_app/style/kTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListCard extends StatefulWidget {
  final Results results;

  ListCard({required this.results, super.key});

  @override
  State<ListCard> createState() => _CardState();
}

class _CardState extends State<ListCard> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: KSize.getWidth(context, 360),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: KColor.baseGrey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text.rich(
                maxLines: 1,
                textAlign: TextAlign.left,
                TextSpan(
                  text: widget.results.text ,
                  style: KTextStyle.bodyText2.copyWith(color: KColor.black),
                ),
              
            ),
          ],
        ),
      ),
    );
  }
}
