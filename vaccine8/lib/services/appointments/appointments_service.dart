import 'package:vaccine8/models/appointment.dart';
import 'package:vaccine8/models/user.dart';

abstract class AppointmentService {
  Future<List<Appointment>> getPcrAppoinments(int userId);
  Future<List<Appointment>> getVacAppoinments(int userId);
  Future<List<Appointment>> getAllAppoinments();
  Future<User> getUserById(int userId);

  Future<Appointment> updateApp(Appointment appointment);
}
