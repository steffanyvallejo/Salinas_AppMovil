
class TourList{
  final List<Tour> tours;

  TourList({
    this.tours,
  });

  factory TourList.fromJson(List<dynamic> parsedJson){

    List<Tour> tours = new List<Tour>();
    tours = parsedJson.map((i)=>Tour.fromJson(i)).toList();

    return new TourList(tours: tours);
  }

  List<Tour> getTours(){
    return this.tours;
  }
}

class Tour{
  String title;
  String description;
  int availableStock;
  String company;
  String days;
  String hours;
  int price;
  String pathImage;

  Tour({
    this.title,this.description,this.availableStock,this.company,this.days,
    this.hours,this.price,this.pathImage});

  factory Tour.fromJson(Map<String,dynamic> json){
    return Tour(
      title: json['title'],
      description: json['description'],
      availableStock: json['available_stock'],
      company: json['company'],
      days: json['days'],
      hours: json['hours'],
      price: json['price'],
      pathImage: json['path_image'],
    );
  }

}

