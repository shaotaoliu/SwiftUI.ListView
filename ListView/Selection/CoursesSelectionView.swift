import SwiftUI

struct CoursesSelectionView: View {
    @Binding var courses: [String]
    @State private var values = Set<String>()

    var body: some View {
        List(Courses, id: \.self, selection: $values) { name in
            Text(name)
        }
        .onAppear() {
            courses.forEach { values.insert($0) }
        }
        .onDisappear(perform: {
            courses.removeAll()
            courses.append(contentsOf: values)
        })
    }
}
    
struct CoursesSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesSelectionView(courses: .constant([Courses[0], Courses[1], Courses[2]]))
            .environment(\.editMode, .constant(EditMode.active))
    }
}
