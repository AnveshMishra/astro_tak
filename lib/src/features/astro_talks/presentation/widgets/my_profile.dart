import 'package:astro_talk/src/features/astro_talks/presentation/widgets/wallent_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state_manager/profile_manager.dart';
import '../views/add_profile.dart';
import 'profile_views_toggle_buttons.dart';
import 'relative_list_view.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    ProfileManager _sate = Provider.of<ProfileManager>(context);
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        const MyProfileTogglesButton(),
        const WalletBalanceWidget(),
        const SizedBox(
          height: 8,
        ),
        _getWidgetAccordingUserAction(_sate,textTheme),
      ],
    );
  }

  Widget _getWidgetAccordingUserAction(ProfileManager state,textTheme) {
    UserAction action = state.action;
    switch (action) {
      case UserAction.none:
        return Expanded(
          child: Column(
            children: [
              const Expanded(
                  child: SizedBox(
                child: RelativeListView(),
              )),
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      state.changeUserAction(UserAction.addProfile);
                    },
                    child: Text(
                      "Add new Profile",
                      style: textTheme.headline4,
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      case UserAction.addProfile:
        return AddProfile();
      default:
        return AddProfile(isEdit: true,);
    }
  }
}
