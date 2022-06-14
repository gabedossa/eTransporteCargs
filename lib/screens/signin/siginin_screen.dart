import 'package:app/models/user/user_local.dart';
import 'package:app/screens/signin/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user/users.dart';
import '../../models/user/usersDTO_service.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController user_nameController = TextEditingController();
  TextEditingController user_cargoController = TextEditingController();
  TextEditingController user_emailController = TextEditingController();
  TextEditingController user_passwordController = TextEditingController();
  TextEditingController user_cofirmController = TextEditingController();
  final _formikey = GlobalKey<FormState>();
  var senha;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
              height: 500,
              width: 500,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back,
                                  size: 30, color: Colors.purple.shade700),
                              Text('Voltar',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.purple.shade700)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CADASTRO',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.purple.shade700),
                      ),
                    ],
                  ),
                  Form(
                    key: _formikey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: TextFormField(
                            controller: user_nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite o nome completo.',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Peencha o campo nome';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: TextFormField(
                            controller: user_cargoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  'Digite o cargo(Entregador, solicitante ou Administrador.).',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Peencha o campo nome';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: TextFormField(
                            controller: user_emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite o E-mail',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Peencha o campo E-mail';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: TextFormField(
                            controller: user_passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite sua senha',
                            ),
                            validator: (value) {
                              senha = value;
                              if (value == null || value.isEmpty) {
                                return 'Peencha o campo senha';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: TextFormField(
                            controller: user_cofirmController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Confime a senha.',
                            ),
                            validator: (value) {
                              if (value != senha) {
                                return 'As senhas não são iguais!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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
                                UsersDTOServices userServices = UsersDTOServices();
                                Users user = Users(
                                  user_nameController.text,
                                  user_cargoController.text,
                                  user_emailController.text,
                                  user_passwordController.text,
                                  user_cofirmController.text,
                                );
                                userServices.addUser(user);
                              }
                            },
                            child: const Text('Cadastrar',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ))),
                      ],
                    ),
                  ),
                ],
                //Parte superior
              )),
        )
      ]),
    );
  }
}
