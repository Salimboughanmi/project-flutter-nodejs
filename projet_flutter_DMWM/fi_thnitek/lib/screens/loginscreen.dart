import 'package:fi_thnitek/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var name, password, token;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (val) {
              name = val;
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (val) {
              password = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              child: Text('Authenticate'),
              onPressed: () {
                AuthService().login(name, password).then((val) => {
                      if (val.data['success'])
                        {
                          token = val.data['token'],
                          Fluttertoast.showToast(
                            msg: 'Authenticated',
                          )
                        }
                    });
              }),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('add chauffeur'),
            onPressed: () {
              AuthService().addUser(name, password).then((val) => {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0)
                  });
            },
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('get information'),
            onPressed: () {
              AuthService().getinfo(token).then((val) => {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0)
                  });
            },
          )
        ],
      ),
    ));
  }
}
