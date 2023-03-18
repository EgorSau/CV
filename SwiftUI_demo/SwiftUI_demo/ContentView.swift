//
//  ContentView.swift
//  SwiftUI_demo
//
//  Created by Egor SAUSHKIN on 28.12.2022.
//

//import SwiftUI
//
//struct ContentView: View {
//
//    @State var newText: String = ""
////    @State var textTyped: Bool = false
//    @State var tempText: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
////                Image(systemName: "flame")
////                    .padding()
////                    .imageScale(.large)
////                    .foregroundColor(Color.red)
//                
//                Image("fire")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 150)
//                    .padding()
//
//                TextField("Type smth here...", text: $newText)
//                    .padding()
//                    .foregroundColor(Color.red)
//                
//                Button("Print text".uppercased()) {
//                    printText()
////                    textTyped.toggle()
//                }
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.yellow.cornerRadius(15))
//                .foregroundColor(Color.black)
//
//                Text(tempText)
//                
//                Spacer()
//            }
//            .padding()
//            .navigationTitle("Hello, this is printer!")
//        }
//    }
//    
//    func printText() {
//        tempText = newText
//        newText = ""
//    }
//    
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI

struct Printer2: View {
    
    @State var newText: String = ""
    @State var printedText: String = ""
    @State var dataArray = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("fire")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 150)
                    .padding()
                
                TextField("Type smth here...", text: $newText)
                    .padding()
                    .foregroundColor(.red)
                
                Button ("Print text".uppercased()) {
                    printText()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow.cornerRadius(15))
                .foregroundColor(.black)

//                Text(printedText)
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Hello, this is printer!")
        }
    }
    
    func printText() {
//        printedText = newText
        dataArray.append(newText)
        newText = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Printer2()
    }
}
