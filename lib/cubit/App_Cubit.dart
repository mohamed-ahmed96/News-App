import 'package:news_app/cubit/App_States.dart';
import 'package:news_app/shared/local/cash_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(BuildContext context)=>BlocProvider.of(context);

 List businessNews=[];
 List scienceNews=[];
 List sportsNews=[];
  int currentIndex=0;

  void setCurrentIndex(index){
    currentIndex=index;
    emit(SetCurrentIndexState());
  }
  bool isDark=false;
  void isDarkMode({bool? fromShared,required BuildContext context}){
    if(fromShared !=null)
    {
      isDark=fromShared;
    }else{
      isDark=!isDark;
      CashHelper.saveData(key: "isDark", value: AppCubit.get(context).isDark);
    }
  emit(ChangeModeState());
  }

  void getBusinessNews(){
    emit(GetBusinessLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          // =us&=&=
          "country":"eg",
          "category":"business",
          "apiKey":"4b44be43212c4495bec89cbad53fd10e",

        }).then((value){
        businessNews=value.data["articles"];
        emit(GetBusinessSuccessState());
        //print(businessNews[0]["title"]);
        //print(businessNews.length);
    }).catchError((error){
      emit(GetBusinessErrorState());
      print(error.toString());
    });
  }

  void getScienceNews(){
    emit(GetScienceLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {

          "country":"eg",
          "category":"science",
          "apiKey":"4b44be43212c4495bec89cbad53fd10e",

        }).then((value){
      scienceNews=value.data["articles"];
      emit(GetScienceSuccessState());

        }).catchError((error){
      emit(GetScienceErrorState());

      print(error.toString());
    });
  }

  void getSportsNews(){
    emit(GetSportsLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          // =us&=&=
          "country":"eg",
          "category":"sports",
          "apiKey":"4b44be43212c4495bec89cbad53fd10e",

        }).then((value){
      scienceNews=value.data["articles"];
      emit(GetSportsSuccessState());

    }).catchError((error){
      emit(GetSportsErrorState());
      print(error.toString());
    });
  }
}