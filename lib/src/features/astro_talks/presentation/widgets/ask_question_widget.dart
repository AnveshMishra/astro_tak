import 'package:astro_talk/src/core/constants.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/home_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'select_category_bottom_sheet.dart';

class AskQuestion extends StatelessWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var _state = Provider.of<HomeManager>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chose Category",
          style: textTheme.headline3?.copyWith(color: Colors.black),
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (_) {
                return SelectCategoryBottomSheet(
                  provider: _state,
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    _state.category,
                    style: textTheme.headline3
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                  const Spacer(),
                  _getDropDownIcon(_state),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: _state.controller,
          maxLines: 4,
          maxLength: 150,
          decoration: InputDecoration(
            hintText: "Type question here...",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDropDownIcon(HomeManager provider) {
    Status status = provider.status;
    switch (status) {
      case Status.LOADING:
        return const CupertinoActivityIndicator();
      case Status.COMPLETED:
        return const Icon(Icons.arrow_drop_down_sharp);
      default:
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
    }
  }
}
