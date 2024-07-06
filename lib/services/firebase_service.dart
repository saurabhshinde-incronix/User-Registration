// // import 'package:firebase_database/firebase_database.dart';
// // import '../models/user.dart';

// // class FirebaseService {
// //   static final DatabaseReference _dbRef = FirebaseDatabase.instance.reference().child('users');

// //   static Future<void> addUser(User user) async {
// //     await _dbRef.child(user.id).set(user.toMap());
// //   }

// //   static Future<User?> fetchUser(String id) async {
// //     final snapshot = await _dbRef.child(id).once();
// //     if (snapshot.value != null) {
// //       return User.fromMap(Map<String, dynamic>.from(snapshot.value));
// //     } else {
// //       return null;
// //     }
// //   }
// // }
//..........................................................................................

import 'package:firebase_database/firebase_database.dart';
import '../models/user.dart';

class FirebaseService {
  static final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('users');  // Updated reference method

  static Future<void> addUser(User user) async {
    await _dbRef.child(user.id).set(user.toMap());
  }

  static Future<User?> fetchUser(String id) async {
    DatabaseEvent event = await _dbRef.child(id).once();  // Updated method to get DatabaseEvent
    DataSnapshot snapshot = event.snapshot;
    if (snapshot.value != null) {
      return User.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
    } else {
      return null;
    }
  }
}

//..........................................................................................
// import 'package:firebase_database/firebase_database.dart';
// import '../models/user.dart';

// class FirebaseService {
//   static final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('users');  // Updated reference method

//   static Future<void> addUser(User user) async {
//     await _dbRef.child(user.id).set(user.toMap());
//   }

//   static Future<User?> fetchUser(String id) async {
//     DatabaseEvent event = await _dbRef.child(id).once();  // Updated method to get DatabaseEvent
//     DataSnapshot snapshot = event.snapshot;
//     if (snapshot.value != null) {
//       return User.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
//     } else {
//       return null;
//     }
//   }
// }
