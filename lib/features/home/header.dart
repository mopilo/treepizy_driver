import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final Function()? drawerClick;

  Header({Key? key, this.drawerClick}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => drawerClick!(),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 40,
          ),
        ),
        Image.asset("assets/logo.png"),
        GestureDetector(
            onTap: () {
              // _homeProvider?.getRatings();
            },
            child: const CircleAvatar())
      ],
    );
  }
}
