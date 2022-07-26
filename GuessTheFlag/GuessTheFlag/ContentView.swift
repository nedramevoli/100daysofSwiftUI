//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nedra Mevoli on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var currentScore = ""
    
    var body: some View {
        Button("Show Alert"){
            showingScore = true
        }
        .alert("Message", isPresented: $showingScore){
            Button("OK"){
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
