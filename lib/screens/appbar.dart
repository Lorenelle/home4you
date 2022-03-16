import 'package:flutter/material.dart';
import 'package:home4you/constant.dart';

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          left: appPadding, right: appPadding, top: appPadding * 2),
      child: SizedBox(
        height: size.height * 0.22,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.settings),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
