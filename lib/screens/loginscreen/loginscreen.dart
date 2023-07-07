import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:projet_master/screens/homeScreen/homescreen.dart';
import 'package:projet_master/screens/splashscreen/splashscreen.dart';
import 'package:projet_master/services/authentification.dart';
import 'package:projet_master/shared/basicinput.dart';
import 'package:projet_master/shared/buttoncomponent.dart';
import 'package:projet_master/shared/passwordinput.dart';

import '../../services/storage_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 5,
            ),
            Center(
              child: Text(
                'Connexion',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: formKey,
                child: _form(),
              ),
            ),
            SizedBox(
              height: 46,
            ),

            SizedBox(
              height: 46,
            ),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          SizedBox(
            height: 13,
          ),
          BasicPhoneInputField(
            name: 'email',
            hintText: 'email',
            isPrefixIcon: true,
            prefixIconColor: Colors.black.withOpacity(0.5),
            initialValue: telephoneController,
          ),
          SizedBox(
            height: 24,
          ),
          Text('Mot de passe',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          SizedBox(
            height: 13,
          ),
          PasswordInputField(
            name: 'password',
            isPrefixIcon: true,
            prefixIconColor: Colors.black.withOpacity(0.5),
            initialValue: passwordController,
          ),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => Get.to(const SplashScreen()),
            child: Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(
            height: 46,
          ),
          BasicButtonComponent(
            text: 'Se connecter',
            backgroundColor: Color.fromARGB(255, 232, 225, 225),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                Authentification auth = Authentification();
                print("niania");
                bool resp = await auth.login(telephoneController.text,passwordController.text);
                print("niania 2");
                if(resp){
                  Get.offAll(HomeScreen(email: StorageService.getEmail(),));
                  Fluttertoast.showToast(
                      msg: "connexion avec succes",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.greenAccent,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }else{
                  print("mot de passe incorrect");
                  Fluttertoast.showToast(
                      msg: "identifiant invalide",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }

              } else {
                Fluttertoast.showToast(
                    msg: "Veillez remplir les champs",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            },
          ),
        ]);
  }
}
