// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:malhar_2023/data/data.dart';
import 'package:malhar_2023/login_page.dart';

import 'models/date_model.dart';
import 'models/event_type_model.dart';
import 'models/events_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DateModel> dates = [];
  List<EventTypeModel> eventsType = [];
  List<EventsModel> events = [];

  String todayDateIs = "12";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dates = getDates();
    eventsType = getEventTypes();
    events = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 32, 3, 48)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: <Widget>[
                  //     // Image.asset("assets/logo.png",height: 28,),
                  //     // SizedBox(width: 8,),
                  //     // Row(
                  //     //   children: <Widget>[
                  //     //     Text("UVE", style: TextStyle(
                  //     //       color: Colors.white,
                  //     //       fontSize: 22,
                  //     //       fontWeight: FontWeight.w800
                  //     //     ),),
                  //     //     Text("UVE", style: TextStyle(
                  //     //         color: Color(0xffFCCD00),
                  //     //         fontSize: 22,
                  //     //         fontWeight: FontWeight.w800
                  //     //     ),)
                  //     //   ],
                  //     // ),
                  //     const Spacer(),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           print("clicked");
                  //           Navigator.of(context).pushReplacement(
                  //             MaterialPageRoute(
                  //               builder: (context) => LoginPage(),
                  //             ),
                  //           );
                  //         },
                  //         child: Icon(Icons.login)),
                  //     // const SizedBox(
                  //     //   width: 16,
                  //     // ),
                  //     // Image.asset(
                  //     //   "assets/menu.png",
                  //     //   height: 22,
                  //     // )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello, User!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Let's explore what’s happening nearby",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3, color: const Color(0xffFAE072)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/profilepic.jpg",
                              height: 40,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Dates
                  Container(
                    height: 60,
                    child: ListView.builder(
                        itemCount: dates.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DateTile(
                            weekDay: dates[index].weekDay,
                            date: dates[index].date,
                            isSelected: todayDateIs == dates[index].date,
                          );
                        }),
                  ),

                  /// Events
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "All Events",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        itemCount: eventsType.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return EventTile(
                            imgAssetPath: eventsType[index].imgAssetPath,
                            eventType: eventsType[index].eventType,
                          );
                        }),
                  ),

                  /// Popular Events
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Popular Events",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                              itemCount: events.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return PopularEventTile(
                                  desc: events[index].desc,
                                  imgeAssetPath: events[index].imgeAssetPath,
                                  date: events[index].date,
                                  address: events[index].address,
                                );
                              }),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class DateTile extends StatelessWidget {
  String weekDay;
  String date;
  bool isSelected;
  DateTile(
      {required this.weekDay, required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFCCD00) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            weekDay,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  String imgAssetPath;
  String eventType;
  EventTile({required this.imgAssetPath, required this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 173, 107, 179),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imgAssetPath,
            height: 27,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            eventType,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class PopularEventTile extends StatelessWidget {
  String desc;
  String date;
  String address;
  String imgeAssetPath;

  /// later can be changed with imgUrl
  PopularEventTile(
      {required this.address,
      required this.date,
      required this.imgeAssetPath,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 161, 78, 142),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/calender.png",
                        height: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        date,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/location.png",
                        height: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        address,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: Image.asset(
                imgeAssetPath,
                height: 100,
                width: 120,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
