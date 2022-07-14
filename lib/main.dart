import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/App_Cubit.dart';
import 'package:news_app/cubit/App_States.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/shared/local/cash_helper.dart';
import 'package:news_app/shared/local/constant.dart';
import 'package:news_app/shared/local/news_colors.dart';
import 'package:news_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool isDark = CashHelper.getData(key: "isDark", def: false);
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isDark}) : super(key: key);
  bool isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusinessNews()
        ..getScienceNews()
        ..getSportsNews()
        ..isDarkMode(context: context,fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
              color: Colors.white30,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0,
              //centerTitle: true,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.orange,
            ),
            primarySwatch: Colors.blue,
          ),
          themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.grey,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.black,
              ),
              color: Colors.black,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0,
              //centerTitle: true,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey),
          ),
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
