import 'package:flutter/material.dart';
import 'package:fruits_farms/models/cart.dart';
import 'package:fruits_farms/models/category.dart';
import 'package:fruits_farms/models/product.dart';
import 'package:fruits_farms/models/test.dart';
import 'package:fruits_farms/services/authservice.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// class ScreensController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<UserProvider>(context);
//     switch (auth.status) {
//       case Status.Uninitialized:
//         return Splash();
//       case Status.Unauthenticated:
//       case Status.Authenticating:
//         return Login();
//       case Status.Authenticated:
//         return ViewPage();
//       default:
//         return Login();
//     }
//   }
// }

// void main() {
//   runApp(MyApp());
//   // WidgetsFlutterBinding.ensureInitialized();
//   // runApp(MultiProvider(
//   //   providers: [
//   //     ChangeNotifierProvider.value(value: UserProvider.initialize()),
//   //     ChangeNotifierProvider(create: (context) => Products()),
//   //     ChangeNotifierProvider(create: (context) => Categories()),
//   //     ChangeNotifierProvider(create: (context) => Cart()),
//   //     ChangeNotifierProvider(create: (context) => TestNotifier()),
//   //   ],
//   //   child: MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     theme: ThemeData(
//   //       primaryColor: Colors.lightGreen,
//   //       canvasColor: Colors.grey[200],
//   //     ),
//   //     home: ScreensController(),
//   //   ),
//   // ));
// }

// // class ScreensController extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final user = Provider.of<UserProvider>(context);
// //     switch (user.status) {
// //       case Status.Uninitialized:
// //         return Splash();
// //       case Status.Unauthenticated:
// //       case Status.Authenticating:
// //         return LoginPage();
// //       case Status.Authenticated:
// //         return ViewPage();
// //       default:
// //         return LoginPage();
// //     }
// //   }
// // }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Categories()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => TestNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: Colors.grey[200],
        ),
        home: AuthService().handleAuth(),
        routes: {
          // DetailPage.routeName: (ctx) => DetailPage(),
          // CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
