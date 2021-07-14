import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/user.dart';

abstract class AppointmentService {
  Future<List<Appointment>> getPcrAppoinments(dynamic userId);
  Future<List<Appointment>> getVacAppoinments(dynamic userId);
  Future<List<Appointment>> getAllAppoinments();
  Future<User> getUserById(dynamic userId);

  Future<Appointment> updateApp(Appointment appointment);
}
