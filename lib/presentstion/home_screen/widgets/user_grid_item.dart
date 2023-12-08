
import 'package:flutter/material.dart';

class UserGridItem extends StatelessWidget {
  final String url, name, email, region, mobile, zone;
  final bool isOnline;
  const UserGridItem({
    super.key,
    required this.url,
    required this.name,
    required this.email,
    required this.region,
    required this.mobile,
    required this.zone,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(url),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          isOnline ? Colors.greenAccent : Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey[100],
                ),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(email,
                        style: const TextStyle(
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '$region $mobile',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                zone,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}
