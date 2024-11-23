import 'package:flutter/material.dart';
import 'package:patients/dio.dart';
import 'package:patients/models/patient_model.dart';
import 'package:patients/pages/create_patient_page.dart';
import 'package:patients/pages/home_page.dart';
import 'package:patients/pages/login_page.dart';
import 'package:patients/pages/patient_details_page.dart';
import 'package:patients/pages/sign_up_page.dart';
import 'package:patients/view_models/home_view_model.dart';
import 'package:provider/provider.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  addInterceptors();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    AppTheme theme = AppTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routes: {
        '/': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/createPatient': (context) => CreatePatientPage(),
       
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/patientDetails') {
          final args = settings.arguments as PatientModel;
          return MaterialPageRoute(
            builder: (context) {
              return PatientDetailsPage(patientModel: args);
            }
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}