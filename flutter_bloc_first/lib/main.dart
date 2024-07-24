import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/bloc/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text(
                    state.count.toString(),
                    style: const TextStyle(fontSize: 52.0),
                  );
                } else if (state is CounterIncrementState) {
                  return Text(
                    state.incCount.toString(),
                    style: const TextStyle(fontSize: 52.0),
                  );
                } else if (state is CounterDecrementState) {
                  return Text(
                    state.decCount.toString(),
                    style: const TextStyle(fontSize: 52.0),
                  );
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                if (state is CounterIncrementState) {
                  if (state.incCount == 3) {
                    var snackBar =
                        const SnackBar(content: Text("counter incremente"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else if (state is CounterDecrementState) {
                  if (state.decCount == 3) {
                    var snackBar =
                        const SnackBar(content: Text("counter Decremente"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementEvent(incCount: counter++));
            },
            child: Icon(Icons.add),
            heroTag: 'Increment',
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementEvent(decCount: counter--));
            },
            child: Icon(Icons.remove),
            heroTag: 'Decrement',
          ),
        ],
      ),
    );
  }
}

//BlocListener and BlocBuilder

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CounterBloc, CounterState>(
//       listener: (context, state) {
//         if (state is CounterIncrementState) {
//           if (state.incCount == 3) {
//             var snackBar = const SnackBar(content: Text("counter incremente"));
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           }
//         }
//         else if (state is CounterDecrementState) {
//           if (state.decCount == 3) {
//             var snackBar = const SnackBar(content: Text("counter Decremente"));
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           }
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
//                 if (state is CounterInitialState) {
//                   return Text(
//                     state.count.toString(),
//                     style: const TextStyle(fontSize: 52.0),
//                   );
//                 } else if (state is CounterIncrementState) {
//                   return Text(
//                     state.incCount.toString(),
//                     style: const TextStyle(fontSize: 52.0),
//                   );
//                 } else if (state is CounterDecrementState) {
//                   return Text(
//                     state.decCount.toString(),
//                     style: const TextStyle(fontSize: 52.0),
//                   );
//                 } else {
//                   return Container();
//                 }
//               }),
//             ],
//           ),
//         ),
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 BlocProvider.of<CounterBloc>(context)
//                     .add(IncrementEvent(incCount: counter++));
//               },
//               child: Icon(Icons.add),
//               heroTag: 'Increment',
//             ),
//             SizedBox(
//               width: 10.0,
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 BlocProvider.of<CounterBloc>(context)
//                     .add(DecrementEvent(decCount: counter--));
//               },
//               child: Icon(Icons.remove),
//               heroTag: 'Decrement',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
