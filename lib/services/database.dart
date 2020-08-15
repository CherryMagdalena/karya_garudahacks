import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karya_garudahacks/model/user.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference categoryCollection = Firestore.instance.collection('category');
  final CollectionReference postCollection = Firestore.instance.collection('posts');

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
    return await categoryCollection.document(uid).setData({
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
    return categoryCollection.document(uid).snapshots().map(_categoryDataFromSS);
  }

  ///image acquisition
  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask task = ref.putFile(imageFile);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
  }

  ///post data
  //to update category data
  Future<void> updatePostData(String uid, String imagePath, String category, String title,
      String description, int price) async {

    var userName = await userCollection.document(uid).get();

    return await postCollection.document().setData({
      uid: uid,
      'username': userName['username'],
      'imagePath': imagePath,
      'category': category,
      'title': title,
      'description': description,
      'price': price,
    });
  }

  //to get category data from snapshot
  PostData _postDataFromSS(DocumentSnapshot snapshot){
    return PostData(
      uid: uid,
      username: snapshot.data['username'],
      imagePath: snapshot.data['imagePath'],
      category: snapshot.data['category'],
      title: snapshot.data['title'],
      description: snapshot.data['description'],
      price: snapshot.data['price'],
    );
  }

  //stream for category data
  Stream<PostData> get postData {
    return postCollection.document().snapshots().map(_postDataFromSS);
  }
}