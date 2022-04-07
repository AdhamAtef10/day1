import 'package:day1/Enums/toast_state.dart';
import 'package:day1/bloc/register/register_cubit.dart';
import 'package:day1/core/compoents/custom_text_field.dart';
import 'package:day1/core/compoents/space.dart';
import 'package:day1/core/toast/toast.dart';
import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/core/utlis/size_config.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/sign_button.dart';
import '../home_screen/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state)
      {
        if(state is RegisterSuccessState)
          {
            AppNavigator.customNavigator(
                context: context,
                screen: HomeView(),
                finish: false,
            );
          }
      },
      builder: (context, state) {
        var registerCubit = RegisterCubit.get(context);
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const VerticalSpace(value: 5),
                    Container(
                      height: SizeConfig.defaultSize! * 20,
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
                    const Text(
                      'Please sign up to join us',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: nameController,
                      obscure: false,
                      hint: 'Full name',
                      prefix: Icons.assignment_ind_sharp,
                      sufixicon: null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: emailController,
                      obscure: false,
                      hint: 'Your Email',
                      prefix: Icons.mail_outline,
                      sufixicon: null,
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
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: passwordConfirmController,
                      obscure: _isObscure,
                      hint: 'Confirm Password',
                      prefix: Icons.lock,
                      sufixicon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.KPrimaryColor,
                        ),
                        onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                registerCubit.userRegister(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                              }
                              ToastConfig.showToast(
                                  msg: 'Registration Successfully',
                                  toastStates: ToastStates.Success);
                              AppNavigator.customNavigator(
                                  context: context,
                                  screen: LoginView(),
                                  finish: false);

                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                    if(state is RegisterLoadingState)
                      LinearProgressIndicator(),
                    const SizedBox(
                      height: 4,
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
                    const Text('Already have an account?'),


                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.KPrimaryColor,
                        ),
                        onPressed: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: const LoginView(),
                              finish: false);
                        },
                        child: const Center(child: Text('Login')),
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
