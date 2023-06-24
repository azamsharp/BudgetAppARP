//
//  BaseModel.swift
//  SpendSmartARP
//
//  Created by Mohammad Azam on 6/18/23.
//

/*
 import Foundation
 import SwiftData
 
 protocol BaseModelProtocol where Self: PersistentModel {
 func save() throws
 static var all: FetchDescriptor<Self> { get }
 func delete() throws
 }
 
 extension BaseModelProtocol {
 
 @MainActor
 func save() throws {
 // Accessing container will make it hard to work for previews
 // This container is the real one (database) declared in the App file
 // Injecting a previewContainer is not possible with this implementation
 container.mainContext.insert(self)
 try container.mainContext.save()
 }
 
 static var all: FetchDescriptor<Self> {
 return FetchDescriptor<Self>()
 }
 
 @MainActor
 func delete() throws {
 container.mainContext.delete(self)
 try container.mainContext.save()
 }
 
 }
 
 */
