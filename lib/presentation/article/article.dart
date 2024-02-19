import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urdentist/route/routes.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Article',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: height * 0.27,
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, top: 20),
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(width * 0.08),
                              bottomRight: Radius.circular(width * 0.08),
                            ),
                          ),
                        )
                      ],
                    )),
                Positioned(
                  top: height * 0.02,
                  left: width * 0.05,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/article.jpg',
                        width: width * 0.9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Oral Health',
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Healthy teeth, healthy smile.',
                      style: TextStyle(
                          fontSize: width * 0.055, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: width * 0.05,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        '6 January 2024',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Healthy teeth are essential for overall health and well-being. They help us to chew food, speak clearly, and maintain a healthy appearance. A healthy smile can also boost our confidence and self-esteem.'
                      '\n\nThere are many things we can do to keep our teeth healthy. Brushing twice a day with a soft-bristled toothbrush and fluoride toothpaste is essential. We should also floss once a day to remove plaque and food particles from between our teeth. Regular dental checkups are also important to detect and treat any problems early.'
                      '\n\nHere are some tips for maintaining healthy teeth:\n'
                      '• Brush your teeth for two minutes, twice a day with a soft-bristled toothbrush and fluoride toothpaste.\n'
                      '• Floss once a day to remove plaque and food particles from between your teeth.\n'
                      '• Visit your dentist for regular checkups and cleanings.\n'
                      '• Limit your intake of sugary drinks and snacks.\n'
                      '• Eat a healthy diet that includes plenty of fruits, vegetables, and whole grains.\n'
                      '\nBy following these tips, we can help to keep our teeth healthy and our smile bright for years to come.',
                      style: TextStyle(
                          fontSize: width * 0.035, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
