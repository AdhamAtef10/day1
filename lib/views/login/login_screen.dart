import 'dart:ffi';

import 'package:day1/Enums/toast_state.dart';
import 'package:day1/bloc/login/login_cubit.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/toast/toast.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/core/utlis/time_config.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/forgt_password/forget_password.dart';
import 'package:day1/views/home_screen/home_view.dart';
import 'package:day1/views/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/sign_button.dart';
import '../../core/compoents/custom_text_field.dart';
import '../../core/utlis/size_config.dart';

class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isObscure = true;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState)
        {
          AppNavigator.customNavigator(
            context: context,
            screen: HomeView(),
            finish: false,
          );
        }
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const VerticalSpace(value: 5),
                    Container(
                      height: SizeConfig.defaultSize! * 25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.KPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please login to your account',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: emailController,
                      obscure: false,
                      sufixicon: null,
                      hint: 'Your Email',
                      prefix: Icons.mail,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      obscure: _isObscure,
                      hint: 'Your Password',
                      prefix: Icons.lock,
                      sufixicon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: const ForgetPassword(),
                              finish: false);
                        },
                        child: const Text(
                          'Forget Password?',
                        )),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.KPrimaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginCubit.userLogin(
                                emailController.text,
                                passwordController.text);
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    if(state is LoginLoadingState)
                      LinearProgressIndicator(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInButton.mini(
                            buttonType: ButtonType.facebook,
                            onPressed: () {},
                          ),
                          SignInButton.mini(
                            buttonType: ButtonType.google,
                            onPressed: () {},
                          ),
                          SignInButton.mini(
                            buttonType: ButtonType.twitter,
                            onPressed: () {},
                          ),
                          SignInButton.mini(
                            buttonType: ButtonType.mail,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Don"t have account?'),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.KPrimaryColor,
                        ),
                        onPressed: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: const RegisterView(),
                              finish: false);
                        },
                        child: const Center(child: Text('Sign Up')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
