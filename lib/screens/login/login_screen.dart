import 'package:app/models/user/user_local.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/signin/user_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formikey = GlobalKey<FormState>();
  final TextEditingController user_emailController = TextEditingController();
  final TextEditingController user_passwordController = TextEditingController();
  UserLocal userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Icon(
              Icons.add_business_sharp,
              size: 80,
              color: Colors.purple.shade700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Text('Purple House',
                style: TextStyle(color: Colors.purple.shade700, fontSize: 45)),
          ),
          Center(
            child: Container(
              height: 400,
              width: 450,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 161, 161, 161),
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  // TITULO DE LOGIN
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.purple.shade700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // caixa de input de texto;
                  Form(
                    key: _formikey,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: user_emailController,
                            onSaved: (newValue) =>
                                userLocal.user_email = newValue,
                            initialValue: userLocal.user_email,
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, insira o e-mal';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite o e-mail',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                            child: TextFormField(
                              controller: user_passwordController,
                              onSaved: (newValue) =>
                                  userLocal.user_senha = newValue,
                              initialValue: userLocal.user_senha,
                              validator: (value) {
                                if (value == null) {
                                  return 'Por favor, insira a senha';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Digite a senha.',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 60),
                            // Foreground color
                            onPrimary: Colors.white,
                            // Background color
                            primary: Colors.purple.shade700,
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () {
                            if (_formikey.currentState!.validate()) {
                              _formikey.currentState!.save();
                              UserServices uuserServices = UserServices();
                              uuserServices.signIn(UserLocal(
                                user_email: user_emailController.text,
                                user_senha: user_passwordController.text
                              ), onSucess: () {
                                Navigator.of(context).pushNamed('/home_page');
                              }, onFail: (e) {
                                ScaffoldMessenger(
                                  child: SnackBar(
                                    content: Text(
                                      'Falha ao entrar: $e',
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              });
                            }
                          },
                          child: const Text('Entrar'),
                        ),
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      'Não possui conta?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child: Text('Cadastre-se',
                          style: TextStyle(color: Colors.purple.shade700)),
                    ),
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
