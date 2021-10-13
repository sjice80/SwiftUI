//
//  CarStore.swift
//  ListNavDemo
//
//  Created by SueJung Kim on 2021/10/11.
//

import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars: [Car]
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
