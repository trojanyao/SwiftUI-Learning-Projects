//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by 姚陶钧 on 2025/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var savedList: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            TextField("Add a name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        if names.contains(nameToAdd) {
                            return
                        }
                        names.append(nameToAdd.trimmingCharacters(in: .whitespaces))
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if (shouldRemovePickedName) {
                        names.removeAll { name in pickedName == name }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            HStack {
                Button("Save List") {
                    savedList = names
                }
                
                Button("Load List") {
                    names = savedList
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
