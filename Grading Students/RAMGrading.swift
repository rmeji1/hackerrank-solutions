import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
  var newGrades = [Int]()
  
  for var grade in grades{
    let value = 5 - (grade % 5)
    if grade > 37 && value < 3{ grade += value }
    newGrades.append(grade)
  }
  
  return newGrades
}

var arr = [4,73,67,38,33]

print(gradingStudents(grades: arr))
