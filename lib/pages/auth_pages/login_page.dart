import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:student_app/components/custom_textfield.dart';
import 'package:student_app/components/major_button.dart';
import 'package:student_app/components/password_field.dart';
import 'package:student_app/components/responsive_font.dart';
import 'package:student_app/components/text_button.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/controllers/auth_controller.dart';
import 'package:student_app/routes/paths.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController _controller = Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: getScreenSize(context).width * .9,
            height: getScreenSize(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //top gap
                SizedBox(height: getScreenSize(context).height * .17),

                //header
                SizedBox(
                  height: getScreenSize(context).height * .04,
                  width: getScreenSize(context).width,
                  child: const ResPonsiveFontRow(
                    text: 'Welcome Back!',
                    leftMargin: 2,
                    rightMargin: 2,
                  ),
                ),

                //description
                SizedBox(
                  height: getScreenSize(context).height * .04,
                  child: ResPonsiveFontRow(
                    text: 'Please enter your account here',
                    leftMargin: 2,
                    rightMargin: 2,
                    fontColor: kh3(),
                    fontWeight: FontWeight.normal,
                  ),
                ),

                //gap
                SizedBox(height: getScreenSize(context).height * .04),
                //---------------------------form
                Column(
                  children: [
                    //------------user mail
                    EmailField(
                      textController: _controller.emaillogin,
                      hint: "Email or phone number",
                      prefix: Icons.mail_outline,
                    ),

                    //------------------gap
                    SizedBox(height: getScreenSize(context).height * .02),

                    //--------------------password
                    PasswordField(
                      textController: _controller.passwordLogin,
                      hint: "Password",
                      prefix: Icons.lock_outline,
                    ),

                    //----------------gap
                    const SizedBox(height: 10),

                    //---------------------------- text button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextBtn(
                          text: "Forgot password?",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                //------ gap
                SizedBox(height: getScreenSize(context).height * .05),
                Column(
                  children: [
                    //-----------------Login button
                    MajorButton(
                      text: "Login",
                      onTap: () async {
                        Logger().i("Email---${_controller.emaillogin.text}");
                        Logger().i("Email---${_controller.passwordLogin.text}");

                        await _controller.login();
                      },
                    ),

                    //-------------gap
                    SizedBox(height: getScreenSize(context).width * .04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have any account?",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: kh1(),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextBtn(
                          text: "Sign Up",
                          textColor: kbuttonPrimer(),
                          onTap: () {
                            Get.toNamed(Routes.registration);
                          },
                        ),
                      ],
                    )
                  ],
                ),
                //------------------------ buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}
