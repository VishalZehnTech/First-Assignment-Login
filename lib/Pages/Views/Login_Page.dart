// ignore_for_file: file_names
import 'package:assignment_first_login/Pages/Views/List_Item_Page.dart';
import 'package:assignment_first_login/Provider/Login_State.dart';
import 'package:assignment_first_login/Provider/Obscure_State.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    final obscureState = Provider.of<ObscureState>(context);

    void checkUserLogin(int statusCode) async {
      // ignore: unrelated_type_equality_checks
      if (statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListItemPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect Password, Try again'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
        backgroundColor: Colors.amber[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email can\'t be empty';
                  }
                  return null; // No error
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                // obscureText: _isObscured,
                obscureText: obscureState.isObscured,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(obscureState.isObscured
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      obscureState.toggleObscure();
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password can\'t be empty';
                  }
                  return null; // No error
                },
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[300],
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          int? statusCode = await loginState.login(
                              emailController.text.toString(),
                              passwordController.text.toString());
                          checkUserLogin(statusCode ?? 0);
                        }
                      },
                      child: loginState.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Log in",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
