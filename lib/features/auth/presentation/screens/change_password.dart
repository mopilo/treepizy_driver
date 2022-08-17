import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treepizy_driver/core/injection/injection_container.dart';
import 'package:treepizy_driver/core/widgets/text_widget.dart';
import 'package:treepizy_driver/features/auth/data/model/change_password_model.dart';
import 'package:treepizy_driver/features/auth/presentation/widgets/back_widget.dart';

import '../bloc/auth_bloc.dart';
import 'complete_page.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  AuthBloc? authBloc;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(inject());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => authBloc!,
        child: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, state) {
              if (state is PasswordModified) {
                _telController.clear();
                _currentPasswordController.clear();
                _newPasswordController.clear();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CompletePage()));
              }
            },
            builder: (BuildContext context, state) => Scaffold(
                  body: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                       GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const BackWidget(title: 'BACK')),
                        SizedBox(height: 126),
                        
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 19),
                          child: TextWidget(
                            text: "Temporary password",
                            size: 12,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 19),
                            child: TextFormField(
                                // validator: validatePassword,
                                controller: _currentPasswordController,
                                obscureText: true)),
                        SizedBox(height: 41),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 19),
                          child: TextWidget(
                            text: "New password",
                            size: 12,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 19),
                            child: TextFormField(
                                // validator: validatePassword,
                                controller: _newPasswordController,
                                obscureText: true)),
                        SizedBox(height: 41),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 19),
                          child: TextWidget(
                            text: "Confirm password",
                            size: 12,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 19),
                            child: TextFormField(
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'Empty';
                                  }
                                  if (val != _newPasswordController.text) {
                                    return 'Not Match';
                                  }
                                  return null;
                                },
                                controller: _confirmPasswordController,
                                obscureText: true)),
                        SizedBox(height: 77),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 19),
                            width: double.infinity,
                            height: 45,
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        text: state is Loading
                                            ? "Loading..."
                                            : "Continue",
                                        size: 12,
                                        appcolor: Colors.white,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.east_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    authBloc?.add(ChangePasswordEvent(changePasswordModel: ChangePasswordModel(
                                        _newPasswordController.text,
                                        _currentPasswordController.text
                                        )));
                                  }
                                })),
                        if (state is Error)
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 19, vertical: 10),
                            child: TextWidget(
                              text: state.error.toString(),
                              size: 14,
                              appcolor: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                )));
  }
}
