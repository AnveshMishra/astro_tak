import 'package:astro_talk/injector.dart';
import 'package:astro_talk/src/core/colors.dart';
import 'package:astro_talk/src/core/common_utils.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/profile_manager.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/ask_now_promt_widget.dart';
import '../widgets/ask_question_info_widget.dart';
import '../widgets/ask_question_widget.dart';
import '../widgets/hint_question_widgets.dart';
import '../widgets/info_text_widgets.dart';
import '../widgets/wallent_balance_widget.dart';

class AstroTalksHomePage extends StatelessWidget {
  const AstroTalksHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 36.0),
        child: FloatingActionButton(
          child: Icon(Icons.horizontal_split),
          backgroundColor: Colors.orange,
          onPressed: null,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider<ProfileManager>(
                            create: (_) => ProfileManager(injector(),
                                injector(), injector(), injector(), injector()),
                          )
                        ],
                        child: const ProfilePage(),
                      ),
                    ),
                  ),
              icon: Icon(
                Icons.account_circle_outlined,
                color: AppColors.appOrangeColor,
              ))
        ],
        leading: Icon(
          Icons.horizontal_split,
          color: AppColors.appOrangeColor,
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: 50,
            child: CommonUtils.getAssetImage("icon"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const WalletBalanceWidget(),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: const [
                  AskQuestionInfo(),
                  SizedBox(
                    height: 4,
                  ),
                  AskQuestion(),
                  SizedBox(
                    height: 8,
                  ),
                  HintQuestionWidget(),
                  SizedBox(
                    height: 8,
                  ),
                  InfoText(),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          const AskNowPrompt(),
        ],
      ),
    );
  }
}
