import 'package:flutter/material.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/details.png'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Chicken skewers with\nslices peppers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('\$20',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),)
                    ],
                  ),
                  SizedBox(height: 5,),

                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc volutpat lobortis egestas viverra magna sed nam. Massa, magna vestibulum, ut neque, sagittis aliquet non sed semper view more'),
                  SizedBox(height: 10,),
                 Divider(),
                  SizedBox(height: 10,),
                  Text('Reviews',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                                 leading: Image.asset('assets/image.png'),
                              title: Text('Kristin Watson',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                              subtitle: Text('Good Test'),
                            ),
                            Divider()
                          ],
                        );
                      },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
