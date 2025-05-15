import 'package:catalift_clone/widgets/app_bar.dart';
import 'package:catalift_clone/widgets/bottom_nav.dart';
import 'package:catalift_clone/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22, left: 16, right: 42),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xffB1B1CD)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffB1B1CD),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Image.asset(
                  "assets/images/plusicon.png",
                  width: 34,
                  height: 30,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                PostCard(
                  username: "Akhilesh Yadav",
                  founderStatus: "Founder at Google",
                  editedTime: "1d",
                  postText:
                      "The Briggs-Rauscher Reaction: A Mesmerizing Chemical Dance 🌈\n\n"
                      "This captivating process uses hydrogen peroxide, potassium iodate, malonic acid, manganese sulfate, and starch.\n"
                      "lodine and iodate ions interact to form compounds that shift the solution's color, while starch amplifies the blue color before it breaks down and starts again.💡\n\n"
                      "Follow @Science for more",
                  postImage: "assets/images/postpicture.png",
                  stars: 1546,
                  comments: 80,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
