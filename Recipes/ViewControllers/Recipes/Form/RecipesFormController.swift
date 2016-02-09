//
//  RecipesFormController.swift
//  Recipes
//
//  Created by Ronan Rodrigo Nunes on 2/8/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class RecipesFormController: UIViewController {
  var delegate: RecipesFormControllerDelegate?
  var tableView: UITableView!
  var tableViewDataSource: RecipesFormDataSource?
  
  init(delegate: RecipesFormControllerDelegate) {
    self.delegate = delegate
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.delegate = nil
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    createTableView()
    configureNavigation()
  }
  
  
  func configureNavigation() {
    navigationItem.title = "New recipe"
    let addButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveRecipeTapped")
    navigationItem.rightBarButtonItem = addButton
  }
  
  func saveRecipeTapped() {
    let recipeStruct = RecipeStruct(
      title: (tableViewDataSource?.recipeTitle.text)!,
      description: tableViewDataSource?.recipeDescription.text,
      dificultyLevel: .Hard
    )
    
    let presenter = ShowSavedRecipeIOS(delegate: self.delegate!)
    let gateway = RecipeGatewayCoreData()
    let usecase = CreateRecipeUsecase(gateway: gateway, presenter: presenter)
    
    do {
      try usecase.create(recipeStruct)
    } catch RecipeError.EmptyTitle {
      NSLog("%@", RecipeError.EmptyTitle.description())
    } catch { }
  }
  
  func createTableView() {
    self.tableView = UITableView(frame: view.frame, style: .Grouped)
    tableViewDataSource = RecipesFormDataSource(cellIdentifier: "RecipesFormCell")
    tableView.dataSource = tableViewDataSource
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "RecipesFormCell")
    tableView.frame = view.frame
    view.addSubview(tableView)
  }
  
  
}
