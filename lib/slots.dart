import 'package:flutter/material.dart';

class Slot extends StatefulWidget {
  final List slots;
  const Slot({Key? key,  required this.slots}) : super(key: key);

  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Slots',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width : MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount:widget.slots.length ,
          itemBuilder:(context,index){
            return Container(
              margin: const EdgeInsets.all(10 ),
              color: Colors.grey.shade800,
              padding: const  EdgeInsets.all(10),
              height: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Center ID -'+ widget.slots[index]['center_id'].toString(),
                  style: const TextStyle(
                      fontSize:18,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text('Center Name -'+ widget.slots[index]['name'].toString(),
                    style: const TextStyle(
                        fontSize:18,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Center Address -'+ widget.slots[index]['address'].toString(),
                    style: const TextStyle(
                      fontSize:18,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,

                    ),
                  ),
                  // const Divider(),
                  Text('Vaccine -'+ widget.slots[index]['vaccine'].toString(),
                    style: const TextStyle(
                      fontSize:18,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Divider(),
                  Text('Slots -'+ widget.slots[index]['slots'].toString(),
                    style: const TextStyle(
                      fontSize:18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          }),
      ),
    );
  }
}

