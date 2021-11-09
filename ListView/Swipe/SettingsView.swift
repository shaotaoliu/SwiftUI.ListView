import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var settings: Settings
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("< Back") {
                presentationMode.wrappedValue.dismiss()
            }
            
            Form {
                ColorPicker("Foreground Color", selection: $settings.foregroundColor)
                ColorPicker("Rating Color", selection: $settings.ratingColor)
                ColorPicker("Background Color", selection: $settings.backgroundColor)
                
                Toggle(isOn: $settings.showSeparator) {
                    Text("Show Separator")
                }
                
                ColorPicker("Separator Color", selection: $settings.separatorColor)
                    .opacity(settings.showSeparator ? 1.0 : 0.4)
                    .disabled(!settings.showSeparator)

                ColorPicker("Row Background Color", selection: $settings.rowBackgroundColor)
            }
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: .constant(Settings()))
    }
}
