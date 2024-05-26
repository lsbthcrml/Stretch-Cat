import SwiftUI
import HealthKit

struct HeartRateView: View {
    let healthStore = HKHealthStore()
    let healthDataFetcher = HeartRateDetection()
    @State var heartRate = 80
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("heart")

                
                Text("\(heartRate)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("army"))
                
                Text("BPM")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("army"))
            
                
                Spacer()
            }
            
            HStack{
//                Text("\(heartRate)")
//                    .fontWeight(.regular)
//                    .font(.system(size: 70))
//                
//                Text("BPM")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.red)
//                    .padding(.bottom, 28.0)
//                
//                Spacer()
                
            }
            
        }
        .padding()
        .onAppear {
            healthDataFetcher.requestAuthorization { success in
                if success {
                    // Fetch and display heart rate
                    healthDataFetcher.fetchHeartRateData { rate in
                        DispatchQueue.main.async {
                            self.heartRate = Int(rate)
                        }
                    }
                    // Start observing live heart rate updates
                    healthDataFetcher.observeLiveHeartRateUpdate { liveRate in
                        DispatchQueue.main.async {
                            self.heartRate = Int(liveRate)
                        }
                    }
                } else {
                    print("Authorization failed")
                }
            }
        }
    }
}
#Preview {
    HeartRateView()
}

//
//  HeartRateDetection.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 20/05/24.
//

import Foundation
import HealthKit


class HeartRateDetection {
    
    let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
            let heartRates = HKObjectType.quantityType(forIdentifier: .heartRate)!
            healthStore.requestAuthorization(toShare: [], read: [heartRates]) { success, error in
                completion(success)
            }
        }
    
    func fetchHeartRateData(completion: @escaping (Double) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            completion(0)
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date().addingTimeInterval(-60), end: Date(), options: .strictEndDate)
        let query = HKStatisticsQuery(quantityType: heartRateType, quantitySamplePredicate: predicate, options: .discreteAverage) { _, result, error in
            guard let result = result, let average = result.averageQuantity() else {
                completion(0)
                return
            }
            let heartRate = average.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
            completion(heartRate)
        }
        
        healthStore.execute(query)
    }
    
    
    func observeLiveHeartRateUpdate(completion: @escaping (Double) -> Void) {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        healthStore.enableBackgroundDelivery(for: heartRateType, frequency: .immediate) { success, error in
            if success {
                let observerQuery = HKObserverQuery(sampleType: heartRateType, predicate: nil) { query, completionHandler, error in
                    self.fetchHeartRateData { heartRate in
                        completion(heartRate)
                    }
                    completionHandler()
                }
                self.healthStore.execute(observerQuery)
            } else {
                // Handle error
                print("Error enabling background delivery: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
