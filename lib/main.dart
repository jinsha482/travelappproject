import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/firebase_options.dart';

import 'package:travel_app/provider/provider.dart';
import 'package:travel_app/services/firebase_auth_methods.dart';

import 'package:travel_app/text.dart';
import 'package:travel_app/text_one.dart';
import 'package:travel_app/welcomebutton.dart';
import 'package:travel_app/button.dart';
import 'package:travel_app/textsforfirst.dart';
import 'package:travel_app/loginpage.dart';
import 'package:travel_app/create.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcomepage_one(),
    );
  }
}

//   runApp(MultiProvider(
//       providers: [ChangeNotifierProvider(create: (_) => ProviderState())],
//       child: MyProviderApp()));
// }

// class MyProviderApp extends StatefulWidget {
//   @override
//   State<MyProviderApp> createState() => _MyProviderAppState();
// }

// class _MyProviderAppState extends State<MyProviderApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: welcomepage_one(),
//         theme: ThemeData(
//           pageTransitionsTheme: PageTransitionsTheme(builders: {
//             TargetPlatform.android: CupertinoPageTransitionsBuilder()
//           }),
//         ));
//   }
// }
// void main() {
// //   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             pageTransitionsTheme: PageTransitionsTheme(builders: {
//               TargetPlatform.android: CupertinoPageTransitionsBuilder()
//             }),
//             primarySwatch: Colors.blue),
//         home: welcomepage_one());
//   }
// }

// void main() async {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>AuthProvider()),ChangeNotifierProvider(create: (_)=>UserProvider())],child: MaterialApp( debugShowCheckedModeBanner: false, home: welcomepage_one(), theme: ThemeData(
//             pageTransitionsTheme: PageTransitionsTheme(builders: {
//              TargetPlatform.android: CupertinoPageTransitionsBuilder()
//             }),)));
//   }
// }

class welcomepage_one extends StatefulWidget {
  const welcomepage_one({Key? key}) : super(key: key);

  @override
  State<welcomepage_one> createState() => _welcomepage_oneState();
}

class _welcomepage_oneState extends State<welcomepage_one> {
  List images = [
    'assets/images/tri4.png',
    'assets/images/tri5.png',
    'assets/images/tri6.png'
  ];
  List texts = [
    text_one(
        text: 'Let\'s' ' ' 'Travel',
        texts:
            'The world is a book and those who do not travel read only one page'),
    apptext(text: 'Plan A Trip'),
    textofone(texts: 'Explore the world')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images[index]),
                )),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [texts[index]],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            3,
                            (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 7,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? Colors.white70
                                        : Colors.white.withOpacity(0.3)),
                              );
                            },
                          ))
                    ],
                  ),
                ),
              );
            })));
  }
}
