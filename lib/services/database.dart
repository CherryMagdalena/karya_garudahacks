import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karya_garudahacks/model/user.dart';
import 'package:path/path.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

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
}