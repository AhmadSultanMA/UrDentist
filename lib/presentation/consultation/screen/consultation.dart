import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/authentication/screen/register.dart';
import 'package:urdentist/presentation/consultation/question_controller.dart';
import 'package:urdentist/route/routes.dart';
// import 'package:urdentist/data/repository/user.dart';

// import 'package:urdentist/data/repository/user.dart';

class Consultation extends StatefulWidget {
  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  late QuestionController questionController = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
    questionController.getQuestionAll(
      onSuccess: (data) {
        questionController.questions.value = data;
      },
      onFailed: (error) {
        showMySnackbar(context, error);
      },
    );
  }

  String selectedBar = 'Expert';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1.2,
                      offset: Offset(0, 0.2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.03),
                      alignment: Alignment.center,
                      child: Text(
                        'Consultation',
                        style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBar = 'Expert';
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  right: width * 0.05, left: width * 0.05),
                              padding: EdgeInsets.only(bottom: height * 0.01),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: selectedBar == 'Expert'
                                        ? Colors.blue.shade700
                                        : Colors.transparent,
                                  ), // Border bawah
                                ),
                              ),
                              child: Text(
                                'Ask an Expert',
                                style: TextStyle(
                                    color: selectedBar == 'Expert'
                                        ? Colors.blue.shade700
                                        : Colors.grey.shade500,
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBar = 'Dentist';
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.05),
                            padding: EdgeInsets.only(bottom: height * 0.01),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: selectedBar == 'Dentist'
                                      ? Colors.blue.shade700
                                      : Colors.transparent,
                                ), // Border bawah
                              ),
                            ),
                            child: Text(
                              'Find Dentist',
                              style: TextStyle(
                                  color: selectedBar == 'Dentist'
                                      ? Colors.blue.shade700
                                      : Colors.grey.shade500,
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
              selectedBar == "Expert"
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.03)),
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search for Questions',
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .go(Routes.CREATEQUESTION_SCREEN);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * 0.02),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                    size: width * 0.1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: height * 0.04,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.blue.shade700,
                                    ),
                                    child: const Text(
                                      'All',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue.shade700,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Text(
                                      'Prevention',
                                      style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue.shade700,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Text(
                                      'Caries',
                                      style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue.shade700,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Text(
                                      'Fluoride',
                                      style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.02),
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue.shade700,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Text(
                                      'Cleaning',
                                      style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Latest Questions',
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: height * 0.52,
                            child: Obx(() {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      questionController.questions.length,
                                  itemBuilder: (context, index) {
                                    var question =
                                        questionController.questions[index];
                                    return GestureDetector(
                                      onTap: () {
                                        questionController.getQuestionId(
                                            questionId: question.id,
                                            onSuccess: (data) {
                                              questionController
                                                  .question.value = data;
                                              GoRouter.of(context)
                                                  .go(Routes.ANSWER_SCREEN);
                                            },
                                            onFailed: (msg) {
                                              showMySnackbar(context, msg);
                                            });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: height * 0.02,
                                            right: 10,
                                            left: 10,
                                            top: index == 0 ? 10 : 0),
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            left: 6,
                                            right: 10),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 1.2,
                                                offset: Offset(0, 0.2),
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${question.createdAt.day} ${question.createdAt.month} ${question.createdAt.year}',
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: width *
                                                                  0.035),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        Text(
                                                          '${question.createdAt.hour}.${question.createdAt.minute}',
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: width *
                                                                  0.035),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.008,
                                                    ),
                                                    Text(
                                                      question.question,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              width * 0.038),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.002,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 3,
                                                          horizontal: 8),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .blue.shade50,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Text(
                                                        question.tag,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.03,
                                                            color: Colors
                                                                .blue.shade600,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                question.answer != ""
                                                    ? Image.asset(
                                                        'assets/images/verified.png',
                                                        width: width * 0.05,
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: width * 0.05,
                              ),
                              SizedBox(width: width * 0.01),
                              Text('Lokasi di ',
                                  style: TextStyle(fontSize: width * 0.04)),
                              Text('Malang',
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.keyboard_arrow_down,
                                  size: width * 0.055),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.03)),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Find a Dentist',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: height * 0.04,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        padding: EdgeInsets.only(
                                            left: width * 0.03,
                                            right: width * 0.03),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.blue.shade700,
                                        ),
                                        child: const Text(
                                          'All',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        padding: EdgeInsets.only(
                                            left: width * 0.03,
                                            right: width * 0.03),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue.shade700,
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Text(
                                          'Paediatric',
                                          style: TextStyle(
                                              color: Colors.blue.shade700,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        padding: EdgeInsets.only(
                                            left: width * 0.03,
                                            right: width * 0.03),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue.shade700,
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Text(
                                          'Endodontics',
                                          style: TextStyle(
                                              color: Colors.blue.shade700,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .go(Routes.DETAILDENTIST_SCREEN);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.01),
                                  padding: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1.2,
                                        offset: Offset(0, 0.2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'assets/images/drLuna2.png',
                                          width: width * 0.25,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.03),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Dr Luna Claw',
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // SizedBox(
                                            //   height: height * 0.005,
                                            // ),
                                            Text(
                                              'Saiful Anwar Hospital',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: width * 0.03,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.01),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 3,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.blue.shade50,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Text(
                                                    'Paediatric',
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: Colors
                                                            .blue.shade600,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: width * 0.055,
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Text(
                                                  '4.9',
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    'start from',
                                                    style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    'Rp 25.000',
                                                    style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color:
                                                          Colors.blue.shade700,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ));
  }
}
