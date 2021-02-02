class Dish {
  String name;
  String image;
  int numberInStock;

  Dish(this.name, this.image, this.numberInStock);
  json(){
    return{
      "name":name,
      "image":image,
      "numberInStock":numberInStock,
    };
  }
}