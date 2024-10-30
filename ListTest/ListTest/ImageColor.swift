import SwiftUI

struct ImageControl: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "bolt")
                    .resizable()
                    .frame(width: 300, height: 500)
                
                Text("BOLT")
                    .font(.largeTitle)
                
                NavigationLink(destination: TestView()) {
                    Image(systemName: "house")
                        .font(.largeTitle)
                }
                .padding()
            }
        }
    }
}

struct TestView: View {
    var body: some View {
        VStack {
            Text("HOME SCREEN")
                .font(.largeTitle)
            
            NavigationLink(destination: ImageControl()) {
                
            }
            .padding()
        }
    }
}

#Preview {
    ImageControl()
}
