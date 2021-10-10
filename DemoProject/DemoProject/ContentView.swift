//
//  ContentView.swift
//  DemoProject
//
//  Created by SueJung Kim on 2021/10/05.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(self.rotation))
                    .animation(.easeInOut(duration: 5))
                    .foregroundColor(self.colors[self.colorIndex])
                Spacer()
                Divider()
                Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                    .padding()
                TextField("Enter text here", text:$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach (0 ..< colornames.count) {
                        Text(self.colornames[$0])
                            .foregroundColor(self.colors[$0])
                    }
                }
                .padding()
            }
            
        }
/*
        VStack(alignment: .center, spacing: 15) {
            Text("Financial Results")
                .font(.title)
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    Text("January")
                    Text("Fabruary")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$10000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(5)
            }
            .padding(5)
        }
        .padding(5)
        HStack {
            Image(systemName: "airplane")
            Text("Flight times:")
            Text("London")
        }
        .font(.largeTitle)
        .border(Color.black)
        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
 */
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("6. Hello, world!")
            Text("7. Hello, world!")
        }
    }
}

struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
