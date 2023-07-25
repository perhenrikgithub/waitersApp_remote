//
//  SeatingImage.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 18/07/2023.
//

import SwiftUI

struct SeatingImage: View {
    var numberOfChairs: Int
    var size = 60
    var scale = 1.0
    
    init(numberOfChairs: Int) {
        self.numberOfChairs = numberOfChairs
        if numberOfChairs > 5 {
            scale = 0.65
        }
        if numberOfChairs > 10 {
            scale = 0.5
        }
        if numberOfChairs > 18 {
            scale = 1.1
        }
    }

    var body: some View {
        Rectangle()
            .frame(height: 1)
        
        ZStack {
            if self.numberOfChairs <= 5 {
                HStack {
                    ForEach(Range<Int>(uncheckedBounds: (0, self.numberOfChairs)), id: \.self) { _ in
                        Image(systemName: "chair")
                            .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                    }
                }
            } else if self.numberOfChairs <= 10 {
                VStack {
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, 5)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                    
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, self.numberOfChairs - 5)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                }
            } else if self.numberOfChairs <= 12 {
                VStack {
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, 6)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                    
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, self.numberOfChairs - 6)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                }
            } else if self.numberOfChairs <= 18 {
                VStack {
                    
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, 6)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                    
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, 6)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                    
                    HStack {
                        ForEach(Range<Int>(uncheckedBounds: (0, self.numberOfChairs - 12)), id: \.self) { _ in
                            Image(systemName: "chair")
                                .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                        }
                    }
                }
            } else if self.numberOfChairs > 18 {
                HStack {
                    Image(systemName: "chair")
                        .font(.system(size: CGFloat(Double(self.size) * self.scale)))
                    
                    Text("x " + String(self.numberOfChairs))
                        .font(.system(size: CGFloat(Double(self.size) * 0.6)))
                }
            }
        }
        .frame(height: 100)
        .padding(.vertical)
        
        Rectangle()
            .frame(height: 1)
    }
}


struct SeatingImage_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) { // Use LazyVStack for improved performance
                ForEach(1...34, id: \.self) { numberOfChairs in
                    SeatingImage(numberOfChairs: numberOfChairs)
                }
            }
            .padding() // Add padding to the content inside ScrollView
        }
    }
}
