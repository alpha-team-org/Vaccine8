import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

abstract class AppointmentService {

Future<List<Appointment>> getPcrAppoinments(int userId);
Future<List<Appointment>> getVacAppoinments(int userId);
Future<List<Appointment>> getAllAppoinments();
Future<User> getUserById(int userId);

Future<Appointment> updateApp(Appointment appointment);




}