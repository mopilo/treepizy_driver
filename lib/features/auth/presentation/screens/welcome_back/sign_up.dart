import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/text_form_field.dart';
import 'package:treepizy_driver/features/auth/data/model/login_model.dart';
import 'package:treepizy_driver/features/auth/presentation/bloc/auth_bloc.dart';

import '../otp_folder/otp_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController telController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(inject());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<AuthBloc>(
            create: (context) => _authBloc!,
            child: BlocConsumer<AuthBloc, AuthState>(
                listener: (BuildContext context, state) {
              if (state is AuthSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OtpScreen(tel: telController.text)));
                // _telController.clear(); _passwordController.clear();
              }
            }, builder: (BuildContext context, state) {
              return SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                size: 25,
                              ),
                              SizedBox(
                                width: 15,
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
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hello",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Welcome to Treepizy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "Phone number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            EditTextForm(
                              controller: telController,
                              readOnly: false,
                              label: '+234',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            EditTextForm(
                              controller: passController,
                              readOnly: false,
                              label: 'Password',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: RichText(
                              text: const TextSpan(
                                  text:
                                      'By creating and account, you agree to our ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]),
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonWidget(
                              onTap: () {
                                _authBloc?.add(Register(
                                        loginModel: LoginModel(
                                           "234${telController.text}",
                                            passController.text)));
                              },
                              isIcon: true,
                              elevation: 3,
                              color: Colors.black,
                              fontSize: 16,
                              colorText: Colors.white,
                              buttonText: state is Loading
                                    ? "Creating Account..."
                                    : "Creating Account",
                            ),
                          ],
                        )
                      ])));
            })));
  }
}
