//
//  Localize.swift
//  ScoopMe
//
//  Created by Jacob Frost on 3/29/20.
//  Copyright © 2020 Jacob Frost. All rights reserved.
//

import Foundation


func getLocalDistance(distance: Double) -> String {
    let formatter = MeasurementFormatter()
    let distanceInKilometers = Measurement(value: distance, unit: UnitLength.kilometers)
    
    //This should not really be included but must be used as an example
    //formatter.locale = Locale(identifier: "es_MX")
    
    print(formatter.locale ?? "No Local Found")
    
    return formatter.string(from: distanceInKilometers)
}

func formatDate(dateToFormat: Date) -> String{
    let formatter1 = DateFormatter()

    formatter1.dateStyle = .medium
    formatter1.timeStyle = .short
    return
        formatter1.string(from: dateToFormat)
}
