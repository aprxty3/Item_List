import 'package:flutter/material.dart';
import 'package:list_items/widget/HUD.dart';
import 'package:list_items/api/api.dart';
import 'package:list_items/model/login_model.dart';
import 'package:list_items/pages/home.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  loginRequest requestModel;
  bool isApiCallProcess = false;

  @override
  void inisState() {
    super.initState();
    requestModel = new loginRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Display(
      child: _uiSteup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSteup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 85,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20),
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text('Login',
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input,
                          // validator: (input) => !input.contains("@")
                          //     ? "Email harus valid"
                          //     : null,
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.email,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input,
                          // validator: (input) => input.length < 3
                          //     ? "Password harus lebih dari 3 huruf"
                          //     : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Theme.of(context).accentColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                            );

                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });

                              // onTap:
                              // () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) {
                              //         return HomePage();
                              //       },
                              //     ),
                              //   );
                              // };

                              loginAPI apiService = new loginAPI();
                              apiService.login(requestModel).then((value) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                if (value.token.isNotEmpty) {
                                  final snackbar = SnackBar(
                                    content: Text("Login Successfull"),
                                  );
                                } else {
                                  final snackbar = SnackBar(
                                    content: Text(value.error),
                                  );
                                }
                              });
                              // print(requestModel.toJson());
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save;
      return true;
    }
    return false;
  }
}
