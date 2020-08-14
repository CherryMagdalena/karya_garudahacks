import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karya_garudahacks/model/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference categoryCollection = Firestore.instance.collection('category');

  ///user data
  //to update user data
  Future<void> updateUserData(String name, String username) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'username': username,
    });
  }

  //to get user data from snapshot
  UserData _userDataFromSS(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      username: snapshot.data['username'],
    );
  }

  //stream for user data
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSS);
  }

  ///category
  //to update category data
  Future<void> updateCategoryData(String category1, String category2, String category3) async {
    return await userCollection.document(uid).setData({
      'category1': category1,
      'category2': category2,
      'category3': category3,
    });
  }

  //to get category data from snapshot
  CategoryData _categoryDataFromSS(DocumentSnapshot snapshot){
    return CategoryData(
      uid: uid,
      category1: snapshot.data['category1'],
      category2: snapshot.data['category2'],
      category3: snapshot.data['category3'],
    );
  }

  //stream for category data
  Stream<CategoryData> get categoryData {
    return userCollection.document(uid).snapshots().map(_categoryDataFromSS);
  }
}