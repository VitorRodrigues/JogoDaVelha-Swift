//
//  ContentView.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 05/03/2021.
//

import SwiftUI
import TicTaeToeLogic

struct TicTacToeView: View {
    
    @ObservedObject var ticTacToe: TicTacToe
    
    var body: some View {
        ZStack {
            VStack {
                Text("Infamous TicTacToe!")
                Text("Player: \(ticTacToe.currentPlayer)").animation(.easeIn)
                Spacer()
                BoardView(rows: ticTacToe.rows, 
                          columns: ticTacToe.columns) { (x, y) in
                    
                    Button(ticTacToe.read(line: x, column: y)) {
                        ticTacToe.playAt(line: x, column: y)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(Font.system(size: 60))
                    .foregroundColor(ticTacToe.isFirstPlayerAt(x: x, y: y) ? Color.red : Color.green)
                    
                }
                .foregroundColor(.black)
                .aspectRatio(contentMode: .fit)
                Spacer()
            }.lineSpacing(Constants.itemSpacing)
            .fullScreenCover(isPresented: $ticTacToe.isEndGame, content: {
                WinnerView(winner: ticTacToe.winner, action: {
                    ticTacToe.restart()
                })
                .background(Color.green)
                .ignoresSafeArea()
            })
        }
    }
    
    enum Constants {
        static let itemSpacing: CGFloat = 4.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView(ticTacToe: TicTacToe())
    }
}


class TicTacToe: ObservableObject {
    
    var board: JogoDaVelha
    
    var rows: Int { board.linhas }
    var columns: Int { board.colunas }
    var winner: String { currentPlayer }
    
    
    
    var players: [String]
    
    @Published var isEndGame = false
    
    @Published var currentPlayer: String
    
    var nextPlayer: String { currentPlayer == players[0] ? players[1] : players[0] }
    
    @Published var invalidMoveAt: (Int, Int)?
    
    convenience init() {
        self.init(player1: "❌", player2: "⭕️")
    }
    
    required init(player1: String, player2: String) {
        board = JogoDaVelha()
        players = [player1, player2]
        currentPlayer = player1
    }
    
    func read(line: Int, column: Int) -> String {
        let data = board.ler(linha: line, coluna: column)
        if data.isEmpty {
            return " "
        }
        return data
    }
    
    func isFirstPlayerAt(x: Int, y: Int) -> Bool {
         read(line: x, column: y) == players[0]
    }
    
    func playAt(line: Int, column: Int) {
        guard !board.acabou else { return }
        let value = currentPlayer
        board.colocar(value, linha: line, coluna: column)
        if board.ler(linha: line, coluna: column) == value {
            // Well played
            invalidMoveAt = nil
            if !board.acabou {
                currentPlayer = nextPlayer
            } else {
                isEndGame = true
            }
        } else  {
            // Invalid move
            invalidMoveAt = (line, column)
        }
    }
    
    func restart() {
        board = JogoDaVelha()
        isEndGame = false
    }
}
