import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Digite o e-mail',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Digite a senha.',
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
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/home_page');
                                },
                                child: const Text('Entrar'),
                              ),
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    style: TextStyle(
                                        color: Colors.purple.shade700)),
                              ),
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
