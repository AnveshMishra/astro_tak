import 'package:astro_talk/src/core/constants.dart';
import 'package:flutter/material.dart';

class AskQuestionInfo extends StatelessWidget {
  const AskQuestionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ask a Question",
            style: textTheme.headline3?.copyWith(color: Colors.black),
          ),
          Text(
            Constants.askQuestionDescription,
            style: textTheme.headline4?.copyWith(color: Colors.black,fontSize: 14),
          ),
        ],
      ),
    );
  }
}
