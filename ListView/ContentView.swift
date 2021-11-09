import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SwipeExample()
                .tabItem {
                    Label("Swipe", systemImage: "star")
                }
            
            StudentView()
                .tabItem {
                    Label("Selection", systemImage: "person.crop.circle")
                        .foregroundColor(.blue)
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
