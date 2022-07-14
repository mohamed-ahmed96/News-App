import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/App_Cubit.dart';
import 'package:news_app/cubit/App_States.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List<String> titles=[
    "Business Screen",
    "Sports Screen",
    "Science Screen",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<Widget> screens=[
          BusinessScreen(news:AppCubit.get(context).businessNews),
          SportsScreen(news:AppCubit.get(context).sportsNews),
          ScienceScreen(news:AppCubit.get(context).scienceNews),

        ];
        return Scaffold(
         appBar: AppBar(
           actions: [
             IconButton(
                 onPressed: (){
                   AppCubit.get(context).isDarkMode(context: context);
                 },
                 icon:const Icon(Icons.dark_mode_outlined,size: 25,color: Colors.red,),
             )
           ],
           title:Text(titles[AppCubit.get(context).currentIndex]),
         ),
         bottomNavigationBar: BottomNavigationBar(
           currentIndex:AppCubit.get(context).currentIndex,
          onTap: (index){
          AppCubit.get(context).setCurrentIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: "Sports",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined),
              label: "Science",
            ),
          ],
        ),
         body:screens[AppCubit.get(context).currentIndex],
      );});
  }
}
