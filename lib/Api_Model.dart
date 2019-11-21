class PatientModel {
  Medibase medibase;

  PatientModel(
      {this.medibase});

  PatientModel.fromJson(Map<String, dynamic> json) {
    medibase = json['medibase'] != null
        ? new Medibase.fromJson(json['medibase'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medibase != null) {
      data['medibase'] = this.medibase.toJson();
    }
    return data;
  }
}

class Medibase {
  List<Years> years;

  Medibase({this.years});

  Medibase.fromJson(Map<String, dynamic> json) {
    if (json['years'] != null) {
      years = new List<Years>();
      json['years'].forEach((v) {
        years.add(new Years.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.years != null) {
      data['years'] = this.years.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Years {
  int year;
  List<Lesson> lessons;

  Years({this.year, this.lessons});

  Years.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    if (json['lessons'] != null) {
      lessons = new List<Lesson>();
      json['lessons'].forEach((v) {
        lessons.add(new Lesson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesson {
  String instituteName;
  int dateOfVisit;
  List<Problems> problems;
  List<Diagnosis> diagnosis;
  List<Prescription> prescription;

  Lesson(
      {this.instituteName,
        this.dateOfVisit,
        this.problems,
        this.diagnosis,
        this.prescription});

  Lesson.fromJson(Map<String, dynamic> json) {
    instituteName = json['institute_name'];
    dateOfVisit = json['date_of_visit'];
    if (json['problems'] != null) {
      problems = new List<Problems>();
      json['problems'].forEach((v) {
        problems.add(new Problems.fromJson(v));
      });
    }
    if (json['diagnosis'] != null) {
      diagnosis = new List<Diagnosis>();
      json['diagnosis'].forEach((v) {
        diagnosis.add(new Diagnosis.fromJson(v));
      });
    }
    if (json['prescription'] != null) {
      prescription = new List<Prescription>();
      json['prescription'].forEach((v) {
        prescription.add(new Prescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['institute_name'] = this.instituteName;
    data['date_of_visit'] = this.dateOfVisit;
    if (this.problems != null) {
      data['problems'] = this.problems.map((v) => v.toJson()).toList();
    }
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis.map((v) => v.toJson()).toList();
    }
    if (this.prescription != null) {
      data['prescription'] = this.prescription.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Problems {
  String symptom;

  Problems({this.symptom});

  Problems.fromJson(Map<String, dynamic> json) {
    symptom = json['symptom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symptom'] = this.symptom;
    return data;
  }
}

class Diagnosis {
  String condition;
  String advice;

  Diagnosis({this.condition, this.advice});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    condition = json['condition'];
    advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['condition'] = this.condition;
    data['advice'] = this.advice;
    return data;
  }
}

class Prescription {
  String medication;
  String type;
  String doseage;
  String duration;

  Prescription({this.medication, this.type, this.doseage, this.duration});

  Prescription.fromJson(Map<String, dynamic> json) {
    medication = json['medication'];
    type = json['type'];
    doseage = json['doseage'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medication'] = this.medication;
    data['type'] = this.type;
    data['doseage'] = this.doseage;
    data['duration'] = this.duration;
    return data;
  }
}
