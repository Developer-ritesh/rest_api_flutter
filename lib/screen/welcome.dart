// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:rest_api/controller/signup_controller.dart';
import 'package:rest_api/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!',
                
                textAlign: TextAlign.center),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: signupController.name,
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Icon(Icons.person_4_outlined)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: signupController.email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: signupController.address,
                    decoration: InputDecoration(
                        labelText: "Address",
                        prefixIcon: Icon(Icons.location_on_outlined)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: signupController.password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      signupController.signUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Sign Up',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('I have already account'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RoutesClass.login);
                        },
                        child: Text('Login'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
