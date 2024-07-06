import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/firebase_service.dart';

class AddUserPage extends StatefulWidget {
  static const routeName = '/add-user';

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        id: _idController.text,
        name: _nameController.text,
        address: _addressController.text,
      );
      FirebaseService.addUser(newUser);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User Added Successfully'),
      ));
      _idController.clear();
      _nameController.clear();
      _addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ....................................................................................................

// import 'package:flutter/material.dart';
// import '../models/user.dart';
// import '../services/firebase_service.dart';

// class AddUserPage extends StatefulWidget {
//   static const routeName = '/add-user';

//   @override
//   _AddUserPageState createState() => _AddUserPageState();
// }

// class _AddUserPageState extends State<AddUserPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _idController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();

//   void _submitData() {
//     if (_formKey.currentState!.validate()) {
//       final newUser = User(
//         id: _idController.text,
//         name: _nameController.text,
//         address: _addressController.text,
//       );
//       FirebaseService.addUser(newUser);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('User Added Successfully'),
//       ));
//       _idController.clear();
//       _nameController.clear();
//       _addressController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add User'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _idController,
//                 decoration: InputDecoration(labelText: 'ID'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter an ID';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter an address';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitData,
//                 child: Text('Add User'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
