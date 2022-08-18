import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import '../../bloc/auth_bloc.dart';
import '../create_account_folder/create_account.dart';

class OtpScreen extends StatefulWidget {
  final String tel;
  const OtpScreen({Key? key, required this.tel}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(inject());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => _authBloc!,
        child: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, state) {
          if (state is ValidatedOtp) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const CreateAccountScreen()));
            // _telController.clear(); _passwordController.clear();
          }
        }, builder: (BuildContext context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: 200,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: PinCodeTextField(
                            appContext: context,
                            backgroundColor: Colors.transparent,
                            keyboardType: TextInputType.number,
                            length: 4,
                            textStyle: TextStyle(
                              fontSize: 40,
                              // color: BMColors.dark,
                              fontWeight: FontWeight.w700,
                            ),
                            obscureText: false,
                            // animationType: AnimationType.fade,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            // cursorColor: BMColors.grey,
                            cursorHeight: 20.0,
                            boxShadows: const [
                              BoxShadow(
                                // offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                fieldWidth: 76,
                                borderRadius: BorderRadius.circular(5),
                                borderWidth: 0.2,
                                activeFillColor: Colors.grey,
                                inactiveColor: Colors.grey,
                                activeColor: Colors.grey,
                                selectedFillColor: Colors.grey,
                                selectedColor: Colors.grey),
                            onChanged: (String value) {},
                            onCompleted: (val) {
                              // setState((){
                              //   code = val;
                              // });
                              _authBloc?.add(OtpEvent(otp: val));
                            },
                          ),
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
                            GestureDetector(
                              onTap: () {
                                _authBloc?.add(ResendOtpEvent());
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
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
                      ])
                ],
              )),
            ),
          );
        }));
  }
}
