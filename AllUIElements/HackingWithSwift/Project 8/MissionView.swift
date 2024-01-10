//
//  MissionView.swift
//  AllUIElements
//
//  Created by Shyamala Ramanathan on 10/01/24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
           let role : String
           let astronaut : AstronautDetail
       }
     let allmission : [Mission] = Bundle.main.decode("missions.json")
    
    let mission : Mission
       let astronauts: [CrewMember]
    
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView{
                VStack(spacing: 20){
                    Image(allmission[0].image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal){size,axis in
                            size*0.6
                        }
                        .padding(.top)
                        
                    VStack{
                        Text("Launch Date : \(allmission[0].formatedLaunchedData)")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                        
                        Text(allmission[0].description)
                            .multilineTextAlignment(.center)
                            .layoutPriority(1)
                            .padding()
                    }
                    
                    ForEach(self.astronauts,id: \.role){crewmember in
                        NavigationLink {
                            AstronautView(astronaut: crewmember.astronaut, missions: allmission)
                        } label: {
                            HStack{
                                Image(crewmember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 83,height: 60)
                                    .clipShape(.capsule)
                                    .overlay {
                                        Capsule().stroke(Color.red,lineWidth: 1)
                                    }
                            }
                            VStack(alignment: .leading){
                                Text(crewmember.astronaut.name)
                                    .foregroundColor(.primary)
                                    .font(.headline)
                            
                                Text(crewmember.role)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }.padding(.horizontal)

                    }
                    Spacer(minLength: 25)
                }
            }
        }).navigationBarTitle(Text(mission.displayName),displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [AstronautDetail]) {
            self.mission = mission
            
            var matches = [CrewMember]()
            for member in mission.crew {
                if let match = astronauts.first(where: {$0.id == member.name}) {
                    matches.append(CrewMember(role: member.role, astronaut: match))
                }
                else {
                    fatalError("Can not find \(member)")
                }
            }
            self.astronauts = matches
        }
   
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: Astronauts = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[4], astronauts: astronauts.list)
    }
}
