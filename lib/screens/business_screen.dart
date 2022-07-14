import 'package:flutter/material.dart';
import 'package:news_app/shared/local/news_item.dart';

class BusinessScreen extends StatelessWidget {
   BusinessScreen({Key? key,required this.news}) : super(key: key);
  List news;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder:(context, index) =>  NewsItem(
                news:news[index],
              ),
              separatorBuilder:(context,index)=>Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              itemCount:news.length,
            ),
          ),
        ],
      ),
    );
  }
}
