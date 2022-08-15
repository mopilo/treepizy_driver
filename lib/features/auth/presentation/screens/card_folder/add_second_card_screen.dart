import 'package:flutter/material.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/vehicle_folder/vehicle_info_screen.dart';
import 'package:treepizy_driver/features/utils/color.dart';

class AddSecondCardScreen extends StatelessWidget {
  const AddSecondCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "BACK",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            color: AppColors.darkGrey,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '5683 9334 4894 3438',
                    style: TextStyle(fontSize: 20, color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'MONTH/YEAR',
                            style:
                                TextStyle(fontSize: 10, color: AppColors.white),
                          ),
                          Text(
                            '12/22',
                            style:
                                TextStyle(fontSize: 14, color: AppColors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'CVC2/CVV2',
                            style:
                                TextStyle(fontSize: 10, color: AppColors.white),
                          ),
                          Text(
                            'XXX',
                            style:
                                TextStyle(fontSize: 14, color: AppColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'MR OLADEJI YUSUF',
                    style: TextStyle(fontSize: 14, color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: RichText(
            text: const TextSpan(
                text:
                    'By continuing, I confirm that i have read & agree to the ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                      text: ' and ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ))
                ]),
          )),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Text(
                'Remove Credit Card',
                style: TextStyle(color: AppColors.black, fontSize: 15),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VehicleInfoScreen())),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          )
        ])),
      ),
    );
    ;
  }
}
