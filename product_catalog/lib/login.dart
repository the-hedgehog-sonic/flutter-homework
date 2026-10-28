import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget
{
  const Login({super.key});

  @override
  State<Login> createState()
  {
    return _LoginState();
  }

}

class _LoginState extends State<Login>
{
  final TextEditingController _controller = TextEditingController();
  String userName = 'Guest';

  void _login()
  {
    final typed = _controller.text.trim();
    userName = typed.isEmpty ? 'Guest' : typed;

    //Navigator.pushNamed(context, '/products', arguments: userName);
    context.goNamed('products', queryParameters: {'user': userName});
  }

  @override
  void initState()
  {
    super.initState();
    print('init state: login page.');
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    print('change dependencies: login page.');
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450, maxHeight: 400),
          child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: 450,
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //Add a message at the top left later
                  //Text('Welcome', style: Theme.of(context).textTheme.headlineMedium),

                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => _login(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            )
          ),
        )
    );
  }

  @override
  void deactivate()
  {
    print('deactivate: login page.');
    super.deactivate();
  }

  @override
  void dispose()
  {
    print('dispose: login page.');
    _controller.dispose();
    super.dispose();
  }
}