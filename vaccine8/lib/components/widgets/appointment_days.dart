import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/day_card.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

class AppointmentDays extends StatefulWidget {
  final Appointment appointment;
  final Patient patient;
  AppointmentDays(this.appointment, this.patient);

  @override
  _AppointmentDaysState createState() => _AppointmentDaysState();
}

class _AppointmentDaysState extends State<AppointmentDays> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 190,
      child: widget.appointment != null
          ? ListView.separated(
              itemCount: widget.appointment.date.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    widget.patient.pcrAppointment = DateTime.utc(
                        widget.appointment.day.year,
                        widget.appointment.day.month,
                        widget.appointment.day.day,
                        widget.appointment.date[index].hour,
                        widget.appointment.date[index].minute);

                    widget.patient.hasPcrAppointment =
                        !widget.patient.hasPcrAppointment;
                  }),
                  child: DayCard(
                    onTap: () => setState(
                      () {
                        widget.patient.pcrAppointment = DateTime.utc(
                            widget.appointment.day.year,
                            widget.appointment.day.month,
                            widget.appointment.day.day,
                            widget.appointment.date[index].hour,
                            widget.appointment.date[index].minute);

                        widget.patient.hasPcrAppointment =
                            !widget.patient.hasPcrAppointment;
                      },
                    ),
                    title:
                        '${widget.appointment.date[index].hour}:${widget.appointment.date[index].minute}',
                    value: '',
                    isDone: widget.patient.hasPcrAppointment == true &&
                            widget.patient.pcrAppointment.hour ==
                                widget.appointment.date[index].hour &&
                            widget.patient.pcrAppointment.minute ==
                                widget.appointment.date[index].minute
                        ? true
                        : false,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.white.withOpacity(.8)),
            )
          : Container(),
    );
  }
}
