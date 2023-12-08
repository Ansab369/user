// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/application/Home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
//
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(readDataFromJson());
    });

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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is jsonDataReadingState) {
                    if (state.isReading == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else if (state is jsonDataRState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.userDataList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return Container(
                            // height: 300,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.9,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
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
                                            state.userDataList[index].image),
                                      ),
                                      Positioned(
                                        right: 5,
                                        bottom: 5,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor:
                                              state.userDataList[index].isOnline
                                                  ? Colors.greenAccent
                                                  : Colors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.blueGrey[100],
                                    ),
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          state.userDataList[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(state.userDataList[index].email,
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                  '${state.userDataList[index].region} ${ state.userDataList[index].mobile}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    state.userDataList[index].zone,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  }
                  return Center(child: Text('Something went wrong'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO : read data fromjson and display in grid
