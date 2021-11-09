import SwiftUI

class StudentViewModel: ObservableObject {
    @Published var student = Student(
        name: "John Smith",
        department: Department.accounting,
        courses: ["CS101", "CS102"]
    )
}

struct Student {
    let id = UUID()
    
    var name: String 
    var department: Department?
    var courses: [String] = []
}

let Courses = [
    "CS101",
    "CS102",
    "AR201",
    "AR202",
    "PH301",
    "PH302",
    "MA401",
    "MA402",
    "EN501",
    "EN502",
    "FI601",
    "FI602"
]

enum Department: String, CaseIterable, Identifiable, Hashable {
    case architecture
    case economics
    case accounting
    case finance
    case engineering
    case philosophy
    case computer
    case physics
    
    var id: String {
        self.rawValue
    }
}
