//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Amol Pawar on 24/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {

    @State var userName1: String = ""
    @State var desc1: String = ""
    @State var present: Bool = false

    @Environment(\.managedObjectContext) var context;

    var body: some View {
        VStack(spacing: 20) {

            TextField("User Name", text: $userName1)
            TextField("desc", text: $desc1)

            Button {
                add()
            } label: {
                Text("Add")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)

            }

            Button {
                present.toggle()
            } label: {
                Text("Next")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)

            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $present) {
            NextView()
        }

    }

    func add() {
        if !userName1.isEmpty && !desc1.isEmpty {
            let det = Details(context: context)
            det.userName = self.userName1
            det.desc = self.desc1
            _ = try? context.save()
        }
    }
}


struct NextView: View {

    @FetchRequest(sortDescriptors: []) var details: FetchedResults<Details>

    var body: some View {
        VStack {
            List(details) { detail in
                VStack(alignment: .leading,spacing: 20) {
                    Text(detail.userName ?? "")
                    Text(detail.desc ?? "")
                }
            }
        }
    }
}
