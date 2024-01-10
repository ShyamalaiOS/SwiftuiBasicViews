//
//  AstronautView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI



struct AstronautView: View {
    struct flew {
        let role : String
        let mission: Mission
    }
    
    let astronaut : AstronautDetail
    var allMissions : [flew]
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Missions:")
                                .font(.title)
                                .bold()
                                .padding(.leading)
                                .padding(.bottom, 5)
                            
                            ForEach(allMissions, id: \.role) {mission in
                                HStack {
                                    Text("\(mission.mission.displayName):")
                                        .font(.headline)
                                        .bold()
                                        .padding(.leading)
                                        
                                    Text(mission.role)
                                        .font(.subheadline)
                                }
                            }

                        }
                        Spacer()
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: AstronautDetail, missions: [Mission]) {
        self.astronaut = astronaut
        
        
        var allMissions = [flew]()
        
        for mission in missions {
            for member in mission.crew {
                if member.name == self.astronaut.id {
                    allMissions.append(flew(role: member.role, mission: mission))
                }
            }
        }
        self.allMissions = allMissions
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts :Astronauts = Bundle.main.decode("astronauts.json")
    
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts.list[7], missions: missions)
    }
}
