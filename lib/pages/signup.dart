// import 'package:flutter/material.dart';
// import 'package:fruits_farms/helpers/common.dart';
// import 'package:fruits_farms/helpers/style.dart';
// // import 'package:fruits_farms/pages/homepage.dart';
// import 'package:fruits_farms/pages/view_page.dart';
// import 'package:fruits_farms/provider/user.dart';
// import 'package:fruits_farms/widgets/loading.dart';
// import 'package:provider/provider.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormState>();
//   final _key = GlobalKey<ScaffoldState>();

//   // TextEditingController _email = TextEditingController();
//   // TextEditingController _password = TextEditingController();
//   // TextEditingController _name = TextEditingController();
//   // bool hidePass = true;

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       key: _key,
//       body: authProvider.status == Status.Authenticating
//           ? Loading()
//           : Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey[350],
//                           blurRadius:
//                               20.0, // has the effect of softening the shadow
//                         )
//                       ],
//                     ),
//                     child: ListView(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Container(
//                               alignment: Alignment.topCenter,
//                               child: Image.asset(
//                                 'images/logo.png',
//                                 width: 260.0,
//                               )),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey.withOpacity(0.3),
//                             elevation: 0.0,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: ListTile(
//                                 title: TextFormField(
//                                   controller: authProvider.name,
//                                   decoration: InputDecoration(
//                                       hintText: "Full name",
//                                       icon: Icon(Icons.person_outline),
//                                       border: InputBorder.none),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return "The name field cannot be empty";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey.withOpacity(0.2),
//                             elevation: 0.0,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: ListTile(
//                                 title: TextFormField(
//                                   controller: authProvider.email,
//                                   decoration: InputDecoration(
//                                       hintText: "Email",
//                                       icon: Icon(Icons.alternate_email),
//                                       border: InputBorder.none),
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
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey.withOpacity(0.3),
//                             elevation: 0.0,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: ListTile(
//                                 title: TextFormField(
//                                   controller: authProvider.password,
//                                   // obscureText: hidePass,
//                                   decoration: InputDecoration(
//                                       hintText: "Password",
//                                       icon: Icon(Icons.lock_outline),
//                                       border: InputBorder.none),
//                                   validator: (value) {
//                                     if (value.isEmpty) {
//                                       return "The password field cannot be empty";
//                                     } else if (value.length < 6) {
//                                       return "the password has to be at least 6 characters long";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 // trailing: IconButton(
//                                 //     icon: Icon(Icons.remove_red_eye),
//                                 //     onPressed: () {
//                                 //       setState(() {
//                                 //         hidePass = !hidePass;
//                                 //       });
//                                 //     }),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                           child: Material(
//                               borderRadius: BorderRadius.circular(20.0),
//                               color: Colors.black,
//                               elevation: 0.0,
//                               child: MaterialButton(
//                                 onPressed: () async {
//                                   if (_formKey.currentState.validate()) {
//                                     if (!await authProvider.signUp()) {
//                                       _key.currentState.showSnackBar(SnackBar(
//                                           content: Text("Sign up failed")));
//                                       return;
//                                     }
//                                     // authProvider.clearController();
//                                     changeScreenReplacement(
//                                         context, ViewPage());
//                                   }
//                                 },
//                                 minWidth: MediaQuery.of(context).size.width,
//                                 child: Text(
//                                   "Sign up",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20.0),
//                                 ),
//                               )),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text(
//                                   "I already have an account",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 16),
//                                 ))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
