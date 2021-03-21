//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 05/03/2021.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            TicTacToeView(ticTacToe: TicTacToe(player1: "A", player2: "B"))
        }
    }
}
