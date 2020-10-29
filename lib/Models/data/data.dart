import '../categoriesModel.dart';

String apiKey = "563492ad6f91700001000001c32c205e590242acafbb15d822d367e7";

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = new List();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Nature";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Landscape";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Dark";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1270184/pexels-photo-1270184.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "4k ";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Sunset";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/36744/agriculture-arable-clouds-countryside.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Water";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/2033981/pexels-photo-2033981.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Love";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/3738057/pexels-photo-3738057.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Mountains";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/4215100/pexels-photo-4215100.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "Cars";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoriesName = "City";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}
