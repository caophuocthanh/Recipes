//
//  ListRecipesUsecaseTests.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 10/02/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class ListRecipesUsecaseTests: XCTestCase {
    var usecase: ListRecipesUsecase!
    var presenter: ListRecipesPresenterSpy!
    var gateway: RecipeGatewayFake!
    
    override func setUp() {
        presenter = ListRecipesPresenterSpy()
        gateway = RecipeGatewayFake()
        self.usecase = ListRecipesUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShouldListAllRecipes() {
        createRecipe()
        
        self.usecase.list()
        
        XCTAssertEqual(self.gateway.recipes.count, self.presenter.recipesSpy.count)
    }
    
    func createRecipe() {
        gateway.create(RecipeStruct(
            id: 0,
            title: "Carrot cake",
            brief: "Simple and wonderful cake",
            dificultyLevel: .Easy))
    }
}
