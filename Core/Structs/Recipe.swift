//
//  Recipe.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

protocol Recipe {
    var title: String { get }
    var description: String? { get }
    var dificultyLevel: DificultyLevel { get }
    var ingredients: [Ingredient] { get }
    var steps: [Step] { get }
}

struct RecipeStruct: Recipe {
    var title: String
    var description: String?
    var dificultyLevel: DificultyLevel
    var ingredients: [Ingredient]
    var steps: [Step]
}