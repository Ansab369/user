import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/application/Home/home_bloc.dart';
import 'package:user/presentstion/home_screen/widgets/user_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(readDataFromJson());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              onChanged: (term) =>
                  context.read<HomeBloc>().add(SearchTermChanged(term)),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
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
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is jsonDataReadingState) {
                    if (state.isReading == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else if (state is jsonDataRState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.userDataList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                              childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return UserGridItem(
                          url: state.userDataList[index].image,
                          name: state.userDataList[index].name,
                          isOnline: state.userDataList[index].isOnline,
                          email: state.userDataList[index].email,
                          mobile: state.userDataList[index].mobile,
                          region: state.userDataList[index].region,
                          zone: state.userDataList[index].zone,
                        );
                      },
                    );
                  }
                  return const Center(child: Text('Something went wrong'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
