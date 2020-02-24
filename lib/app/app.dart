import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

class HappyTestingApp extends StatefulWidget {
  final Repository repository;

  const HappyTestingApp(this.repository, {Key key})
      : assert(repository != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _HappyTestingApp();
}

class _HappyTestingApp extends State<HappyTestingApp> {
  var _incrementValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Happy Testing!'),
        ),
        body: FutureBuilder<IncrementWithMessage>(
          future: widget.repository.getIncrementMessage(_incrementValue),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return _LoadingIndicator();
            if (snapshot.hasData) return _SuccessMessage(snapshot.data);
            return _ErrorMessage();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _incrementValue++;
            });
          },
        ),
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  final IncrementWithMessage incrementWithMessage;

  _SuccessMessage(this.incrementWithMessage, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Value: ${incrementWithMessage.value}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '${incrementWithMessage.message}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Something went wrong'));
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
