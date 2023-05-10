//
//  SimulatorController.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import Foundation

protocol SimulationDelegate: AnyObject {
    func reloadSubjectsView(for indexes: [Int])
}

class SimulationController {
    // MARK: - Singleton
    static let shared = SimulationController()
    private init() {}
    
    
    // MARK: - Private properties
    private var parameters: Parameters!
    
    private var subject: [Subjects] = []
    private var indexesForReload: [Int] = []
    private var indexesOfInfectedSubject: [Int] = []
    
    private weak var timer: Timer?
    private weak var simulationDelegate: SimulationDelegate?
    
    private let queue = DispatchQueue.global(qos: .userInitiated)
    
    
    // MARK: - Public methods
    func startCalculation(with parameters: Parameters, delegate: SimulationDelegate) {
        self.parameters = parameters
        self.simulationDelegate = delegate
        createTemplateSubjects()
        startTimer()
    }
    
    func didTapSubject(at index: Int) {
        guard index <= subject.count else { return }
        
        if subject[index].tryInfect() {
            indexesOfInfectedSubject.append(index)
            simulationDelegate?.reloadSubjectsView(for: [index])
        }
    }
    
    func getSubjectsSize() -> Int {
        return subject.count
    }
    
    func getSubjectAtIndex(_ i: Int) -> Subjects {
        guard i < subject.count else { return Subjects()}
        return subject[i]
    }
    
    func stopCalculation() {
        timer?.invalidate()
        indexesOfInfectedSubject = []
        subject = []
    }
    
    func getInfectedCount() -> Int {
        return indexesOfInfectedSubject.count
    }
    
    
    // MARK: - Private methods
    private func createTemplateSubjects() {
        subject = [Subjects](repeating: Subjects(), count: parameters.groupSize)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: parameters.tInterval, target: self, selector: #selector(calculateInfection), userInfo: nil, repeats: true)
        timer?.tolerance = parameters.tInterval * 0.2
    }
    
    @objc private func calculateInfection(){
        guard indexesOfInfectedSubject.count != subject.count else { return }
        
        queue.async {
            for h in self.indexesOfInfectedSubject {
                self.infectNearSubjects(for: h, times: self.parameters.infectionFactor)
            }

            DispatchQueue.main.async {
                self.simulationDelegate?.reloadSubjectsView(for: self.indexesForReload.map { $0 } )
            }
        }

        self.indexesForReload = []
    }
    
    private func infectNearSubjects(for index: Int, times: Int) {
        guard times > 0 else { return }
        
        let NearSubjectIndexes = getNearIndexes(for: index)
        
        let n = NearSubjectIndexes[Int.random(in: 0..<NearSubjectIndexes.count)]
        if n >= 0 && n < subject.count {
            if subject[n].tryInfect() {
                indexesOfInfectedSubject.append(n)
                indexesForReload.append(n)
            }
            if Bool.random() {
                infectNearSubjects(for: n, times: times - 1)
            }
        }
    }
    
    private func getNearIndexes(for index: Int) -> [Int] {
        var indexes = [index+7, index-7]
        
        if index % 7 == 0 {
            indexes.append(index+1)
        }
        else if index % 7 == 6 {
            indexes.append(index-1)
        }
        else {
            indexes.append(index-1)
            indexes.append(index+1)
        }
        return indexes
    }
}
