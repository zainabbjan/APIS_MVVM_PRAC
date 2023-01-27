import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_prac/res/components/round_button.dart';
import 'package:mvvm_prac/utills/routes/routes_name.dart';
import 'package:mvvm_prac/utills/utils.dart';
import 'package:mvvm_prac/view_model/auth_view_mdel.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                  //    FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: ((context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword.value,
                      focusNode: passwordFocusNode,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                          suffixIcon: InkWell(
                              onTap: (() {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              }),
                              child: Icon(_obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                    );
                  })),
              SizedBox(
                height: height * .05,
              ),
              RoundButton(
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please Enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please Enter your password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please Enter six digit password', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.SignUpApi(data, context);
                    print('api hit');
                  }
                },
                title: 'Sign Up',
              ),
              SizedBox(
                height: height * .05,
              ),
              InkWell(
                  onTap: (() {
                    Navigator.pushNamed(context, RoutesName.login);
                  }),
                  child: Text('Already have an account? Login'))
            ],
          ),
        ));
  }
}
