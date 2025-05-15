import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String founderStatus;
  final String editedTime;
  final String postText;
  final String postImage;
  final int stars;
  final int comments;

  const PostCard({
    required this.username,
    required this.founderStatus,
    required this.editedTime,
    required this.postText,
    required this.postImage,
    required this.stars,
    required this.comments,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int starsCount;
  bool isStarFilled = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    starsCount = widget.stars;
    isStarFilled = false;
  }

  void toggleStar() {
    setState(() {
      isStarFilled = true;
      starsCount++;

      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          isStarFilled = false;
        });
      });
    });
  }

  // Function to Capture Screenshot & Share
  void share() async {
    final imageFile = await screenshotController.capture();
    if (imageFile != null) {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/post_screenshot.png';
      File(filePath).writeAsBytesSync(imageFile);
      await Share.shareXFiles([
        XFile(filePath),
      ], text: "Hey! Check out this post :-)");
    }
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###');
    final formattedStars = numberFormat.format(starsCount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Screenshot(
          controller: screenshotController,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                // User Info and Post Text
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.username,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3.5),
                                Row(
                                  children: [
                                    Text(
                                      widget.founderStatus,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      "assets/images/followicon.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5),
                                Row(
                                  children: [
                                    Text(
                                      widget.editedTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.circle_outlined,
                                      size: 7.5,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "Edited",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(widget.postText, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                //post image
                Image.asset(
                  widget.postImage,
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text(
                            '$formattedStars Stars',
                            style: TextStyle(
                              color: Color(0xff03045E),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            '${widget.comments} Comments',
                            style: TextStyle(
                              color: Color(0xff03045E),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.lightBlue[200], thickness: 1),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: toggleStar,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  isStarFilled ? Icons.star : Icons.star_border,
                  key: ValueKey<bool>(isStarFilled),
                  color: isStarFilled ? Colors.yellow : Color(0xff03045E),
                  size: 30,
                ),
              ),
            ),
            Image.asset("assets/images/commenticon.png", height: 21, width: 21),
            InkWell(
              onTap: share,
              child: Image.asset(
                "assets/images/shareicon.png",
                height: 24,
                width: 22,
              ),
            ),
          ],
        ),

        Divider(color: Colors.lightBlue[200], thickness: 1),
      ],
    );
  }
}
