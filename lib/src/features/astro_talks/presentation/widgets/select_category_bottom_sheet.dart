import 'package:astro_talk/src/features/astro_talks/domain/entities/question_category_entity.dart';
import 'package:flutter/material.dart';

import '../state_manager/home_manager.dart';

class SelectCategoryBottomSheet extends StatefulWidget {
  final HomeManager provider;

  const SelectCategoryBottomSheet({Key? key, required this.provider})
      : super(key: key);

  @override
  State<SelectCategoryBottomSheet> createState() =>
      _SelectCategoryBottomSheetState();
}

class _SelectCategoryBottomSheetState extends State<SelectCategoryBottomSheet> {
  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(children: [
      const SizedBox(
        height: 4,
      ),
      Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade400),
      ),
      const SizedBox(
        height: 16,
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "Choose category",
            style: textTheme.headline1
                ?.copyWith(color: Colors.grey.shade800, fontSize: 18),
          ),
        ),
      ),
      Divider(
        endIndent: 16,
        indent: 16,
        color: Colors.grey.shade300,
        thickness: 1.5,
      ),
      Expanded(
          child: SizedBox(
        child: ListView.builder(
          itemBuilder: (_, index) {
            List<Data> data = widget.provider.categoryEntity?.data ?? [];
            return ListTile(
              onTap: (){
                widget.provider.setCategory(data[index].name);
                widget.provider.setPrice(data[index].price);
                widget.provider.setSuggestion(data[index].suggestions);
                setState(() {
                });
                Navigator.pop(context);
              },
              title: Text(data[index].name),
              subtitle: Text("\u{20B9} ${data[index].price}"),
              trailing: (data[index].name == widget.provider.category)
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const SizedBox(),
            );
          },
          itemCount: widget.provider.categoryEntity?.data.length ?? 0,
        ),
      ))
    ]);
  }
}
