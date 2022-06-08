import 'package:flutter/material.dart';

class MyProfileTogglesButton extends StatelessWidget {
  const MyProfileTogglesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: null,
                child: const Text("Basic profile"))),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange)),
                onPressed: null,
                child: const Text(
                  "Friends and family",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }
}
