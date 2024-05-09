//
//  UniversityRealmModel.swift
//  Assestment Test
//
//  Created by Admin on 08/05/24.
//

import RealmSwift

// Define a Realm object model
class University: Object {
    @Persisted var name: String = ""
    @Persisted var stateProvince: String?
    @Persisted var domains = List<String>()
    @Persisted var webPages = List<String>()
    @Persisted var alphaTwoCode: String?
    @Persisted var country: String?
}

