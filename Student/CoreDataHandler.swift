//
//  CoreDataHandler.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 14/07/21.
//  Copyright © 2021 Vishal. All rights reserved.
//
import Foundation
import CoreData
import UIKit

class CoreDataHandler
{
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext: NSManagedObjectContext?
    
    private init()
    {
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save()
    {
        appDelegate.saveContext()
    }
    
    func insert(spid:String ,name:String ,clas:String , div:String, sem:Int, mobileno:String, password:String, completion: @escaping () -> Void)
    {
        let stud = Students(context: managedObjectContext!)
        stud.spid = spid
        stud.name = name
        stud.clas = clas
        stud.div = div
        stud.sem = Int64(sem)
        stud.mobileno = mobileno
        stud.password = password
 
        save()
        completion()
    }
    func update(stud:Students, spid:String ,name:String ,clas:String , div:String, sem:Int, mobileno:String, password:String, completion: @escaping () -> Void)
    {
        stud.spid = spid
        stud.name = name
        stud.clas = clas
        stud.div = div
        stud.sem = Int64(sem)
        stud.mobileno = mobileno
        stud.password = password
        
        save()
        completion()
    }
    
    func updatepwd(stud:Students , password:String, completion: @escaping () -> Void)
    {
        stud.password = password
        
        save()
        completion()
    }
    func delete(stud:Students, completion: @escaping () -> Void)
    {
        managedObjectContext!.delete(stud)
        save()
        completion()
    }
    func fetch() -> [Students]
    {
        let fetchRequest:NSFetchRequest<Students> = Students.fetchRequest()
        
        do
        {
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            
            return studArray!
        } catch {
            print(error)
            let studArray = [Students]()
            return studArray 
        }
    }
    
    
    
}
