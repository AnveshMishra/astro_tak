import 'package:astro_talk/src/core/colors.dart';
import 'package:flutter/material.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8,top: 4,bottom: 4),
      width: MediaQuery.of(context).size.width,
      color: AppColors.appBlueColor,
      child: Row(
        children: [
          Text(
            "Wallet Balance : Rs. 0",
            style: textTheme.headline3,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
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
                    "Add Money",
                    style: textTheme.headline1
                        ?.copyWith(fontSize: 12, color: AppColors.appBlueColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
