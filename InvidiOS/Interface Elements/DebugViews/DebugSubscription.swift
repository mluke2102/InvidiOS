//
//  DebugSubscription.swift
//  InvidiOS
//
//  Created by Matt Luke on 7/1/22.
//

import SwiftUI
import CloudKit



class DebugSubscriptionVM: ObservableObject {
    
    @Published var text: String = ""
    @Published var subscriptions: [SubscribedChannelModel] = []
    private let database = CKContainer(identifier: "iCloud.mluke.invidiOS").privateCloudDatabase
    
    init() {
        fetchItems()
    }
    
    func sendButtonPressed() {
        guard !text.isEmpty else { return }
        addItem(id: text)
    }
    
    func addItem(id: String) {
        let subscription = CKRecord(recordType: "SubscribedChannel")
        subscription["channelID"] = id
        saveData(record: subscription)
        
        
    }
    
    func saveData(record: CKRecord) {
        database.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            DispatchQueue.main.async {
                self?.text = ""
                self?.fetchItems()
            }
            
        }
    }
    
    func fetchItems() {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "SubscribedChannel", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "channelID", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedItems: [SubscribedChannelModel] = []
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let name = record["channelID"] as? String else { return }
                returnedItems.append(SubscribedChannelModel(name: name, record: record))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("RETURNED RESULT: \(returnedResult)")
            
            DispatchQueue.main.async {
                self?.subscriptions = returnedItems
            }
        }
        
        addOperation(operation: queryOperation)
    }
    
    func addOperation(operation: CKDatabaseOperation) {
        database.add(operation)
    }
    
    func updateItem(channel: SubscribedChannelModel, updatedID: String) {
        let record = channel.record
        record["ChannelID"] = updatedID
        saveData(record: record)
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let channel = subscriptions[index]
        let record = channel.record
        
        database.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, returnedError in
            DispatchQueue.main.async {
                self?.subscriptions.remove(at: index)
            }
            
        }
    }
    
}

struct DebugSubscription: View {
    
    @StateObject private var vm = DebugSubscriptionVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Manually enter a Channel ID") {
                        TextField("Add Something Here...", text: $vm.text)
                    }
                    Section("Stored Subscriptions") {
                        ForEach(vm.subscriptions, id: \.self) { channel in
                            Text(channel.name)
                        }.onDelete(perform: vm.deleteItem)
                    }
                }.refreshable {
                    vm.fetchItems()
                }
                Button {
                    vm.sendButtonPressed()
                    
                } label: {
                    Text("Send to iCloud")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
                        .padding()
                        
                }
            }.background(Color(UIColor.systemGroupedBackground))
                .navigationTitle("iCloud Tests")
        }
        
    }
}

struct CloudKitTestTwo_Previews: PreviewProvider {
    static var previews: some View {
        DebugSubscription()
    }
}
