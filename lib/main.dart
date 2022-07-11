import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:katale_ko_client/routes.dart';
import 'package:katale_ko_client/screens/home/home_screen.dart';
import 'package:katale_ko_client/screens/profile/profile_screen.dart';
import 'package:katale_ko_client/services/auth_service.dart';
import 'package:katale_ko_client/screens/splash/splash_screen.dart';
import 'package:katale_ko_client/theme.dart';
import 'package:katale_ko_client/utils/application_state.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(MyApp());
  runApp(
    ChangeNotifierProvider(create: (context) => ApplicationState(), builder:
    (context, _) => Consumer<ApplicationState>(builder:(context, applicationState, child){
      return MyApp();
    }
    )
    )
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      home: StreamBuilder(stream: Authentication().firebaseAuth.authStateChanges(), builder: (context, snapshot){
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return SplashScreen();
        }
      },),
      routes: routes,
    );
  }
}
