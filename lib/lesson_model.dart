import 'prescription.dart';
import 'diagnosis.dart';

class Lesson {
String title;
String date;
List<Prescription> list_of_prescriptions;
List<String> list_of_symptoms;
Diagnosis diagnosis;


Lesson(
    {this.title, this.date,this.list_of_prescriptions,this.list_of_symptoms,this.diagnosis});
}