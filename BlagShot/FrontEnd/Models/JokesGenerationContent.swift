//
//  JokesGenerationContent.swift
//  BlagShot
//
//  Created by admin on 27/09/2025.
//
import Foundation

struct JokesGenerationContent {
    let titrePrincipal: String
    let titreSecondaire: String
    var blague: String
    let imagePrincipale: String
    let btnAddFavories: String
    let btnGenerate: String
    let btnAdd: String
    let btnFavories: String
}

struct Joke: Codable {
    let setup: String?
    let delivery: String?
}
