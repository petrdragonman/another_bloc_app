import 'dart:async';

import './employee.dart';
//1 -> imports

class EmployeeBloc{
  // sink to add in pipe
  // stream to get data from pipe

  //2 -> lists or datasets -> employees
  List<Employee> _employeeList = [
    Employee(1, 'petr citizen', 1000.0),
    Employee(2, 'tom citizen', 2000.0),
    Employee(3, 'andrea citizen', 3000.0)
  ];
  // 3 -> stream controllers
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //4 -> stream sink getters
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get empployeeSalaryIncrementSink => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrementSink => _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc(){
    //5 -> contructor -> add data
    _employeeListStreamController.add(_employeeList);
    //5 -> contructor -> listen to changes
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  //6 -> core functions
  _incrementSalary(Employee employee){
    double salary = employee.salary;
    double incrementedSalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee){
    double salary = employee.salary;
    double decrementedSalary = salary * 20/100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  //7 -> dispose
  void dispose(){
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }
}
  



