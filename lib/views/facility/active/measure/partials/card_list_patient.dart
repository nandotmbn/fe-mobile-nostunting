import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/screens/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/card_list_patient_data.dart';

class FacilityCardListPatientMeasurement extends StatelessWidget {
  final String name, identifier, updatedAt, _id;
  // ignore: use_key_in_widget_constructors
  const FacilityCardListPatientMeasurement(
      this.name, this.identifier, this.updatedAt, this._id);

  @override
  Widget build(BuildContext context) {
    String convertedDatetime = DateFormat('yMMMMEEEEd').format(
        DateFormat("yyyy-MM-dd").parse(DateTime.parse(updatedAt).toString()));
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xFFF0EBCE),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              CardListPatientData("Nama Pasien", name),
              CardListPatientData("NIK", identifier),
              CardListPatientData("Terakhir Update", convertedDatetime),
            ]),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacilityMeasureRecord(_id)),
                  )
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF395144),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    "Ukur",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
