import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "BACK",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Phone Verification",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Your OTP code",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: RichText(
                text: const TextSpan(
                    text:
                        'Enter your 4-digit code sent to you at +234 801 323 4930. ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'did you enter the correct number?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              )),
              const SizedBox(
                height: 40,
              ),
              Form(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 68,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 9),
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 68,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 9),
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 68,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 9),
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 68,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 9),
                                border: InputBorder.none,
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Resend Code in ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: '10 seconds',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  Card(
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
                  )
                ],
              )
            ])
          ],
        )),
      ),
    );
  }
}
