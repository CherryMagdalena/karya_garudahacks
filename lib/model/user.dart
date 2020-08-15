class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String username;

  UserData({this.uid, this.name, this.username,});
}

class CategoryData {
  final String uid;
  final String category1;
  final String category2;
  final String category3;

  CategoryData({this.uid, this.category1, this.category2, this.category3});
}

class PostData {
  final String uid;
  final String username;
  final String imagePath;
  final String category;
  final String title;
  final String description;
  final int price;

  PostData({
    this.uid,
    this.username,
    this.imagePath,
    this.category,
    this.title,
    this.description,
    this.price,
});
}