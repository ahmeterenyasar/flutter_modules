import 'dart:async';
import 'dart:io';

void main()
async {
    String studentName;
    double midtermGrade;
    double finalGrade;
    double average;
    String letterGrade;
    bool   isPassed;

    print("\nHarf Notu Hesaplama Machine");
    print("===========================");
    
    studentName = "Ahmet";
    if (studentName.isEmpty)
        studentName = "Unknown Student";

    print("Entering grades...");
    print("Please wait.\n\n");
    await Future.delayed(Duration(seconds: 3));
    midtermGrade = 55;
    finalGrade = 78;

    if (midtermGrade > 100 || midtermGrade < 0 || finalGrade > 100 || finalGrade < 0)
    {
        print("Invalid grade enterence. Grades must be between 0-100");
        exit(1);
    }

    average = (midtermGrade * 0.4) + (finalGrade * 0.6);

    int gradeGap = average.toInt();
    
    // kısa yol, e.g.,: 80-89 -> next step has to be 90-99 
    switch (gradeGap ~/ 10)
    {
        case 10:
        case 9:
            letterGrade = "AA";
            break;
        case 8:
            letterGrade = "BA";
            break;
        case 7:
            letterGrade = "BB";
            break;
        case 6:
            letterGrade = "BC";
            break;
        case 5:
            letterGrade = "CC";
            break;
        case 4:
            letterGrade = "DC";
            break;
        case 3:
            letterGrade = "DD";
            break;
        case 2:
            letterGrade = "FD";
            break;
        default:
            letterGrade = "FF";
            break;
    }


    print("TRANSCRIPT");
    print("Student Name: $studentName");
    print("Midterm: $midtermGrade");
    print("Final: $finalGrade");
    print("Avg: $average");
    print("Letter Grade: $letterGrade");

    if (midtermGrade >= 45 && finalGrade >= 45)
        isPassed = true;
    else
        isPassed = false;
    
    if(isPassed)
        print("Status: Geçti");
    else
        print("Status: Kaldı");

}