import 'package:astro_talk/src/core/colors.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/relatives_entity.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/profile_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';

class RelativeListView extends StatelessWidget {
  const RelativeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    TextStyle? _style =
        textTheme.headline2?.copyWith(color: AppColors.appBlueColor);
    ProfileManager _sate = Provider.of<ProfileManager>(context);
    TextStyle? _relativeTextStyle =
        textTheme.headline4?.copyWith(color: Colors.grey.shade700);
    List<AllRelatives> relatives =
        _sate.relativesEntity?.data.allRelatives ?? [];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Name",
                    style: _style,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text("DOB", style: _style),
                ),
                Expanded(
                  flex: 2,
                  child: Text("TOB", style: _style),
                ),
                Expanded(
                  flex: 2,
                  child: Text("Relation", style: _style),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          _sate.status == Status.LOADING
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var relative in relatives)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${relative.fullName}",
                                            maxLines: 1,
                                            style: _relativeTextStyle,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: FittedBox(
                                            child: Text(
                                              "${relative.birthDetails.dobDay}-${relative.birthDetails.dobMonth}-${relative.birthDetails.dobYear} ",
                                              style: _relativeTextStyle,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${relative.birthDetails.tobHour} : ${relative.birthDetails.tobMin}",
                                            style: _relativeTextStyle,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            " ${relative.relation}",
                                            style: _relativeTextStyle,
                                          ),
                                        ),
                                         Expanded(
                                          child: IconButton(
                                            onPressed: (){
                                              _sate.selectedRelative = relative;
                                              _sate.changeUserAction(UserAction.editProfile);
                                            },
                                            icon: const Icon(
                                              Icons.edit_outlined,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                         Expanded(
                                          child: IconButton(
                                            onPressed: (){
                                              _sate.uid = relative.uuid;
                                              // _sate.deleteRelative();
                                              _showDeleteWarning(context,_sate);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _showDeleteWarning(context,ProfileManager state){

    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel",style: TextStyle(
        color: Colors.white
      ),),
      onPressed:  () {
        Navigator.pop(context);
        state.uid = null;
      },
    );
    Widget launchButton = ElevatedButton(
      child: const Text("Yes",style: TextStyle(
        color: Colors.white
      ),),
      onPressed:  () {
        Navigator.pop(context);
        state.deleteRelative();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Are you sure you want to delete?"),
      actions: [
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
