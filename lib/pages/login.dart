import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_farms/services/authservice.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.green[300],
          Colors.blue[400],
          Colors.blue[500],
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(80)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        showCursor: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            hintText: "Enter Phone Number",
                            prefixText: "+91 "),
                        onChanged: (val) {
                          setState(() {
                            this.phoneNo = "+91" + val;
                          });
                        },
                      ),
                    ),
                    codeSent
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 8,
                            ),
                            child: TextFormField(
                              showCursor: true,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "Enter Otp",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  prefixIcon: Icon(
                                    Icons.sms,
                                    color: Colors.black,
                                  )),
                              onChanged: (val) {
                                setState(() {
                                  this.smsCode = val;
                                });
                              },
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        right: 50,
                        top: 8,
                      ),
                      child: MaterialButton(
                          padding: EdgeInsets.all(12),
                          color: Colors.green,
                          child: Center(
                            child: codeSent
                                ? Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    "Verify",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          onPressed: () {
                            codeSent
                                ? AuthService()
                                    .signInWithOTP(smsCode, verificationId)
                                : verifyPhone(phoneNo);
                          }),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fruits_farms/helpers/common.dart';
// import 'package:fruits_farms/helpers/style.dart';
// import 'package:fruits_farms/pages/signup.dart';
// import 'package:fruits_farms/pages/view_page.dart';
// import 'package:fruits_farms/provider/user.dart';
// import 'package:fruits_farms/widgets/loading.dart';
// import 'package:provider/provider.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final _key = GlobalKey<ScaffoldState>();

//   // TextEditingController _email = TextEditingController();
//   // TextEditingController _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       key: _key,
//       body: authProvider.status == Status.Authenticating
//           ? Loading()
//           : Stack(
//               children: <Widget>[
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey[350],
//                             blurRadius:
//                                 20.0, // has the effect of softening the shadow
//                           )
//                         ],
//                       ),
//                       child: ListView(
//                         children: <Widget>[
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Container(
//                                 alignment: Alignment.topCenter,
//                                 child: Image.asset(
//                                   'assets/a.jpg',
//                                   width: 260.0,
//                                 )),
//                           ),

//                           Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                             child: Material(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Colors.grey.withOpacity(0.3),
//                               elevation: 0.0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12.0),
//                                 child: TextFormField(
//                                   controller: authProvider.email,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Email",
//                                     icon: Icon(Icons.alternate_email),
//                                   ),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       Pattern pattern =
//                                           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                       RegExp regex = new RegExp(pattern);
//                                       if (!regex.hasMatch(value))
//                                         return 'Please make sure your email address is valid';
//                                       else
//                                         return null;
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                             child: Material(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Colors.grey.withOpacity(0.3),
//                               elevation: 0.0,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12.0),
//                                 child: TextFormField(
//                                   controller: authProvider.password,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Password",
//                                     icon: Icon(Icons.lock_outline),
//                                   ),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return "The password field cannot be empty";
//                                     } else if (value.length < 6) {
//                                       return "the password has to be at least 6 characters long";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                             child: Material(
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 color: Colors.black,
//                                 elevation: 0.0,
//                                 child: MaterialButton(
//                                   onPressed: () async {
//                                     if (_formKey.currentState.validate()) {
//                                       if (!await authProvider.signIn()) {
//                                         _key.currentState.showSnackBar(SnackBar(
//                                             content: Text("Login failed!")));
//                                         return;
//                                       }
//                                       changeScreenReplacement(
//                                           context, ViewPage());
//                                     }
//                                   },
//                                   minWidth: MediaQuery.of(context).size.width,
//                                   child: Text(
//                                     "Login",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20.0),
//                                   ),
//                                 )),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Forgot password",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: black,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: InkWell(
//                                       onTap: () {
//                                         changeScreen(context, SignUp());
//                                       },
//                                       child: Text(
//                                         "Create an account",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(color: Colors.black),
//                                       ))),
//                             ],
//                           ),

// //                        Padding(
// //                          padding: const EdgeInsets.all(16.0),
// //                          child: Row(
// //                            mainAxisAlignment: MainAxisAlignment.center,
// //                            children: <Widget>[
// //
// //                              Padding(
// //                                padding: const EdgeInsets.all(8.0),
// //                                child: Text("or sign in with", style: TextStyle(fontSize: 18,color: Colors.grey),),
// //                              ),
// //                              Padding(
// //                                padding: const EdgeInsets.all(8.0),
// //                                child: MaterialButton(
// //                                    onPressed: () {},
// //                                    child: Image.asset("images/ggg.png", width: 30,)
// //                                ),
// //                              ),
// //
// //                            ],
// //                          ),
// //                        ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
