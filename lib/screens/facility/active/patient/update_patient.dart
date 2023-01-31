// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/patient/update.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityUpdatePatient extends StatelessWidget {
  String patientId;
  FacilityUpdatePatient(this.patientId);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FacilityPatientUpdateView(userId: patientId));
  }
}
