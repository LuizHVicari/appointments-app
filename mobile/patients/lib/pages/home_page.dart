import 'package:flutter/material.dart';
import 'package:patients/components/appointments_list.dart';
import 'package:patients/components/patients_list.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/view_models/home_view_model.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  int _selectedPage = 0;
  final List<Widget> _pages = [
    const PatientsList(),
    AppointmentsList()
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<HomeViewModel>(context, listen: false).getUserInfo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 5,
        shadowColor: Theme.of(context).colorScheme.surfaceBright,
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) => {
          setState(() {
            _selectedPage = index;
          })
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups), 
            label: 'Patients'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), 
            label: 'Appointments'
          )
        ]
      ),
      floatingActionButton: Provider.of<HomeViewModel>(context, listen: false).buildFab(context, _selectedPage),
      drawer: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Drawer(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(pagePadding, 48, pagePadding, pagePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.user?.name ?? '', 
                    style: const TextStyle(fontSize: fontBig)
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      viewModel.logout(context);
                    }, 
                    child: const Text('Logout', style: TextStyle(fontSize: fontMedium),)
                  )
                ],
              ),
            )
          );
        }
      ),
      body:  Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: _pages.elementAt(_selectedPage) 
      ),
    );
  }
}