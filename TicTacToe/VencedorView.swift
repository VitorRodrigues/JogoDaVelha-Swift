//
//  VencedorView.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 23/03/2021.
//

import SwiftUI

struct VencedorView: View {
    
    var vencedor: String
    
    var restartAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text("Vencedor")
            Spacer()
            Text(vencedor)
                .font(Font.system(size: 90))
            Spacer()
            Button("Reiniciar") { 
                restartAction()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15.0)
            Spacer()
        }
    }
}

struct VencedorView_Previews: PreviewProvider {
    static var previews: some View {
        VencedorView(vencedor: "😻"){}
            .background(Color.green)
            .ignoresSafeArea()
    }
}
