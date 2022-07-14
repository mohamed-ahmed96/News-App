import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view_screen.dart';

class NewsItem extends StatelessWidget {

  NewsItem({Key? key, required this.news}) : super(key: key);
   Map news;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(url:"url"),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                news["urlToImage"]??"https://media.gemini.media/img/large/2021/1/9/2021_1_9_11_49_32_886.jpg",
              errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace)
              {
                return const Icon(Icons.image_not_supported_outlined,size: 100,);
              },
              fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(news["title"],maxLines: 3,
                      overflow: TextOverflow.ellipsis ,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 20,),
                  Text(news["publishedAt"],style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

