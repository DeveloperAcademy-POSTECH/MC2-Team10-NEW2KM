//
//  Persistence.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()

    // MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    // MARK: - 3. INITIALIZATION (load rhe persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Moasa")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for idx in 0..<5 {
            let newItem = ConsumedItem(context: viewContext)
            newItem.consumedDate = Date()
        } //: SAMPLE DATA FOR PREVIEW
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
