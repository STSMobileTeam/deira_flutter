import 'package:deira_flutter/Helper/Colors.dart';
import 'package:deira_flutter/View/bloc/loginscreenbloc/login_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/size_config.dart';
import '../../Helper/utilities.dart';
import '../../router.dart';
import '../widgets/customtext.dart';
import '../widgets/customtextfield.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _LoginState();
}

class _LoginState extends State<MyLogin> {
  final _loginFormKey = GlobalKey<FormState>();
  late LoginScreenBloc bloc;
  bool passwordToggle = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<LoginScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginScreenBloc, LoginScreenState>(
        bloc: bloc,
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginScreenBlocLoadingFinishedState) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
          }
        },
        child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: SizeConfig.blockSizeVertical! * 100,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/logo_new.svg',
                          width: 50.0,
                          height: 50.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 6,
                    ),
                    const CustomText(
                      text: 'Sign In',
                      size: 22,
                      weight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 0.5,
                    ),
                    Container(
                      margin:
                          new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 3.5,
                      width: SizeConfig.blockSizeHorizontal! * 10,
                      color: secondary_blue,
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 4,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: 'Email Address', size: 14),
                          const SizedBox(
                            height: gapTextToTextField,
                          ),
                          CustomTextField(
                            controller: bloc.usernameController,
                            keyboardType: TextInputType.emailAddress,
                            makeCaps: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email ID!";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please Enter Correct Email ID";
                              }
                            },
                            hintText: 'Enter your mail address',
                            prefixIcon: const Icon(
                              Icons.mail_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            height: gapTextFieldToText,
                          ),
                          const CustomText(text: 'Password', size: 14),
                          const SizedBox(
                            height: gapTextToTextField,
                          ),
                          CustomTextField(
                            controller: bloc.passwordController,
                            maxLines: 1,
                            makeCaps: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password!";
                              }
                            },
                            hintText: "Enter Your Password",
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: Colors.blue,
                            ),
                            sufixIcon: IconButton(
                              icon: Icon(
                                passwordToggle
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye,
                                color: const Color(0xff7C7C7C),
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordToggle = !passwordToggle;
                                });
                              },
                            ),
                            obscureText: passwordToggle,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 14, color: primary_blue),
                                ),
                              ),
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, AppRoutes.forgotpassScreen);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              minWidth: SizeConfig.blockSizeHorizontal! * 80,
                              height: SizeConfig.blockSizeVertical! * 7,
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 14, bottom: 14),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 20),
                              ),
                              color: primary_blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  bloc.add(LoginScreenBlocLoadingEvent());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          height: 3,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2,
                        ),
                        Text(
                          "Or Sign in with",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            minWidth: SizeConfig.blockSizeHorizontal! * 80,
                            height: SizeConfig.blockSizeVertical! * 7,
                            padding: EdgeInsets.only(
                                left: 30, right: 30, top: 14, bottom: 14),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/google.svg',
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal! * 2,
                                  ),
                                  const Text(
                                    'Sign in with Goolge',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            color: Colors.white,
                            textColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              if (_loginFormKey.currentState!.validate()) {
                                //bloc.add(LoginScreenBlocLoadingEvent());
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Don't have an account",
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 2,
                            ),
                            CustomText(
                              text: 'Click Here',
                              color: primary_blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
