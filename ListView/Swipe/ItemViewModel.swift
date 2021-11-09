import SwiftUI

class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var settings: Settings = Settings()
    private var maximum = 5
    
    init() {
        for i in 1...maximum {
            items.append(Item(id: i))
        }
    }
    
    func append(count: Int) {
        for i in 1...count {
            items.append(Item(id: maximum + i))
        }
        maximum += count
    }
    
    func remove(item: Item) {
        items.remove(at: items.firstIndex(where: { $0.id == item.id })!)
    }
    
    func incRating(item: Item) {
        items[items.firstIndex(where: { $0.id == item.id })!].rating = min(item.rating + 1, maximum)
    }
    
    func decRating(item: Item) {
        items[items.firstIndex(where: { $0.id == item.id })!].rating = max(item.rating - 1, 0)
    }
}

struct Item {
    let id: Int
    var rating: Int = 0
}

struct Settings {
    var showSeparator: Bool = true
    var separatorColor: Color = .white
    var rowBackgroundColor: Color = .blue
    var foregroundColor: Color = .white
    var ratingColor: Color = .yellow
    var backgroundColor: Color = Color(red: 0.85, green: 0.85, blue: 0.85)
}
