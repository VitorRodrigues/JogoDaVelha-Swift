//
//  JogoDaVelhaTests.swift
//  JogoDaVelhaTests
//
//  Created by Vítor Nascimento on 05/03/2021.
//

import XCTest
@testable import TicTacToe

class JogoDaVelhaTests: XCTestCase {

    // Vamos testar o jogo da velha,
    // a configuração é a seguinte:
    
    // (linha, coluna)
    
    // (0,0) (0,1) (0,2)
    // (1,0) (1,1) (1,2)
    // (2,0) (2,1) (2,2)
    
    var jogoDaVelha: JogoDaVelha!
    
    override func setUp() {
        jogoDaVelha = JogoDaVelha()
    }
    
    override func tearDown() {
        jogoDaVelha = nil
    }
    
    func testNovoJogoEstaVazio() {
        
        XCTAssertFalse(jogoDaVelha.acabou)
        XCTAssertTrue(jogoDaVelha.estaVazio)
    }
    
    func testTabuleiro3x3FoiCriado() {
        
        XCTAssertEqual(jogoDaVelha.linhas, 3)
        XCTAssertEqual(jogoDaVelha.colunas, 3)
    }
    
    func testColocarValorEmAlgumaPosicao() {
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        
        XCTAssertEqual(jogoDaVelha.ler(linha:1, coluna:1), "X")
    }
    
    func testImpedirSobreposicaoDeValoresNoTabuleiro() {
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        jogoDaVelha.colocar("O", linha: 1, coluna: 1)
        
        XCTAssertEqual(jogoDaVelha.ler(linha:1, coluna:1), "X")
    }
    
    func testJogoAcabaAoFormarTrincaEmLinha() {
        
        jogoDaVelha.colocar("X", linha: 1, coluna: 0)
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        jogoDaVelha.colocar("X", linha: 1, coluna: 2)
        
        XCTAssertTrue(jogoDaVelha.acabou)
    }
    
    func testJogoAcabaAoFormarTrincaEmColunas() {
        
        jogoDaVelha.colocar("X", linha: 0, coluna: 2)
        jogoDaVelha.colocar("X", linha: 1, coluna: 2)
        jogoDaVelha.colocar("X", linha: 2, coluna: 2)
        
        XCTAssertTrue(jogoDaVelha.acabou)
    }
    
    func testJogoAcabaAoFormarTrincaEmDiagonalEsquerda() {
        
        jogoDaVelha.colocar("X", linha: 0, coluna: 0)
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        jogoDaVelha.colocar("X", linha: 2, coluna: 2)
        
        XCTAssertTrue(jogoDaVelha.acabou)
    }
    
    func testJogoAcabaAoFormarTrincaEmDiagonalDireita() {
        
        jogoDaVelha.colocar("X", linha: 0, coluna: 2)
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        jogoDaVelha.colocar("X", linha: 2, coluna: 0)
        
        XCTAssertTrue(jogoDaVelha.acabou)
    }
    
    func testJogoAcabaQuandoHaEmpate() {
        
        jogoDaVelha.colocar("X", linha: 0, coluna: 0)
        jogoDaVelha.colocar("O", linha: 0, coluna: 1)
        jogoDaVelha.colocar("X", linha: 0, coluna: 2)
        jogoDaVelha.colocar("X", linha: 1, coluna: 0)
        jogoDaVelha.colocar("X", linha: 1, coluna: 1)
        jogoDaVelha.colocar("O", linha: 1, coluna: 2)
        jogoDaVelha.colocar("O", linha: 2, coluna: 0)
        jogoDaVelha.colocar("X", linha: 2, coluna: 1)
        jogoDaVelha.colocar("O", linha: 2, coluna: 2)
        
        XCTAssertTrue(jogoDaVelha.acabou)
    }
}
