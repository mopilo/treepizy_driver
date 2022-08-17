import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/vehicle_folder/vehicle_setting_screen.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/welcome_back/login.dart';
import 'package:treepizy_driver/features/profile/profile.dart';
import 'package:treepizy_driver/features/utils/color.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuDrawerState();
}

class MenuDrawerState extends State<MenuDrawer> {
  @override
  void initState() {
    super.initState();
    // getProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: 330,
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 40),
          Container(
            height: 100.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Good Morning",
                      size: 12,
                      weight: FontWeight.w500,
                      appcolor: Colors.black,
                    ),
                    const TextWidget(
                      text: "",
                      size: 24.0,
                      appcolor: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color(0xffc8d8f8),
          ),
          Column(
            children: [
              ListTile(
                  title: const TextWidget(
                      text: 'Payment', size: 24, appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);

                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => Appointments(user: widget.user)));
                  }),
              ListTile(
                  // leading: new Icon(BookMe.icon_awesome_chart_area, color: Color(0xffc8d8f8), size: 15),
                  title: const TextWidget(
                      text: 'My Trips', size: 24, appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Container()));
                  }),
              ListTile(
                  // leading: new Icon(Icons.person, color: Color(0xffc8d8f8)),
                  title: const TextWidget(
                      text: 'Profile', size: 24, appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Profile()));
                  }),
                   ListTile(
                  // leading: new Icon(Icons.person, color: Color(0xffc8d8f8)),
                  title: const TextWidget(
                      text: 'Settings', size: 24, appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VehicleSettingsScreen()));
                  }),
              ListTile(
                  // leading: new Icon(Icons.person, color: Color(0xffc8d8f8)),
                  title: const TextWidget(
                      text: 'Refer & Earn',
                      size: 24,
                      appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Accounts(user: widget.user)));
                  }),
              ListTile(
                  // leading: const Icon(Icons.remove,
                  //     color: Color(0xffc8d8f8), size: 16),
                  title: const TextWidget(
                      text: 'Support',
                      weight: FontWeight.w500,
                      size: 24,
                      appcolor: Colors.black),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Ticket(user: widget.user))
                    // );
                  }),
            ],
          ),
          Expanded(child: Container()),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            const Text('Do you want to exit this application?'),
                        content: const Text('We hate to see you leave...'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              // await AuthService().logout();
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const WelcomeBackScreen();
                                  },
                                ),
                                (_) => false,
                              );
                              // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    });
              },
              child: const TextWidget(
                  text: 'Logout',
                  size: 24,
                  weight: FontWeight.bold,
                  appcolor: Colors.red),
            ),
          ),
          const Divider(
            thickness: 4,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                    text: 'Do more', size: 12, appcolor: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const TextWidget(
                    text: 'Get food delivery',
                    size: 12,
                    appcolor: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const TextWidget(
                    text: 'Make money driving',
                    size: 12,
                    appcolor: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const TextWidget(
                    text: 'Rate us', size: 12, appcolor: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const TextWidget(
                    text: 'trerpizy.io', size: 12, appcolor: Colors.black)
              ],
            ),
          )
        ],
      )),
    );
  }
}
