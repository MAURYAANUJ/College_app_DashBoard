import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'CarouselWithDotsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1498243691581-b145c3f54a5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29sbGVnZSUyMGNhbXB1c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1606761568499-6d2451b23c66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29sbGVnZSUyMGNhbXB1c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1607237138185-eedd9c632b0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 00, right: 00),
              child: Container(
                height: 90.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [BoxShadow(blurRadius: 10.0)],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 4, top: 33),
                            child: Text(
                              "Dashboard",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 9.0, left: 140),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                      ),
                      child: TextButton(
                          child: const CircleAvatar(
                            radius: (25),
                            backgroundImage:
                                AssetImage('assets/images/child-children.jpg'),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CarouselWithDotsPage(imgList: imgList),
            const SizedBox(
              height: 0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'The upcoming event',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  subtitle: Text('Maths weekly class test.'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Container(height: 70, child: GridDashboard()),
            SizedBox(height: 280, child: Gridboard()),
          ],
        ),
      ),
    );
  }
}
class GridDashboard extends StatelessWidget {
  Items item1 = Items(
    title: "Calendar",
    subtitle: "Book",
    event: "3 Events",
    img: "assets/images/albert.svg",
    //page: Mybookss(),
  );

  Items item2 = Items(
    title: "Groceries",
    subtitle: "Faculty",
    event: "4 Items",
    img: "assets/images/albert.svg",
    //page: Myfaculty(),
  );

  GridDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
    ];
    var color = 0xFFFFFFFF;

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Flexible(
        child: GridView.count(
            childAspectRatio: 2.5,
            padding: const EdgeInsets.only(left: 17, right: 17),
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            children: myList.map((data) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(color),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: SvgPicture.asset(
                                data.img,
                                width: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2, top: 2),
                            child: Text(
                              data.subtitle,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (data.page != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => data.page!));
                  }
                },
              );
            }).toList()),
      ),
    );
  }
}

class Gridboard extends StatelessWidget {
  Items item1 = Items(
    title: "Calendar",
    subtitle: "About",
    event: "3 Events",
    img: "assets/images/school-svgrepo-com.svg",
    //page: Mybookss(),
  );
  Items item2 = Items(
    title: "Groceries",
    subtitle: "Profile",
    event: "4 Items",
    img: "assets/images/profile.svg",
    //page: Myfaculty(),
  );
  Items item3 = Items(
    title: "Locations",
    subtitle: "Notice",
    event: "",
    img: "assets/images/note-svgrepo-com.svg",
    //page: Mymessage(),
  );
  Items item4 = Items(
    title: "Activity",
    subtitle: "Documents",
    event: "",
    img: "assets/images/documents-svgrepo-com.svg",
    //page: Mysupport(),
  );
  Items item5 = Items(
    title: "To do",
    subtitle: "Library",
    event: "4 Items",
    img: "assets/images/library-svgrepo-com.svg",
    //page: Mytest(),
  );
  Items item6 = Items(
    title: "Settings",
    subtitle: "Test",
    event: "2 Items",
    img: "assets/images/test.svg",
    //page: Mycalender(),
  );
  Items item7 = Items(
    title: "Settings",
    subtitle: "Time table",
    event: "2 Items",
    img: "assets/images/clock-svgrepo-com.svg",
    //page: Myabout(),
  );
  Items item8 = Items(
    title: "Settings",
    subtitle: "Attendance",
    event: "2 Items",
    img: "assets/images/Attendance.svg",
    // page: Myattendance(),
  );

  Gridboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8
    ];
    var color = 0xFFFFFFFF;

    return Flexible(
      child: GridView.count(
          scrollDirection: Axis.vertical,
          childAspectRatio: 1.4,
          padding: const EdgeInsets.only(left: 18, right: 18),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 6,
          children: myList.map((data) {
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Card(
                  elevation: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3, bottom: 3),
                            child: SvgPicture.asset(
                              data.img,
                              width: 35,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2, top: 2),
                          child: Text(
                            data.subtitle,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (data.page != null) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => data.page!));
                }
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Widget? page;

  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img,
      this.page});
}
