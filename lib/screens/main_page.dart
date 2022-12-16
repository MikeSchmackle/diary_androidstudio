import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_webapp/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 4,
        title: Row(
          children: [
            Text(
              'Diary',
              style: TextStyle(fontSize: 39, color: Colors.blueGrey.shade100),
            ),
            Text(
              'Book',
              style: TextStyle(fontSize: 39, color: Colors.green),
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  items: <String>['Latest', 'Earliest'].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey),
                        ));
                  }).toList(),
                  hint: (_dropDownText == null)
                      ? Text('Select')
                      : Text(_dropDownText!),
                  onChanged: (value) {
                    if (value == 'Latest') {
                      setState(() {
                        _dropDownText = value;
                      });
                    } else if (value == 'Earliest') {
                      setState(() {
                        _dropDownText = value;
                      });
                    }
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                              stream:
                                  FirebaseFirestore.instance.collection('users').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                               final usersListStream = snapshot.data!.docs.map((docs) {
                                                   return MUser.fromDocument(docs);
                                                 }).where((muser) {
                                                   // print("MUser: ${muser.uid}");
                                                   return (muser.uid ==
                                                       FirebaseAuth.instance.currentUser!.uid);
                                                 }).toList();
                                                 // print(
                                                 //     "CurrUser--->  ${FirebaseAuth.instance.currentUser!.uid}");

                                                 //   print("List---> ${usersListStream.length}");
                                                 MUser curUser = usersListStream[0];
                                print(curUser.displayName);
                                return Container(
                                                         child: Row(
                                                           children: [
                                                             Column(
                                                               children:[
                                                                 Expanded(
                                                                   child: InkWell(
                                                                       child: CircleAvatar(
                                                                           radius: 30,
                                                                           backgroundImage: NetworkImage(
                                                                               'https://picsum.photos/200/300.jpg'),
                                                                           backgroundColor: Colors.transparent,
                                                                       ),
                                                                   )
                                                                   ),
                                                                   Expanded(
                                                                   child: Text(
                                                                       curUser.displayName!,
                                                                       style: TextStyle(color: Colors.grey),
                                                                   )),
                                                                   Expanded(
                                                                   child: IconButton(
                                                                       onPressed: () {},
                                                                       icon: const Icon(
                                                                         Icons.logout_outlined,
                                                                         size: 19,
                                                                         color: Colors.red,
                                                                       ),
                                                                   )
                                                                 ),
                                                               ],
                                                             )
                                                           ],
                                                         ),
);
                                }),

            ],
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border(
                        right: BorderSide(width: 0.4, color: Colors.blueGrey))),
                //color: Colors.green,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfDateRangePicker(
                        onSelectionChanged: (DateRangePickerSelection) {
                          print(DateRangePickerSelection.value.toString());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Card(
                        elevation: 4,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.greenAccent,
                            ),
                            label:
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add New',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),

                          ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Card(
                          elevation: 4.0,
                          child: ListTile(
                            title: Text("Hello"),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add',
          child: const Icon(
            Icons.add,
          )),
    );
  }
}
