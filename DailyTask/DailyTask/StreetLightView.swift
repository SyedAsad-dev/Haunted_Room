//
//  Untitled.swift
//  DailyTask
//
//  Created by Rizvi Naqvi on 24/09/2024.
//
import SwiftUI


struct HauntedHouseView: View {
    @State private var isVisible = false
    @State private var isOn = false
    @State private var timer: Timer?
    @State private var swing = false
    @State private var flickerOpacity: Double = 0.40

    let backgroundImage = Image("bg2")  // Background image
    let bulbImage = Image("6")          // Bulb image
    
    var body: some View {
        ZStack {
            // Background Image and Overlay
            backgroundImage
                .resizable()
                .scaledToFill()
                .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            
            // Adding spooky elements
            addSpookyElements()
            
            
            // Streetlight and bulb setup
            VStack {
                createRopeAndBulb()
                Spacer()
            }
            .rotationEffect(.degrees(swing ? -15 : 15), anchor: .top) // Swing effect
            .animation(
                Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true),
                value: swing
            )
            .onAppear {
                swing.toggle()
                startAnimations()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    // Spooky elements (faces, spiders, etc.)
    private func addSpookyElements() -> some View {
        Group {
            createSpookyImage(name: "halloween (2)", width: 80, height: 80, opacity: 1, x: 310, y:  5)  .shadow(color: Color.yellow.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0)
            
            createSpookyImage(name: "halloween (2)", width: 80, height: 80, opacity: 1, x: 310, y: 3.5)  .shadow(color: Color.yellow.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0)
            
            createSpookyImage(name: "halloween (2)", width: 80, height: 80, opacity: 1, x: 310, y: 22).shadow(color: Color.red.opacity(isVisible ? 0.7 : 0.0), radius: 10 , x: 0, y: 0)
            
            
            createSpookyImage(name: "spider", width: 50, height: 50, opacity: 0.6, x: 210, y: 3)
            
            createSpookyImage(name: "spider 1", width: 50, height: 50, opacity: 0.5, x: 190, y: 4)
            
            createSpookyImage(name: "spider 1", width: 50, height: 50, opacity: 0.5, x: 170, y: 5)
            
            createSpookyImage(name: "spider 2", width: 50, height: 50, opacity: 0.55, x: 35, y: 5)
            
            createSpookyImage(name: "spider 1", width: 50, height: 50, opacity: 0.5, x: 150, y: 3)
            
            createSpookyImage(name: "spider 1", width: 70, height: 50, opacity: 0.5, x: 300, y: 1.7)
            
            createSpookyImage(name: "spider 1", width: 70, height: 50, opacity: 0.5, x: 150, y: 2)    .shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0)
            
            
            createSpookyImage(name: "halloween (2)", width: 90, height: 90, opacity: 1, x: 150, y: 2)    .shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0)
            
            
            
            createSpookyImage(name: "clock", width: 120, height: 120, opacity: 0.7, x: 35, y: 20)    .shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0).shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0)
            
            createSpookyImage(name: "blood", width: 120, height: 320, opacity: 0.2, x: 150, y: 4.5)    .shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 10 , x: 0, y: 0).shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 30 * 1, x: 0, y: 0)
            
            
            createSpookyImage(name: "halloween2", width: 50, height: 50, opacity: 0.2, x: 315, y: 2.5)     .shadow(color: Color.yellow.opacity(isVisible ? 1 : 0.0), radius: 9, x: 0, y: 0)
            
            Rectangle().cornerRadius(5).foregroundColor(Color.yellow)
                .frame(width: 75, height: 60) //
                .opacity(isVisible ? 1 : 0.2)
                .shadow(color: Color.yellow.opacity(isVisible ? 0.8 : 0.0), radius: 30 * 1, x: 0, y: 0)
                .position(x: UIScreen.main.bounds.width + 22, y: UIScreen.main.bounds.height / 1.37) // Position on the side
            
            
            createSpookyImage(name: "pumpkin", width: 100, height: 100, opacity: 1, x: 22, y: 1.38) .shadow(color: Color.yellow.opacity(isVisible ? 1 : 0.0), radius: 30 * 1, x: 0, y: 0)
            
            
            Rectangle().foregroundColor(Color.red)
                .frame(width: 25, height: 8) //
                .opacity(isVisible ? 1 : 0.5)
                .shadow(color: Color.yellow.opacity(isVisible ? 1 : 0.0), radius: 30 * 1, x: 0, y: 0)
                .position(x: UIScreen.main.bounds.width + 272, y: UIScreen.main.bounds.height / 1.45) // Position on the side
            
            createSpookyImage(name: "black-evil-cat", width: 100, height: 100, opacity: 1, x: 295, y:  1.37) .shadow(color: Color.red.opacity(isVisible ? 1 : 0.0), radius: 30 * 1, x: 0, y: 0)
            
            
        }
    }
    
    // Create each spooky image with its properties
    private func createSpookyImage(name: String, width: CGFloat, height: CGFloat, opacity: Double, x: CGFloat, y: CGFloat) -> some View {
        Image(name)
            .resizable()
            .frame(width: width, height: height)
            .opacity(opacity)
            .position(x: UIScreen.main.bounds.width + x, y: UIScreen.main.bounds.height / y)
    }
    
    // Create the rope and bulb setup with flickering light
    private func createRopeAndBulb() -> some View {
        VStack {
            // Rope
            RustyRopeShape()
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: 0x240d02), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 5, height: 150)

            // Bulb and light
            bulbImage
                .resizable()
                .opacity(0.5)
                .frame(width: 150, height: 15)
                .padding(.top, -5)

            // Flickering light effect
            Circle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.yellow.opacity(isOn ? (flickerOpacity - 0.1) : 0.0), Color.clear]), center: .top, startRadius: 50 * flickerOpacity, endRadius: 270))
        }
    }

    // Start animations (visibility, flickering)
    private func startAnimations() {
        withAnimation(.easeIn(duration: 5)) {
            isVisible = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeOut(duration: 8).repeatForever()) {
                isVisible.toggle()
            }
        }
        
        startFlickering()
    }

    // Start flickering effect with randomness
    private func startFlickering() {
        timer = Timer.scheduledTimer(withTimeInterval: randomFlickerInterval(), repeats: true) { _ in
            flickerBulb()
        }
    }

    // Flicker the bulb with variable intensity
    private func flickerBulb() {
        isOn = true
        
        withAnimation(.easeInOut(duration: randomFlickerDuration())) {
            flickerOpacity = Double.random(in: 0.4...0.5) // Random brightness intensity
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + randomFlickerDuration()) {
            withAnimation(.easeInOut(duration: randomFlickerDuration())) {
                flickerOpacity = Double.random(in: 0.0...0.5) // Dimming or turning off
            }
        }
    }

    // Generate random flicker intervals (0.1 to 1.5 seconds)
    private func randomFlickerInterval() -> TimeInterval {
        return TimeInterval.random(in: 0.05...1.5)
    }

    // Generate random flicker durations (0.05 to 0.3 seconds)
    private func randomFlickerDuration() -> TimeInterval {
        return TimeInterval.random(in: 1...4)
    }
}

// Custom Rusty Rope Shape (Straight)
private struct RustyRopeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

#Preview {
    HauntedHouseView()
}


extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
