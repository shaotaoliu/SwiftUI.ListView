import SwiftUI

struct DepartmentSelectionView: View {
    @Binding var department: Department?
    
    var body: some View {
        List(Department.allCases, id: \.self, selection: $department) { dept in
            Text(dept.rawValue.capitalized)
        }
    }
}

struct DepartmentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentSelectionView(department: .constant(Department.accounting))
            .environment(\.editMode, .constant(EditMode.active))
    }
}
