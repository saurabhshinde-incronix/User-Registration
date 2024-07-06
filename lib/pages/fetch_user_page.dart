import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/firebase_service.dart';

class FetchUserPage extends StatefulWidget {
  static const routeName = '/fetch-user';

  @override
  _FetchUserPageState createState() => _FetchUserPageState();
}

class _FetchUserPageState extends State<FetchUserPage> {
  final _idController = TextEditingController();
  User? _fetchedUser;
  bool _isLoading = false;

  void _fetchUser() async {
    setState(() {
      _isLoading = true;
    });
    final userId = _idController.text;
    final user = await FirebaseService.fetchUser(userId);
    setState(() {
      _fetchedUser = user;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Enter User ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchUser,
              child: Text('Fetch User'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _fetchedUser == null
                    ? Text('No User Found')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${_fetchedUser!.id}'),
                          Text('Name: ${_fetchedUser!.name}'),
                          Text('Address: ${_fetchedUser!.address}'),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
//.......................................................................................................
// import 'package:flutter/material.dart';
// import '../models/user.dart';
// import '../services/firebase_service.dart';

// class FetchUserPage extends StatefulWidget {
//   static const routeName = '/fetch-user';

//   @override
//   _FetchUserPageState createState() => _FetchUserPageState();
// }

// class _FetchUserPageState extends State<FetchUserPage> {
//   final _idController = TextEditingController();
//   User? _fetchedUser;
//   bool _isLoading = false;

//   void _fetchUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final userId = _idController.text;
//     final user = await FirebaseService.fetchUser(userId);
//     setState(() {
//       _fetchedUser = user;
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fetch User'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _idController,
//               decoration: InputDecoration(labelText: 'Enter User ID'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _fetchUser,
//               child: Text('Fetch User'),
//             ),
//             SizedBox(height: 20),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : _fetchedUser == null
//                     ? Text('No User Found')
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('ID: ${_fetchedUser!.id}'),
//                           Text('Name: ${_fetchedUser!.name}'),
//                           Text('Address: ${_fetchedUser!.address}'),
//                         ],
//                       ),
//           ],
//         ),
//       ),
//     );
//   }
// }
