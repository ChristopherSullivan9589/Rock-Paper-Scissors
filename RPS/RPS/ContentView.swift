//
//  ContentView.swift
//  RPS
//
//  Created by Christopher Sullivan on 7/15/24.
//

import SwiftUI


struct ContentView: View {
    @State var choices = ["rock", "paper", "scissor"]
    @State var shouldWin = false
    @State var appChoice = "rock"
    @State var score = 0
    @State var stats = ""
    
    private func appMove() {
        let randomIndex = Int.random(in: 0..<3)
        appChoice = choices[randomIndex]
        shouldWin = Bool.random()
        stats = ""
    }
    
    private func pickRock() {
        if appChoice == "rock" {
            appMove()
        }
        else if appChoice == "paper" && shouldWin == false{
            score += 1
            stats = "Correct!"
        }
        else if appChoice == "scissor" && shouldWin == true {
            score += 1
            stats = "Correct!"
        }
        else {
            stats = "Wrong!"
        }
    }
    
    private func pickScissor() {
        if appChoice == "scissor" {
            appMove()
        }
        else if appChoice == "rock" && shouldWin == false{
            score += 1
            stats = "Correct!"
        }
        else if appChoice == "paper" && shouldWin == true {
            score += 1
            stats = "Correct!"
        }
        else {
            stats = "Wrong!"
        }
    }
    
    private func pickPaper() {
        if appChoice == "paper" {
            appMove()
        }
        else if appChoice == "scissor" && shouldWin == false{
            score += 1
            stats = "Correct!"
        }
        else if appChoice == "rock" && shouldWin == true {
            score += 1
            stats = "Correct!"
        }
        else {
            stats = "Wrong!"
        }
    }
    
    private func reset() {
        score = 0
        stats=""
    }
    
    var body: some View {
        Spacer()
        VStack {
           Text("Player's score is \(score)")
            Text("App's move is \(appChoice)")
            if shouldWin {
                Text("Player should win!")
            }
            else {
                Text("Player should lose")
            }
            Text(stats)
            Button(action: {
                self.appMove()
            }) {
                Text("Continue")
                    .padding()
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    .foregroundStyle(.blue)
            }
        }
        .padding()
        HStack {
            Button(action: {
                self.pickScissor()
            }) {
                Text("✂️")
                    .font(.system(size:50))
            }
            Button(action: {
                self.pickRock()
            }) {
                Text("🪨")
                    .font(.system(size:50))
            }
            Button(action: {
                self.pickPaper()
            }) {
                Text("📄")
                    .font(.system(size:50))
            }
        }
        VStack{
            Button(action: {
                self.reset()
            }) {
                Text("Reset")
                    .padding()
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    .foregroundStyle(.red)
            }
            
        }
        Spacer()
    }
}



#Preview {
    ContentView()
}
