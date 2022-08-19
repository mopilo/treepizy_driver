import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import 'package:treepizy_driver/core/widgets/button_widget.dart';
import 'package:treepizy_driver/core/widgets/text_form_field.dart';
import 'package:treepizy_driver/features/auth/data/model/login_model.dart';
import 'package:treepizy_driver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/create_account_folder/create_account.dart';
import 'package:treepizy_driver/features/home/home.dart';

import 'sign_up.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
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
                    context, MaterialPageRoute(builder: (_) => const Home()));
                // _telController.clear(); _passwordController.clear();
              }
            }, builder: (BuildContext context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
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
                              width: 5,
                            ),
                            Text(
                              "WELCOME",
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
                            "WELCOME BACK!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
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
                          const Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ButtonWidget(
                                onTap: () {
                                  _authBloc?.add(LoginButtonPressed(
                                      loginModel: LoginModel(
                                          "234${telController.text}",
                                          passController.text)));
                                },
                                isIcon: true,
                                color: Colors.black,
                                colorText: Colors.white,
                                buttonText: state is LoginLoading
                                    ? "Loading..."
                                    : 'Login',
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccountScreen()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 33.0),
                                  child: Text(
                                    "Or Create My Account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })));
  }
}
