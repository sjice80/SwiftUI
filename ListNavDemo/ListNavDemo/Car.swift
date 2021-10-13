//
//  Car.swift
//  ListNavDemo
//
//  Created by SueJung Kim on 2021/10/11.
//

import SwiftUI

struct Car : Codable, Identifiable {
    var id: String
    var name: String

    var description: String
    var isHybrid: Bool

    var imageName: String
}
