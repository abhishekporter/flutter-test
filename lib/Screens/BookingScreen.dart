import 'package:flutter/material.dart';
import 'package:fluttering/Screens/SelectPackage.dart';
import 'package:fluttering/core/domain/entities/Availability.dart';
import 'package:fluttering/core/domain/entities/DoctorDetails.dart';
import 'package:fluttering/widgets/DoctorWidget.dart';


class BookingScreen extends StatefulWidget {
  final DoctorDetails doctorDetail;

  const BookingScreen({super.key, required this.doctorDetail});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectTime = DateTime.now();
  int selected = 0;
  int slotIndex = 0;

  List<DateTime> formatSlots() {
    List<DateTime> res = [];

    return res;
  }
  String getMonthName(int month){
    List<String> months=['Jan','Feb','March','April','May','June','July','Aug','Sept','Oct','Nov','Dec'];
    return months[month-1];
  }

  @override
  Widget build(BuildContext context) {
    Availabilty selectedAvailabilty=Availabilty(dateTime: widget.doctorDetail.availability[selected].dateTime, slots:[ ]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Booking Screen",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
        child: Column(
          children: [
            DoctorWidget(doctorDetails: widget.doctorDetail),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent.shade100,
                        radius: MediaQuery.of(context).size.width * 0.1,
                        child: const Icon(
                          Icons.people,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // const Icon(Icons.people),
                    Text("${widget.doctorDetail.patientsServed}+",style: const TextStyle(color: Colors.blue),),
                    const Text("Patients",style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent.shade100,
                        radius: MediaQuery.of(context).size.width * 0.1,
                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // const Icon(Icons.people),
                    Text("${widget.doctorDetail.yearsOfExperience}+",style: TextStyle(color: Colors.blue),),
                    const Text("Experience",style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent.shade100,
                        radius: MediaQuery.of(context).size.width * 0.1,
                        child: const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // const Icon(Icons.people),
                    Text("${widget.doctorDetail.rating}+",style: TextStyle(color: Colors.blue),),
                    const Text("Rating",style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent.shade100,
                        radius: MediaQuery.of(context).size.width * 0.1,
                        child: const Icon(
                          Icons.reviews,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // const Icon(Icons.people),
                    Text("${widget.doctorDetail.numberOfReviews}+",style: TextStyle(color: Colors.blue),),
                    const Text("Reviews",style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
            const Text("Book Appointment",style: TextStyle(color: Colors.grey),),
            const Row(
              children: [
                Text("Day",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
              ],
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                  itemCount: widget.doctorDetail.availability.length,
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 80,
                      height: 20,
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

                        tileColor: selected==index ? Colors.blue : Colors.white,
                        title: Text(
                           "${widget
                               .doctorDetail.availability[index].dateTime.day} ${getMonthName(widget
                               .doctorDetail.availability[index].dateTime.month)}",
                          style: TextStyle(
                            color: selected==index ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                      ),
                    );
                  }),
            ),
            const Row(
              children: [
                Text("Time",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  itemCount: widget.doctorDetail.availability
                      .firstWhere((element) =>
                          element == widget.doctorDetail.availability[selected])
                      .slots
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 80,
                      height: 30,
                      child: ListTile(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

                        tileColor: selected==index ? Colors.blue : Colors.white,
                          title: Text(widget.doctorDetail.availability[selected]
                              .slots[index].start
                              .toInt()
                              .toString(),
                            style: TextStyle(
                                color: selected==index ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
                        onTap: (){
                            setState(() {
                              slotIndex=index;

                            });
                        },
                      ),
                    );
                    // );
                  }),
            ),
            const Spacer(),
            const Divider(),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.3))),
                onPressed: () {
                  try{
                    selectedAvailabilty=Availabilty(dateTime: widget.doctorDetail.availability[selected].dateTime, slots:[ widget.doctorDetail.availability[selected]
                        .slots[slotIndex]]);
                  }
                  catch(e){
                    return;
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectPackage(
                            doctorDetails: widget.doctorDetail,
                        availabilty: selectedAvailabilty,
                          )));
                },
                child: const Text("Make Appointment",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
