import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:news_app/controller/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:news_app/widget/custom_button.dart';
import 'package:news_app/widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirm_passCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController user_nameCtrl = TextEditingController();
  AuthController _authCtrl = AuthController();

  Future<void> _handleRegister() async {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));
      Response<dynamic> res = await _authCtrl.registerUser(
        emailCtrl.text,
        passCtrl.text,
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res.statusCode} - ${res.statusMessage}}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: user_nameCtrl,
                        validator: RequiredValidator(errorText: "Required"),
                        label: "Username",
                        icon: const Icon(
                          Icons.person,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: emailCtrl,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(errorText: "Enter a valid email*"),
                        ]),
                        label: "Email",
                        icon: const Icon(
                          Icons.email,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: passCtrl,
                        obscureText: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          LengthRangeValidator(
                              min: 5,
                              max: 10,
                              errorText: "Password length should be 5-10"),
                        ]),
                        label: "Password",
                        icon: const Icon(
                          Icons.password,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: confirm_passCtrl,
                        obscureText: true,
                        validator: (value) {
                          if (value != passCtrl.value.text) {
                            return "Enter same Password";
                          }
                          return null;
                        },
                        label: "Confirm Password",
                        icon: const Icon(
                          Icons.password,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Register',
                        onPressed: _handleRegister,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 60, 28, 202),
                                ),
                              ))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
