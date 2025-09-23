class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> categoryList = [
  CategoryModel(name: 'Beauty', image: "assets/icons/Beauty_category_icon.png"),
  CategoryModel(
    name: 'Fashion',
    image: 'assets/icons/fashion_category_icon.png',
  ),
  CategoryModel(name: 'Kids', image: 'assets/icons/kids_category_icon.png'),
  CategoryModel(name: 'Mens', image: 'assets/icons/men_category_icon.png'),
  CategoryModel(name: 'Womens', image: 'assets/icons/womans_category_icon.png'),
  CategoryModel(name: 'Gifts', image: 'assets/icons/gift_category_icon.png'),
];
