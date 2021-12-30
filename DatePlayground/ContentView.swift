//
//  ContentView.swift
//  DatePlayground
//
//  Created by ot on 29.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var days:Int=0
    @State var calculations:[String]=[]
    @State private var date = Date()

    static var decimal: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }
    var body: some View {
        VStack{
            HStack {
                Button("Reset"){calculations=[]}
            }.frame(alignment:.trailing)
            DatePicker(selection: $date, label: { Text("Now") })
            
            HStack {
                Text("Add/Subtract Days:")
                TextField("How many days",value: $days,format:.number).onSubmit {
                    print("submitted \(days)")
                    let days_ago = Date(timeIntervalSince1970: date.timeIntervalSince1970+Double(days*24*60*60))
                    
                    calculations.insert("\(days) ago is \(days_ago)", at:0)
                }
                
            }
            ScrollView {
                ForEach(calculations, id: \.self) { row in
                    Text(row).font(.title).foregroundColor(.blue).bold()
                }
            }.padding(.top)
            Spacer()
        }.frame(minWidth:200, minHeight:400).padding()
        
    };
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
