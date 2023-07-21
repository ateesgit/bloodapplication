import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
 
 void deleteDonor(docId){
  donor.doc(docId).delete();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation App'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add,size: 40,),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: StreamBuilder(
        // stream: donor.snapshots(),
        stream: donor.orderBy('name').snapshots(),
        builder:(context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length ,
              itemBuilder:(context,index){
                final DocumentSnapshot donorsnap=snapshot.data.docs[index];
                /* return Text(donorsnap['name']); */
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), 
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 194, 193, 193),
                            blurRadius: 10,
                            spreadRadius: 15,
                          )
                        ]
                      ),
                      // color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 30,
                                child: Text(donorsnap['group'],style: TextStyle(fontSize: 25),),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(donorsnap['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Text(donorsnap['phone'].toString(),style: TextStyle(fontSize: 18),),
                
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/update',
                                  arguments: {
                                    'name':donorsnap['name'],
                                    'phone':donorsnap['phone'].toString(),
                                    'group':donorsnap['group'],
                                    'id':donorsnap.id,
                                  });
                                },
                                icon: Icon(Icons.edit,),
                                iconSize: 30,
                                color: Colors.blue,),
                              IconButton(
                                onPressed: (){
                                  deleteDonor(donorsnap.id);
                                }, 
                                icon: Icon(Icons.delete),
                                iconSize: 30,
                                color: Colors.red,),
                            ],
                          )
                        ],
                      ),
                  ),
                );
              } );
          }
          return Container();
        } ),
    );
  }
}