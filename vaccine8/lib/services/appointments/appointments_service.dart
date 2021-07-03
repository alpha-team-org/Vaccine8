import 'package:vaccine8/models/Appointment.dart';

abstract class AppointmentService {

Future<List<Appointment>> getPcrAppoinments(int userId);
Future<List<Appointment>> getVacAppoinments(int userId);

Future<Appointment> updateapp(Appointment appointment);




}