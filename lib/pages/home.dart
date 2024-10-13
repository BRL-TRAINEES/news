

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categorymodel.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/sevices/data.dart';
import 'package:newsapp/sevices/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

List<Categorymodel> categories=[];
List<SliderModel> sliders=[];

int activeIndex=0;
@override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
      super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Row(children: [
          Text("Daily"),
          Text("NEWS",style: TextStyle(color:Colors.blue ),
          )
          
        ],),
        centerTitle: true,
        elevation: 0.0 ,
      ),
      body:Container(

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 70,
              child:ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:categories.length, 
                itemBuilder:(context, index) {

              return Categorytile(
                image: categories[index].image,
                 categoryname: categories[index].categoryname,
              );
            }),),
            SizedBox(height: 20.0,),
            CarouselSlider.builder(itemCount: sliders.length, itemBuilder: (context, index ,realIndex){

              String? res= sliders[index].image;
              String? res1=sliders[index].name;
              return buildImage(res!, index, res1!);
            }, 
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
            
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index,reason){
              setState(() {
                activeIndex=index;
              });
            }
            )),

            SizedBox(height: 20,); 
            buildIndicator();
          ],
        ),
      ),
    );
  }
   Widget buildImage(String image, int index,String name)=>Container(
    margin: EdgeInsets.symmetric(horizontal: 3),
    child:Stack(
      children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
    
    child: Image.asset(
      image,
      height: 300,
       fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      ),
    ),
    
    Container(
      height: 300,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 120),
      width: MediaQuery.of(context).size.width,
     decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),),
      child: Text(name,style: TextStyle(color: const Color.fromARGB(255, 241, 239, 239),fontSize: 20,fontWeight: FontWeight.w600),),
    )
      ],
    ),
  );
}

Widget buildIndicator()=>AnimatedSmoothIndicator(
  activeIndex: activeIndex, 
  count: sliders.length),

class Categorytile extends StatelessWidget {
 final image , categoryname;
 Categorytile({this.categoryname,this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Stack(
        children: [ 
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
          child: 
         Image.asset(
          image,
          width: 120,
          height: 80,fit: BoxFit.cover,
          )
          ),
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38
            ),
            child:Center(
            child: Text(categoryname,style: TextStyle(color: const Color.fromARGB(255, 248, 244, 244), fontSize: 16),),),
          )
      ],),
    );
  }
 
}