import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/profile_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/add_relative_form.dart';

class AddProfile extends StatelessWidget {
  final bool isEdit;
  const AddProfile({Key? key,this.isEdit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileManager _state = Provider.of<ProfileManager>(context);
    if(isEdit){
      _state.populateRelativeInfo();
    }
    var textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => _state.changeUserAction(UserAction.none),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                isEdit?"Update Profile":"Add Profile",
                style: textTheme.headline4?.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Flexible(
            child: SizedBox(
              child: SingleChildScrollView(
                child: AddRelativeForm(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  bool? validate =_state.formKey.currentState?.validate();
                  if(validate==true){
                    if(isEdit){
                      _state.updateProfile();
                    }else{
                      _state.addProfile();
                    }
                  }
                },
                child: Text(
                  isEdit?"Update":"Add new Profile",
                  style: textTheme.headline4,
                )),
          ),
        ],
      ),
    );
  }
}
