import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var ageController = TextEditingController();

  var allUsers = [];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                  labelText: "Age", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  var userData = {
                    "name": nameController.text,
                    "email": emailController.text,
                    "age": ageController.text
                  };

                  allUsers.add(userData);
                  nameController.clear();
                  emailController.clear();
                  ageController.clear();

                  setState(() {
                    
                  });
                  
                },
                icon: Icon(Icons.energy_savings_leaf),
                label: Text("ADD USER")),
            SizedBox(
              height: 20,
            ),
            DataTable(border: TableBorder.all(color: Colors.grey), columns: [
              DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold),)),
              DataColumn(label: Text("Email", style: TextStyle(fontWeight: FontWeight.bold),)),
              DataColumn(label: Text("Age", style: TextStyle(fontWeight: FontWeight.bold),)),
              DataColumn(label: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold),)),
            ], rows: [
           
           for(var user in  allUsers)
              DataRow(cells: [
                DataCell(Text(user["name"].toString())),
                DataCell(Text(user["email"].toString())),
                DataCell(Text(user["age"].toString())),
                DataCell(IconButton(
                  onPressed: (){
                    allUsers.remove(user);
                    setState(() {
                      
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )),
              ])
            ])
          ],
        ),
      ),
    );
  }
}

// [{
//   "name": "Faizan",
//   "age": "18",
//   "cnic":"32434-3422423-3",
//   "phone":"09219837183",
//   "height":"5.0",
//   "gender":"male",
//   "weight":"50kg",
//   "email":"faizan@gmail.com"
// },
// {
//   "name": "Arham",
//   "age": "23",
//   "cnic":"32434-3422423-3",
//   "phone":"09219837183",
//   "height":"5.3",
//   "gender":"male",
//   "weight":"50kg",
//   "email":"arham@gmail.com"
// }
// ]


// {
//   "name": "",
//   "email":"",
//   "age":""
// }