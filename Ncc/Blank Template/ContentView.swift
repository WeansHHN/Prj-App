import SwiftUI

struct ContentView: View {
    @State private var selectedFile: URL?
    @State private var isFilePickerPresented = false
    @State private var isShowingAlert = false

    var body: some View {
        TabView {
            // Tab 1
            NavigationView {
                VStack {
                    Image("image")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.blue)
                        .padding(.top, -20)
                        .cornerRadius(40)
                    
                    Text("Chọn một tập tin")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, -10)
                    
                    if let fileURL = selectedFile {
                        Text("Selected File: \(fileURL.lastPathComponent)")
                            .font(.headline)
                            .padding(.top, 5)
                    }
                    
                    VStack(spacing: 10) {
                        Button(action: {
                            isFilePickerPresented.toggle()
                        }) {
                            Text("Chọn File")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 175, height: 55)
                                .background(Color.blue)
                                .cornerRadius(20)
                                .font(.system(size: 10))
                        }
                    }
                    .padding(.top, 10)
                    
                    .sheet(isPresented: $isFilePickerPresented) {
                        FileImporter {
                            fileURL in
                            selectedFile = fileURL
                        }
                    }
                }
            }
            .navigationBarTitle("File Picker", displayMode: .inline)
            .tabItem {
                Image(systemName: "folder.fill")
                Text("Tab 1")
            }
            
            // Tab 2
            NavigationView {
                VStack {
                    Image(systemName: "photo.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.green)
                        .padding(.top, 50)
                    
                    Text("Boot Game")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, 10)

                    Toggle("Switch Label", isOn: $isSwitchOn)
                        .padding()
                        .font(.title)
                        .foregroundColor(.blue)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    
                    Button(action: {
                        isShowingAlert = true
                    }) {
                        Text("Vào Game")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 175, height: 55)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                }
            }
            .tabItem {
                Image(systemName: "rocket")
                Text("Tab 2")
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Chọn Game"),
                    primaryButton: .default(Text("Free Fire")) {
                        // Điều hướng đến ứng dụng 1 (hoặc thực hiện hành động bạn muốn)
                        // Có thể thay thế hoặc xóa phần này nếu bạn không muốn mở ứng dụng
                    },
                    secondaryButton: .default(Text("Free Fire Max")) {
                        // Điều hướng đến ứng dụng 2 (hoặc thực hiện hành động bạn muốn)
                        // Có thể thay thế hoặc xóa phần này nếu bạn không muốn mở ứng dụng
                    },
                    dismissButton: .cancel()
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
