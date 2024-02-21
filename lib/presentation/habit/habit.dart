import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urdentist/data/repository/daily_task.dart';
import 'package:urdentist/presentation/chooseProfile/profile_controller.dart';
import 'package:urdentist/presentation/homepage/homepage.dart';

import 'package:go_router/go_router.dart';
import 'package:urdentist/presentation/homepage/recapController.dart';
import 'package:urdentist/presentation/homepage/task_controller.dart';
import 'package:urdentist/route/routes.dart';

// import 'package:urdentist/data/repository/user.dart';
class DoDont {
  final String description;
  final bool status;

  DoDont(
    this.description,
    this.status,
  );
}

class Habit extends StatefulWidget {
  @override
  _HabitState createState() => _HabitState();
}

class _HabitState extends State<Habit> {
  final List<DoDont> doDont = [
    DoDont("Control snacking frequency", true),
    DoDont("Reduce the consumption of sugary foods or drinks", true),
    DoDont("Reduce the consumption of starchy foods", true),
    DoDont("Grit your teeth", false),
    DoDont("Bite on hard objects", false),
  ];

  var profileController = Get.find<ProfileController>();
  var recapController = Get.find<RecapController>();
  var taskController = Get.put(TaskController());
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchRecap();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies changed');
    fetchData();
    fetchRecap();
  }

  Future<void> fetchRecap() async {
    recapController.profileId = profileController.profile.value.id;

    try {
      await recapController.getRecap(onSuccess: (data) {
        recapController.data.value = data;
      }, onFailed: (err) {
        print(err);
      });
    } catch (error) {
      print('$error');
    }
  }

  Future<void> fetchData() async {
    var year = date.year.toString();
    var month = date.month.toString().padLeft(2, '0');
    var day = date.day.toString().padLeft(2, '0');

    taskController.profileId = profileController.profile.value.id;
    taskController.date = "$year-$month-$day";

    try {
      await taskController.getTasks(onSuccess: (tasks) {
        taskController.tasks.value = tasks;
      }, onFailed: (error) {
        print('$error ');
      });

      List<int> taskIds =
          taskController.tasks.map((task) => task.taskId).toList();

      taskController.dailyTasks.value = globalDailyTasks.where((globalTask) {
        return !taskIds.any((taskId) => taskId == globalTask.id);
      }).toList();
    } catch (error) {
      print('$error');
      // Handle the error appropriately
    }
  }

  String selectedBar = 'Daily';
  @override
  Widget build(BuildContext context) {
    // String fullName = UserManager.instance.getFullName();
    // String email = UserManager.instance.getEmail();
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
                        'Habit Tracker',
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
                                selectedBar = 'Daily';
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
                                    color: selectedBar == 'Daily'
                                        ? Colors.blue.shade700
                                        : Colors.transparent,
                                  ), // Border bawah
                                ),
                              ),
                              child: Text(
                                'Daily',
                                style: TextStyle(
                                    color: selectedBar == 'Daily'
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
                              selectedBar = 'Recap';
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
                                  color: selectedBar == 'Recap'
                                      ? Colors.blue.shade700
                                      : Colors.transparent,
                                ), // Border bawah
                              ),
                            ),
                            child: Text(
                              'Recap',
                              style: TextStyle(
                                  color: selectedBar == 'Recap'
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
              selectedBar == "Daily"
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: width * 0.03,
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Obx(() {
                                return Text(
                                  '${recapController.data.value.data[0].periode}',
                                  style: TextStyle(
                                      fontSize: width * 0.03,
                                      color: Colors.grey.shade600),
                                );
                              })
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1.2,
                                    offset: Offset(0, 0.2),
                                  ),
                                ],
                                color: Colors.yellow.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_trophy.png',
                                      width: width * 0.18,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() {
                                          return Text(
                                            '${recapController.data.value.data.first.completedTasks * 5} Exp Points',
                                            style: TextStyle(
                                                color: Colors.blue.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          );
                                        }),
                                        SizedBox(
                                          height: height * 0.008,
                                        ),
                                        Obx(() {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10), // Sesuaikan dengan radius yang diinginkan
                                            child: LinearProgressIndicator(
                                              value: recapController
                                                      .data
                                                      .value
                                                      .data
                                                      .first
                                                      .completedTasks *
                                                  5 /
                                                  100,
                                              backgroundColor: Colors.grey,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(Colors.blue),
                                              minHeight: 15,
                                            ),
                                          );
                                        }),
                                        SizedBox(
                                          height: height * 0.008,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Novice',
                                              style: TextStyle(
                                                  color: Colors.blue.shade800,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04),
                                            ),
                                            Text(
                                              'Master',
                                              style: TextStyle(
                                                  color: Colors.blue.shade800,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Complete daily tasks to increase your points!',
                              style: TextStyle(
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.042),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Upcoming Schedule',
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/upcomingSchedule.png',
                                    width: width * 0.18,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tuesday, 9 January 2024',
                                          style: TextStyle(
                                              color: Colors.blue.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.005,
                                        ),
                                        Text(
                                          'Routine dental and oral examination',
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: Colors.grey.shade600),
                                        ),
                                        SizedBox(
                                          height: height * 0.005,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade50,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Text(
                                            '6 days to go',
                                            style: TextStyle(
                                                fontSize: width * 0.03,
                                                color: Colors.blue.shade600,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'See Details',
                                            style: TextStyle(
                                                fontSize: width * 0.028,
                                                color: Colors.blue.shade600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Task',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                  child: FutureBuilder(
                                future: fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // Widget yang akan ditampilkan setelah fetchData selesai
                                    return Column(
                                      children:
                                          taskController.tasks.map((task) {
                                        return DailyTaskWidget(task, 'habit');
                                      }).toList(),
                                    );
                                  } else {
                                    // Widget atau indikator loading sementara fetchData berjalan
                                    return CircularProgressIndicator();
                                  }
                                },
                              )),
                              Container(
                                  child: FutureBuilder(
                                future: fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Column(
                                      children:
                                          taskController.dailyTasks.map((task) {
                                        task.updateStatus();
                                        return DailyTaskWidget(task, 'habit');
                                      }).toList(),
                                    );
                                  } else {
                                    // Widget atau indikator loading sementara fetchData berjalan
                                    return CircularProgressIndicator();
                                  }
                                },
                              )),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Extra Task',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Do this extra task to increase your daily points',
                                  style: TextStyle(fontSize: width * 0.035),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                  child: FutureBuilder(
                                future: fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // Widget yang akan ditampilkan setelah fetchData selesai
                                    return Column(
                                      children:
                                          taskController.tasks.map((task) {
                                        return ExtraTaskWidget(task);
                                      }).toList(),
                                    );
                                  } else {
                                    // Widget atau indikator loading sementara fetchData berjalan
                                    return CircularProgressIndicator();
                                  }
                                },
                              )),
                              Container(
                                  child: FutureBuilder(
                                future: fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Column(
                                      children:
                                          taskController.dailyTasks.map((task) {
                                        task.updateStatus();
                                        return ExtraTaskWidget(task);
                                      }).toList(),
                                    );
                                  } else {
                                    // Widget atau indikator loading sementara fetchData berjalan
                                    return CircularProgressIndicator();
                                  }
                                },
                              )),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Do and Don't",
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                width: width * .85,
                                child: Column(
                                  children: doDont.map((item) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          bottom: height * 0.01),
                                      child: Row(
                                        children: [
                                          item.status
                                              ? Image.asset(
                                                  'assets/images/ThumbsUp.png',
                                                  width: width * 0.05,
                                                )
                                              : Image.asset(
                                                  'assets/images/ThumbsDown.png',
                                                  width: width * 0.05,
                                                ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Flexible(
                                            child: Text(
                                              item.description,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: height * 0.7,
                      child: ListView.builder(
                        itemCount: recapController.data.value.data.length,
                        itemBuilder: (context, index) {
                          var data = recapController.data.value.data[index];
                          List<String> periodeParts = data.periode.split(' ');
                          String periodeText =
                              periodeParts.sublist(0, 3).join(' ');
                          String tahunText = periodeParts[3];
                          return GestureDetector(
                            onTap: () {
                              recapController.detailRecap.value = data;
                              GoRouter.of(context)
                                  .go(Routes.RECAPDETAIL_SCREEN);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1.2,
                                    offset: Offset(0, 0.2),
                                  ),
                                ],
                                color: Colors.blue.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/recap.png',
                                        width: width * 0.22,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              periodeText,
                                              style: TextStyle(
                                                color: Colors.blue.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.008,
                                            ),
                                            Text(
                                              tahunText,
                                              style: TextStyle(
                                                color: Colors.blue.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 35,
                                        color: Colors.blue.shade800,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))
            ],
          ),
        ));
  }
}

class ExtraTaskWidget extends StatefulWidget {
  var task;

  ExtraTaskWidget(this.task);

  @override
  _ExtraTaskWidgetState createState() => _ExtraTaskWidgetState();
}

class _ExtraTaskWidgetState extends State<ExtraTaskWidget> {
  var taskController = Get.put(TaskController());
  _HabitState habit = _HabitState();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return widget.task.profileId == 0
        ? widget.task.id == 2 || widget.task.id == 5
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                margin: EdgeInsets.only(
                  bottom: height * 0.015,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.task.image,
                          width: width * 0.11,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.4,
                          child: Text(
                            widget.task.description,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        !widget.task.status
                            ? setState(() {
                                widget.task.status = true;
                              })
                            : '';
                        taskController.completeTask(
                            taskId: widget.task.id,
                            onSuccess: (msg) {
                              print(msg);
                              habit.fetchData();
                              habit.fetchRecap();
                            },
                            onFailed: (msg) {
                              print(msg);
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: !widget.task.status
                              ? Colors.blue.shade700
                              : Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: !widget.task.status
                                  ? Colors.white
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container()
        : widget.task.taskId == 2 || widget.task.taskId == 5
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                margin: EdgeInsets.only(
                  bottom: height * 0.015,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.task.taskId == 2
                              ? 'assets/images/task2.png'
                              : widget.task.taskId == 5
                                  ? 'assets/images/task5.png'
                                  : '',
                          width: width * 0.11,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: width * 0.4,
                          child: Text(
                            widget.task.nama,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container();
  }
}
