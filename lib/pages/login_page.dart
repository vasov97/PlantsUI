import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/widgets/custom_container.dart';
import 'package:plants_ui/widgets/remember_me_row.dart';
import 'package:plants_ui/widgets/rounded_button.dart';
import 'package:plants_ui/widgets/rounded_icon_button.dart';
import 'package:plants_ui/widgets/rounded_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const CustomContainer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RoundedIconButton(
                    size: 40,
                    onPressed: () => Navigator.pop(context),
                    color: AppColors.lightGreen,
                    iconColor: AppColors.iconsGreen,
                    icon: Icons.arrow_back_ios,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: AppColors.iconsGreen,
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          color: AppColors.appGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RoundedTextField(
                controller: emailController,
                icon: Icons.person,
                hintText: 'Full Name',
                color: AppColors.lightGreen,
                iconColor: AppColors.iconsGreen,
                inputType: TextInputType.text,
              ),
            ),
            RoundedTextField(
              controller: passwordController,
              icon: Icons.lock,
              hintText: 'Password',
              color: AppColors.lightGreen,
              iconColor: AppColors.iconsGreen,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: RememberMeRow(),
            ),
            const Spacer(),
            SizedBox(
              width: screenWidth * 0.7,
              child: RoundedButton(
                onPressed: () => Navigator.pushNamed(context, '/my-main-page'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 3.0),
                    child: Text(
                      'Don\'t have an account?',
                      style:
                          TextStyle(fontSize: 16.0, color: AppColors.appGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.iconsGreen,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
