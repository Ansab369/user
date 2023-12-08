// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: 'Search',
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio:0.7
                ),
                itemBuilder: (context, index) {
                  return Container(
                    // height: 300,
                    
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.9,
                          style: BorderStyle.solid,
                        ),
                        borderRadius:
                            BorderRadius.circular(10.0), 
                        color: Colors.red,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.greenAccent,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                        
                        borderRadius:
                            BorderRadius.circular(10.0), 
                       color: Colors.blueGrey[100],
                      ),
                              
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal:  3),
                              padding: EdgeInsets.all(  5),
                              child: Column(
                                children: [
                                  Text("Alex poul",style: TextStyle(fontSize: 16,),),
                                  Text("@Alexpoyl123",style: TextStyle(fontSize: 12,)),
                                ],
                              ),
                            )
                            ,
                            SizedBox(height: 10),

                            Text("+91 735698446",style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 5),

                            Text("Abu Dhabi",style: TextStyle(color: Colors.grey),),

                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
