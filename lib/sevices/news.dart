import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];
  
  
  
  
  Future<void> getNews()async{
    String url="https://newsapi.org/v2/everything?q=tesla&from=2024-09-14&sortBy=publishedAt&apiKey=f6eb37d47f2b440bad729bbc644ff680";

    var response= await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=='ok'){
       jsonData["articles"].forEach((element){
        if(element["urlToimage"] !=null && element['description'] !=null){
          ArticleModel articleModel= ArticleModel(
            title: element["title"],
            description: element["description"],
            url:element["url"],
            urlToimage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
        }


});

    }
  }
}