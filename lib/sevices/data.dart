
import 'package:newsapp/models/categorymodel.dart';

List<Categorymodel> getCategories(){

  List<Categorymodel> category=[];
  Categorymodel categorymodel= new Categorymodel();

  categorymodel.categoryname="Bussiness";
  categorymodel.image="images/business.png";
  category.add(categorymodel);
  categorymodel=new Categorymodel();


   categorymodel.categoryname="Entertainment";
  categorymodel.image="images/entertainment.png";
  category.add(categorymodel);
  categorymodel=new Categorymodel();


 categorymodel.categoryname="Health";
  categorymodel.image="images/health.png";
  category.add(categorymodel);
  categorymodel=new Categorymodel();


 categorymodel.categoryname="Sports";
  categorymodel.image="images/sport.png";
  category.add(categorymodel);
  categorymodel=new Categorymodel();



   categorymodel.categoryname="Science";
  categorymodel.image="images/science.png";
  category.add(categorymodel);
  categorymodel=new Categorymodel();



  return category;



}