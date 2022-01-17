import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_project/api_helper/nasa_helper.dart';
import 'package:tutorial_project/cubits/nasa_cubit.dart';

//import 'package:random_date/random_date.dart';
//import 'package:intl/intl.dart';
import 'constants/apod_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NasaCubit>(create: (context) => NasaCubit()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NasaHelper _helper = NasaHelper();
  //late ApodModel _model;
  ApodModel _model= ApodModel();

  @override
  void initState() {
    //Initstate means that it runs before the page has loaded
    super.initState();
    makeModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NasaCubit, NasaState>(
      builder: (context, state) {
        if(state is NasaLoading)
          {
            return const CircularProgressIndicator() ;
          }
        if(state is NasaError)
          {
            print(state.error) ;
          }
        return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 100),
                //! at the end of the line means that the value cannot be null
                Container(
                  margin: const EdgeInsets.all(32),
                  child: Image.network(
                    _model.url ?? '',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress?.expectedTotalBytes !=
                          loadingProgress?.cumulativeBytesLoaded) {
                        return const CircularProgressIndicator();
                      } else {
                        return child;
                      }
                    },
                  ),
                ),


                TextButton(
                  onPressed: () {},
                  child: Text('Press for picture'),
                )
              ],
            ));
      },
    );
  }

  makeModel() async {
    _model = await _helper.getPicture('2020-01-05');
    //getRandonDate();
    //Setstate refreshes the page and it is resource intensive
    setState(() {});
  }
/*
  String getRandonDate(){
    var dateTime = RandomDate.withRange(2000, 2010).random();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm'). format(dateTime);
    return formattedDate;
    print(formattedDate) ;
}*/

}

