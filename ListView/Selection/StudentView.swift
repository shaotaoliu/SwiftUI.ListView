import SwiftUI

struct StudentView: View {
    @StateObject var vm = StudentViewModel()
    @State private var editMode = EditMode.active
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    Text(vm.student.name)
                }
                
                Section("Department") {
                    NavigationLink(destination: DepartmentSelectionView(department: $vm.student.department)
                                    .environment(\.editMode, $editMode), label: {
                        Text(vm.student.department?.rawValue.capitalized ?? "")
                    })
                }
                
                Section("Courses") {
                    NavigationLink(destination: CoursesSelectionView(courses: $vm.student.courses)
                                    .environment(\.editMode, $editMode), label: {
                        VStack(spacing: 6) {
                            ForEach(0..<vm.student.courses.count, id: \.self) { index in
                                Text(vm.student.courses[index])
                            }
                        }
                    })
                }
            }
            .navigationTitle("Student")
        }
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
