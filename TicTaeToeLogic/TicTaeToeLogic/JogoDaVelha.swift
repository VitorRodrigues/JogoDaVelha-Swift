//
//  JogoDaVelha.swift
//  TicTacToe
//
//  Created by Vítor Nascimento on 05/03/2021.
//

import Foundation

public class JogoDaVelha {
    
    let vazio = ""
    private var _acabou = false
    public var acabou: Bool { get { _acabou } }
    
    private(set) var estaVazio = true
    
    public var linhas: Int {
        tabuleiro.count
    }
    
    public var colunas: Int {
        tabuleiro[0].count
    }
    
    private var tabuleiro: [[String]]
    
    public init() {
        tabuleiro = [
            [vazio,vazio,vazio],
            [vazio,vazio,vazio],
            [vazio,vazio,vazio],
        ]
    }
    
    public func colocar(_ valor: String, linha: Int, coluna: Int) {
        if podeColocarValorEm(linha: linha, coluna: coluna) {
            tabuleiro[linha][coluna] = valor
            
            verificarSeJogoTerminou()
        }
    }
    
    public func ler(linha: Int, coluna: Int) -> String {
        return tabuleiro[linha][coluna]
    }
    
    private func podeColocarValorEm(linha: Int, coluna: Int) -> Bool {
        return tabuleiro[linha][coluna] == vazio
    }
    
    private func verificarSeJogoTerminou() {
        
        _acabou = verificarTrincaEmLinhas() 
            || verificarTrincaEmColunas() 
            || verificarTrincaEmDiagonais() 
            || verificarEmpate()
    }
    
    private func verificarTrincaEmLinhas() -> Bool {
        for linha in tabuleiro {
            if linha[0] != vazio && linha[0] == linha[1] && linha[1] == linha[2] {
                return true
            }
        }
        
        return false
    }
    
    private func verificarTrincaEmColunas() -> Bool {
        for coluna in tabuleiro.indices {
            if tabuleiro[0][coluna] != vazio && tabuleiro[0][coluna] == tabuleiro[1][coluna] && tabuleiro[1][coluna] == tabuleiro[2][coluna] {
                return true
            }
        }
        
        return false
    }
    
    private func verificarTrincaEmDiagonais() -> Bool {
        // Verifica diagonal esquerda
        if tabuleiro[0][0] != vazio && tabuleiro[0][0] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][2] {
            return true
        }
        
        //Verificacao diagonal direita
        if tabuleiro[0][2] != vazio && tabuleiro[0][2] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][0] {
            return true
        }
        
        return false
    }
    
    private func verificarEmpate() -> Bool {
        for linha in tabuleiro {
            for coluna in linha {
                if coluna == vazio {
                    return false
                }
            }
        }
        
        return true
    }
}
