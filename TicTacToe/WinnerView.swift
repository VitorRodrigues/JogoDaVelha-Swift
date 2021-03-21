//
//  WinnerView.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 17/03/2021.
//

import SwiftUI

struct WinnerView: View {
    
    var winner: String
    var action: () -> Void
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 50)
            Text("End Game!")
            Spacer()
            Text("Winner:")
            Text(winner)
                .font(.title)
            Spacer()
            Button(action: {
                print("Restart game")
                action()
            }, label: {
                Text("Restart Game")
            })
            .padding()
            .background(Color.white)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .cornerRadius(15)
            Spacer(minLength: 50)
        }.foregroundColor(.white)
        .ignoresSafeArea(.all, edges: .all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(winner: "Xaman", action: {})
            .background(Color.green)
            .ignoresSafeArea()
    }
}
