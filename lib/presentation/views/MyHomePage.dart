import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Injection.dart';
import 'package:untitled/presentation/apps/SubApp.dart';
import 'package:untitled/presentation/blocs/login_bloc/login_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = di<LoginBloc>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: BlocProvider(
            create: (_) => _loginBloc,
            child: Column(
              children:  const [
                BodyWidget(),
              ],
            ),
          ),
        ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {

      if (state is LoginProgress) {
        return Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        );
      } else if (state is LoginSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubApp(name: state.user.name),
          ),
        );
        return Container(color: Colors.red,    width: 100,
          height: 100,);
      } else if (state is LoginFail) {
        return Container(color: Colors.amber,    width: 100,
          height: 100,);
      } else if (state is LoginInitial) {
        return Container(color: Colors.green,    width: 100,
          height: 100,
          padding: const EdgeInsets.all(30),
          child: RaisedButton(onPressed: () {
          context.read<LoginBloc>().add(ButtonPressedEvent(id: 'id', pwd: 'pwd'));
        },),);
      } else {
        return Container(color: Colors.black,    width: 100,
          height: 100,);
      }
    },);
  }
}
