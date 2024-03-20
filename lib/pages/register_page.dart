import 'package:flutter/material.dart';
import 'package:plants_ui/colors.dart';
import 'package:plants_ui/widgets/remember_me_row.dart';
import 'package:plants_ui/widgets/rounded_button.dart';
import 'package:plants_ui/widgets/rounded_icon_button.dart';
import 'package:plants_ui/widgets/rounded_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RoundedIconButton(
                      size: 40,
                      onPressed: () => Navigator.pop(context),
                      color: AppColors.lightGreen,
                      iconColor: AppColors.iconsGreen,
                      icon: Icons.arrow_back_ios,
                    ),
                  ],
                ),
              ),
              const Text(
                'Register',
                style: TextStyle(
                  color: AppColors.iconsGreen,
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Create your new account',
                style: TextStyle(
                  color: AppColors.appGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
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
                controller: emailController,
                icon: Icons.person,
                hintText: 'user@mail.com',
                color: AppColors.lightGreen,
                iconColor: AppColors.iconsGreen,
                inputType: TextInputType.emailAddress,
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
              SizedBox(
                width: screenWidth * 0.7,
                child: RoundedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/my-main-page'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: RememberMeRow(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: AppColors.appGrey,
                        height: 1.5,
                        width: screenWidth * 0.25,
                      ),
                    ),
                    const Text(
                      'Or continue with?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: AppColors.appGrey,
                        height: 1.5,
                        width: screenWidth * 0.25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.017),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/facebook.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/google.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/apple.png'), // Replace 'image.jpg' with your image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, top: screenHeight * 0.14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Text(
                        'Already have an account?',
                        style:
                            TextStyle(fontSize: 16.0, color: AppColors.appGrey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/login-page'),
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
      ),
    );
  }
}
