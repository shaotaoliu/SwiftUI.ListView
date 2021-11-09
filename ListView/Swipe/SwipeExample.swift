import SwiftUI

struct SwipeExample: View {
    @StateObject var vm = ItemViewModel()
    @State private var showSetting = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.items.sorted { $0.id > $1.id }, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text("Item \(item.id)")
                            .font(.headline)
                            .padding(.vertical, 2)
                        
                        RatingControl(rating: item.rating)
                            .foregroundColor(vm.settings.ratingColor)
                    }
                    .swipeActions(edge: .leading) {
                        Button() {
                            vm.remove(item: item)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
  
                        Button() {
                            vm.decRating(item: item)
                        } label: {
                            Label("Minus", systemImage: "minus")
                        }
                        .tint(.brown)
                        

                        Button() {
                            vm.incRating(item: item)
                        } label: {
                            Label("Plus", systemImage: "plus")
                        }
                        .tint(.green)
                        
                    }
                    .listRowBackground(vm.settings.rowBackgroundColor)
                    .listRowSeparator(vm.settings.showSeparator ? .visible : .hidden)
                    .listRowSeparatorTint(vm.settings.separatorColor)
                }
            }
            .foregroundColor(vm.settings.foregroundColor)
            .background(vm.settings.backgroundColor)
            .listStyle(.plain)
            .navigationTitle("Items")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: SettingButton)
            .refreshable {
                vm.append(count: 5)
            }
        }
    }
    
    struct RatingControl: View {
        let rating: Int
        var body: some View {
            HStack {
                ForEach(0..<5, id: \.self) { i in
                    Image(systemName: i < rating ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                }
            }
        }
    }

    var SettingButton: some View {
        Button("Settings") {
            showSetting = true
        }
        .sheet(isPresented: $showSetting) {
            SettingsView(settings: $vm.settings)
        }
    }
}

struct SwipeExample_Previews: PreviewProvider {
    static var previews: some View {
        SwipeExample()
    }
}
