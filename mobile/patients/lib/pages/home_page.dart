import 'package:flutter/material.dart';
import 'package:patients/components/appointments_list.dart';
import 'package:patients/components/patients_list.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

const int patientsPage = 0;
const int appointmentsPage = 1;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  int _selectedPage = 0;
  final List<Widget> _pages = [
    PatientsList(),
    AppointmentsList()
  ];

  FloatingActionButton getFAB(BuildContext context) {

    String label = '';
    late Icon icon; 

    switch (_selectedPage) {
      case patientsPage:
        label = 'Create patient';
        icon = const Icon(Icons.person);
      case appointmentsPage:
        label = 'Create appointment';
        icon = const Icon(Icons.event);
    }

    return FloatingActionButton.extended(
      onPressed: () => {}, 
      label: Text(label),
      icon: icon,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    ); 
  }

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
      appBar: AppBar(
        title: const Text('Home Page'),
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
      floatingActionButton: getFAB(context),
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