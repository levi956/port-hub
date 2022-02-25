import 'package:flutter/material.dart';
import 'package:port_hub/utils/styles/color_constants.dart';

import '../navigation/navigation.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: white,
            iconSize: 20,
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              pop(context);
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Search',
              style: TextStyle(
                  color: white, fontSize: 14, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
