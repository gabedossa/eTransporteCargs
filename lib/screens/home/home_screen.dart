import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.purple.shade700,
            child: Column(
              children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB( 0, 10, 20, 5),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                icon: const Icon(
                                  Icons.logout,
                                  size: 45,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.supervised_user_circle_sharp,
                        size: 100,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Testerson Tester',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
