//
//  Moonshot.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI

struct Moonshot: View {
    static let astonauts : Astronauts = Bundle.main.decode("astronauts.json")
    
    static let mission : [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingCrew = false
    
    let formattedMissions = Self.mission.map { mission in
        mission.crew.map {
            $0.name
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(Self.mission) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: Self.astonauts.list)
                    } label: {
                        HStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44,height: 44)
                         
                            VStack(alignment: .leading){
                                
                                Text("\(mission.displayName)")
                                Text("\(!showingCrew ? mission.formatedLaunchedData : formattedMissions[Self.mission.firstIndex { $0.id == mission.id} ?? 0].joined(separator: ", "))")
                            }.font(.headline)
                        }

                    }
                   
                }
            }
            .navigationBarItems(trailing:
                Button("\(showingCrew ? "Hide" : "Show") crew member"){
                    showingCrew.toggle()
                }
            )
            .navigationTitle("MoonShot")
        }
    }
}

#Preview {
    Moonshot().preferredColorScheme(.dark)
}


