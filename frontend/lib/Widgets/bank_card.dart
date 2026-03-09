import 'package:flutter/material.dart';

Widget bankCard(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.sizeOf(context).height * .26,
          width: MediaQuery.sizeOf(context).width * .66,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: [Color(0xffE27BC1), Color(0xffFF5500)])),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Text(
                  "VISA",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Icon(
                      Icons.done,
                    )),
              ),
              Text("    *** *** *** 965",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              Text("    7/25",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.sizeOf(context).height * .26,
            width: MediaQuery.sizeOf(context).width * .66,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                    colors: [Color(0xffA280C1), Color(0xff4D0A8E)])),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text(
                    "VISA",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Icon(
                        Icons.done,
                      )),
                ),
                Text("    *** *** *** 779",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Text("    7/25",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))
              ],
            )),
      ],
    ),
  );
}
