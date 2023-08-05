//
//  COreData.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 14/05/1402 AP.
//

import UIKit
import CoreData
protocol CoreDataOperations {
    func saveToCoreData(recipe : Recipe , isFavourite:Bool)
    func deleteFromCoreData(recipeKey : String)
    func fetchFromCoreData() -> [NSManagedObject]
    func isFavourite(recipeKey : String) -> Bool
  
}
class CoreDataManager : CoreDataOperations{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext : NSManagedObjectContext!
    let entity : NSEntityDescription!
    
    private static var sharedInstance : CoreDataManager?
    
    public static func getInstance()->CoreDataManager{
        
        if sharedInstance == nil {
            sharedInstance = CoreDataManager()
        }
        
        return sharedInstance!
            
    }
    
    private init(){
        managedContext = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Favourite", in: self.managedContext)
    }
    
    func saveToCoreData(recipe : Recipe, isFavourite:Bool) {
        
        let recipes = NSManagedObject(entity: entity!, insertInto: managedContext)
            recipes.setValue(recipe.calories, forKey: "calories")
            recipes.setValue(recipe.carbos, forKey: "carbos")
            recipes.setValue(recipe.fats, forKey: "fats")
            recipes.setValue(recipe.fibers, forKey: "fibers")
            recipes.setValue(recipe.id, forKey: "id")
            recipes.setValue(recipe.image, forKey: "image")
            recipes.setValue(recipe.ingredients, forKey: "ingrediants")
            recipes.setValue(recipe.proteins, forKey: "proteins")
            recipes.setValue(recipe.name, forKey: "name")
            recipes.setValue(isFavourite, forKey: "isFav")
            
            do{
                try managedContext.save()
            }catch let error {
                print (error)
        }
    }
 
    func deleteFromCoreData(recipeKey : String) {
        let fetchRecipes = fetchFromCoreData()
        
        for item in fetchRecipes {
            if item.value(forKey: "id") as! String == recipeKey {
                managedContext.delete(item)
            }
        }
        do {
            try managedContext.save()
        } catch let error {
            print (error)
        }
    }
    
    func fetchFromCoreData() -> [NSManagedObject] {
        
        var recipeFromCoreData : [NSManagedObject]!
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")
        
        do{
            recipeFromCoreData = try self.managedContext.fetch(fetchRequest)
           
        } catch let error {
            print (error)
        }
        
        return recipeFromCoreData
    }
    
    func isFavourite(recipeKey : String) -> Bool {
        
        let fetchRecipes = fetchFromCoreData()
        
        for item in fetchRecipes {
            if item.value(forKey: "id") as! String == recipeKey {
               return true
            }
        }
        return false
    }
    
}

