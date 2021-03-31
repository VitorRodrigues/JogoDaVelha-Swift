//
//  JogoDaVelhaObservavel.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 23/03/2021.
//

import SwiftUI

class JogoDaVelhaObservavel: ObservableObject {
    
    var linhas: Int { jogoDaVelha.linhas }
    var colunas: Int { jogoDaVelha.colunas }
    
    let jogadores: [String]
    @Published var jogadorDaVez: String
    @Published var acabou: Bool = false
    
    private var jogoDaVelha: JogoDaVelha
    
    init(jogador1: String, jogador2: String) {
        jogadores = [jogador1, jogador2]
        jogadorDaVez = jogador1
        jogoDaVelha = JogoDaVelha()
    }
    
    func ler(linha: Int, coluna: Int) -> String {
        jogoDaVelha.ler(linha: linha, coluna: coluna)
    }
    
    func colocar(linha: Int, coluna: Int) {
        guard !acabou else { return }
        jogoDaVelha.colocar(jogadorDaVez, linha: linha, coluna: coluna)
        if jogoDaVelha.ler(linha: linha, coluna: coluna) == jogadorDaVez {
            if jogoDaVelha.acabou {
                acabou = true
            } else {
                proximoJogador()
            }
        }
    }
    
    func reiniciar() {
        jogoDaVelha = JogoDaVelha()
        acabou = false
    }
    
    private func proximoJogador() {
        jogadorDaVez = jogadorDaVez == jogadores[0] ? jogadores[1] : jogadores[0]
    }
}
