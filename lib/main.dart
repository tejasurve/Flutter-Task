import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/blocs/content/content_bloc_bloc.dart';
import 'package:flutter_task/resources/utils/layout.dart';
import 'package:flutter_task/service_locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.instance.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ContentBlocBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late ContentBlocBloc contentBlocBloc;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentBlocBloc = context.read<ContentBlocBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: rSize(context, 32),
            ),
            ElevatedButton(
              onPressed: () {
                contentBlocBloc.add(const FetchContentData());
              },
              child: const Text('Fetch Content'),
            ),
            SizedBox(
              height: rSize(context, 32),
            ),
            BlocBuilder<ContentBlocBloc, ContentBlocState>(
              builder: (context, state) {
                if (state is ContentBlocLoaded) {
                  return Text("Loaded");
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
