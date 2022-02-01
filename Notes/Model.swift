//
//  Model.swift
//  Notes
//
//  Created by Владислав Ковальский on 30.01.2022.
//

import Foundation

struct Items: Equatable, Codable {
    var title: String
    var note: String
}

var items: [Items] {
    set {
        let itemsData = try! PropertyListEncoder().encode(newValue)
        UserDefaults.standard.set(itemsData, forKey: "newValue")
    }
    get {
        if UserDefaults.standard.data(forKey: "newValue") != nil {
            let fetchedData = UserDefaults.standard.data(forKey: "newValue")!
            let fetchedItems = try! PropertyListDecoder().decode([Items].self, from: fetchedData)
            return fetchedItems
        } else {
            return []
        }
    }
}

func addItem(title: String, note: String) {
    items.append(Items(title: title, note: note))
}
func deleteItem(at index: Int) {
    items.remove(at: index)
}


