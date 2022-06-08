import 'package:astro_talk/src/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/question_category_entity.dart';
import '../state_manager/home_manager.dart';

class HintQuestionWidget extends StatelessWidget {
  const HintQuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var _state = Provider.of<HomeManager>(context);
    List<String> data = _state.suggestionList;
    return  Column(
          children: [
            for(var text in data) Column(
              children: [
                ListTile(
                  onTap: ()=>_state.controller.text=text,
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.appOrangeColor,
                      ),
                      child: const Icon(Icons.question_mark,color: Colors.white,)),
                  title: Text(
                    "$text ?",
                    style: textTheme.headline4
                        ?.copyWith(fontSize: 14, color: Colors.black),
                  ),
                ),
                Divider(
                  endIndent: 4,indent: 4,
                  color: Colors.grey.shade400,
                  height: 2,
                  thickness: 0.5,
                ),
              ],
            )

      ],
    );
  }
}
