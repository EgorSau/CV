//
//  ContentView_demo.swift
//  SwiftUI_demo
//
//  Created by Egor SAUSHKIN on 28.12.2022.
//

import SwiftUI

struct Printer: View {
    
    @State var newText: String = ""
    @State var tempText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("fire")
                    .resizable()
                    .padding()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                TextField("Type smth here...", text: $newText)
                    .padding()
                    .foregroundColor(.red)
                
                Button {
                    printText()
                } label: {
                    Text("Print text".uppercased())
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow.cornerRadius(15))
                .foregroundColor(.black)
                
                Text(tempText)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Hello, this is printer!")
        }
    }
    
    func printText() {
        tempText = newText
        newText = ""
    }
}

struct Printer_Previews: PreviewProvider {
    static var previews: some View {
        Printer()
    }
}

