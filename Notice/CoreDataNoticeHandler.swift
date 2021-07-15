//
//  CoreDataNoticeHandler.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataNoticeHandler
{
    static let shared = CoreDataNoticeHandler()
    
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
    
    func insert(name:String ,notice:String, completion: @escaping () -> Void)
    {
        let note = Notice(context: managedObjectContext!)
        note.name = name
        note.notice = notice
    
        save()
        completion()
    }
    func update(note:Notice, name:String ,notice:String, completion: @escaping () -> Void)
    {
      
        note.name = name
        note.notice = notice
        
        
        save()
        completion()
    }
    
  
    func delete(note:Notice, completion: @escaping () -> Void)
    {
        managedObjectContext!.delete(note)
        save()
        completion()
    }
    func fetch() -> [Notice]
    {
        let fetchRequest:NSFetchRequest<Notice> = Notice.fetchRequest()
        
        do
        {
            let noteArray = try managedObjectContext?.fetch(fetchRequest)
            
            return noteArray!
        } catch {
            print(error)
            let noteArray = [Notice]()
            return noteArray
        }
    }
    
    
    
}
