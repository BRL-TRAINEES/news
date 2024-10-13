import 'package:newsapp/models/slider_model.dart';

List<SliderModel> getSliders(){
  List<SliderModel> slider = [];
  SliderModel categorymodel= new SliderModel();

  categorymodel.image="images/business.png";
  categorymodel.name="Business";
  slider.add(categorymodel);
  categorymodel = new SliderModel();

  categorymodel.image="images/entertainment.png";
  categorymodel.name="Entertainment";
  slider.add(categorymodel);
  categorymodel = new SliderModel();

  categorymodel.image="images/health.png";
  categorymodel.name="Health";
  slider.add(categorymodel);
  categorymodel = new SliderModel();

  categorymodel.image="images/science.png";
  categorymodel.name="Science";
  slider.add(categorymodel);
  categorymodel = new SliderModel();


  categorymodel.image="images/sport.png";
  categorymodel.name="Sports";
  slider.add(categorymodel);
  categorymodel = new SliderModel();

  
  return slider;
}