
import 'package:astro_talk/src/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state_manager/home_manager.dart';

class AskNowPrompt extends StatelessWidget {
  const AskNowPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = Provider.of<HomeManager>(context);
    var textTheme = Theme.of(context).textTheme;
    return Visibility(
      visible: _state.price!=null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          color: AppColors.appBlueColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(" Rs.150 (1 Question on ${_state.category})",
            style: textTheme.headline4,),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8,right: 4),
              child: SizedBox(
                // width: 120,
                height:24,
                child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      "Ask Now",
                      style: textTheme.headline1
                          ?.copyWith(fontSize: 12, color: AppColors.appBlueColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
