
import 'package:dio/dio.dart';
import 'Api_Model.dart';
import 'dart:convert';
import 'dart:async';



Future<List<Lesson>> datainput() async {
  Response response;
  var json_patient_data;
  Dio dio = new Dio();
  response = await dio.post("http://10.6.15.177:3000/api/displayAll/",
      data: { "patientUID": "rTHDf5bLW0SjpMAndIAOxQEXxgB3"});
  json_patient_data = response.data;
  var parsedJson = json.decode(json_patient_data);
  PatientModel ourUser = PatientModel.fromJson(parsedJson);
  var number_of_years = ourUser.medibase.years.length;
  List<List<Lesson>> list_lesson_list;
  for (int i = 0; i < number_of_years; i++) {
    list_lesson_list.add(ourUser.medibase.years[i].lessons);
  }
  List<Lesson> lesson_list;
  for (int j = 0; j < list_lesson_list.length; j++) {
    for (int k = 0; k < list_lesson_list[j].length; k++) {
      lesson_list.add(list_lesson_list[j][k]);
    }
  }
  //return lesson_list;

}

//List<Lesson> getLessons() {
//  return [
//    Lesson(
//      title: "Sunshine Hospital",
//      date: "2nd November 2019",
//      list_of_symptoms:["Chills", "Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis: Diagnosis(
//          condition: "Viral Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      ),
//
//      list_of_prescriptions: [
//        Prescription(
//            name: "Penicillin 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Crocin 50mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days")
//      ],
//    ),
//    Lesson(
//      title: "Appolo Hospital",
//      date: "15th November 2019",
//      list_of_symptoms:["Chills", "Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis:
//      Diagnosis(
//          condition: "Viral Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      )
//      ,
//      list_of_prescriptions: [
//        Prescription(
//            name: "Meth 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Ibuprofin 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days")
//      ],
//    ),
//    Lesson(
//      title: "Star Hospital",
//      date: "16th November 2019",
//      list_of_symptoms:["Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis:
//      Diagnosis(
//          condition: "Bacterial Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      )
//      ,
//      list_of_prescriptions: [
//        Prescription(
//            name: "Meth 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Ibuprofin 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days"),
//        Prescription(
//            name: "Ibuprofinaa 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days")
//      ],
//
//    )
//  ];
//}