import 'package:astro_talk/src/core/colors.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/profile_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRelativeForm extends StatelessWidget {
  const AddRelativeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ProfileManager manager = Provider.of<ProfileManager>(context);
    return Form(
      key: manager.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: theme.textTheme.headline5,
            ),
            TextFormField(
              controller: manager.nameController,
              validator: _validator,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Date of Birth",
              style: theme.textTheme.headline5,
            ),
            Row(
              children: [
                Flexible(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  controller: manager.dayOBController,
                  validator: _validator,
                )),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  controller: manager.monthOBController,
                  validator: _validator,
                )),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  controller: manager.yearOBController,
                  validator: _validator,
                )),
              ],
            ),
            Text(
              "Time of Birth",
              style: theme.textTheme.headline5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: TextFormField(
                  controller: manager.hourTimeOfBirthController,
                  validator: _validator,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                )),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    child: TextFormField(
                  controller: manager.minuteTimeOfBirthController,
                  validator: _validator,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                )),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: theme.elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            manager.meridiem == "AM"
                                ? AppColors.appBlueColor
                                : Colors.white)),
                    onPressed: () {
                      manager.toggleMeridiem();
                    },
                    child: const Text("AM"),
                  ),
                ),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: theme.elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            manager.meridiem == "AM"
                                ? Colors.white
                                : AppColors.appBlueColor)),
                    onPressed: () {
                      manager.toggleMeridiem();
                    },
                    child: const Text("PM"),
                  ),
                ),
              ],
            ),
            Text(
              "Place of Birth",
              style: theme.textTheme.headline5,
            ),
            TextFormField(
              controller: manager.placeOfBirthController,
              validator: _validator,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: theme.textTheme.headline5,
                      ),
                      DropdownButtonFormField(
                        value: manager.selectGender,
                        onChanged: (String? value) {
                          manager.selectGender = value;
                        },
                        items: dropdownItems,
                        validator: (value) {
                          print(manager
                              .relativesEntity?.data.allRelatives.length);
                          if (manager.selectGender == null ||
                              (manager.selectGender?.isEmpty ?? false)) {
                            return "This is Required field";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Relation",
                        style: theme.textTheme.headline5,
                      ),
                      TextFormField(
                        controller: manager.relationController,
                        validator: _validator,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("MALE"), value: "MALE"),
      const DropdownMenuItem(child: Text("FEMALE"), value: "FEMALE"),
    ];
    return menuItems;
  }

  String? _validator(String? value) {
    if (value != null && value.isEmpty) {
      return "This is required field";
    } else {
      return null;
    }
  }
}
