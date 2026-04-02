//
//  HapticsManager.swift
//  Hummy
//
//  Created by Nyla Wilson on 2/18/26.
//
import CoreHaptics

class HapticsManager: ObservableObject {
    private var engine: CHHapticEngine?
    private var player: CHHapticAdvancedPatternPlayer?
    @Published var isVibrating = true

    init() {
        startEngine()
    } // initializer ending brace

    func startEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch { print("Engine start error: \(error)") }
    } // start engine ending brace

    func toggleVibration() {
        if isVibrating {
            stop()
        } else {
            start()
        } // if else ending brace
    } // toggle vib. ending brace

    func start() {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 3.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 500)

        do {
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            player = try engine?.makeAdvancedPlayer(with: pattern)
            player?.loopEnabled = true
            try player?.start(atTime: 0)
            isVibrating = true
        } catch {
            print("Start error: \(error)")
        } // do catch ending brace
    } // start func ending brace

     func stop() {
        do {
            try player?.stop(atTime: CHHapticTimeImmediate)
            isVibrating = false
        } catch {
            print("Stop error: \(error)")
        } // do catch ending brace
    } // stop func ending brace
} // class ending brace
