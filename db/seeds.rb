# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  Event.destroy_all
  Group.destroy_all
  Membership.destroy_all
  Photo.destroy_all
  Sponsor.destroy_all
  User.destroy_all
  Venue.destroy_all
end


# create_table "Users", :force => true do |t|
# create_table "Users", :force => true do |t|
#     t.string   "name"
#     t.string   "userid"
#     t.string   "email"
#     t.boolean  "admin"
#     t.string   "password_digest"
#     t.datetime "created_at",      :null => false
#     t.datetime "updated_at",      :null => false
#   end

UserNames = ["Jacob", "Sophia", "Mason", "Isabella", "William", "Emma", "Jayden", "Olivia", "Noah", "Ava", "Michael", "Emily", 
	"Ethan", "Abigail", "Alexander", "Madison", "Aiden", "Mia", "Daniel", "Chloe", "Anthony", "Elizabeth", "Matthew", "Ella", 
	"Elijah", "Addison", "Joshua", "Natalie", "Liam", "Lily", "Andrew", "Grace", "James", "Samantha", "David", "Avery", 
	"Benjamin", "Sofia", "Logan", "Aubrey", "Christopher", "Brooklyn", "Joseph", "Lillian", "Jackson", "Victoria", "Gabriel", 
	"Evelyn", "Ryan", "Hannah", "Samuel", "Alexis", "John", "Charlotte", 
	"Nathan", "Zoey", "Lucas", "Leah", "Christian", "Amelia"] 

	
	UserNames.each_with_index do |uname, i|
		User.create name: uname, 
				userid: i , 
				email: "#{uname}@gmail.com"
				#password_digest: uname 
				#FIXME
	end





#venues
VenueNames = ["MovieTheatre","basketballCourt","Hockey Ring", "FriendsHouse","BrooklynTap","galligars","ChuckyCheese","Mcshmidts","Starbucks","Caribou","Outdoors","Library","Kitchen","Niros Cafe","Sears Tower"]
VenueAddress= ["1 movietheatre lane","1 basketball lane", "1 hockey lane","2 street cove","44 w maddison", "33 w jackson", "8 S canal", "618 W wellington", "4 S broadway", "11 east jackson", "6 N Madison", "4 S monroe","9 w southport","11 N Lakeshore","2583 w 55th"]


VenueNames.each_with_index do |vname, i|
	Venue.create name: vname, 
				address: VenueAddress[i] 
				# password_digest:  uname 
				#FIXME
end 
# create_table "events", :force => true do |t|

EventNames = ["Poolhall Jam", "Potluck","Date Auction", "charity dinner", "hangout", "exchnage",
				"Coding Explained","statistics explained","Data munging", "Training Session",
				"Replay watching","Public Prayer","meditation Workshop", "Emotional discussion",
			 "Rejuvination workshop","BibleStudy","Poetry Jame","Using Primary colors hangout",
			 "Horse betting 101", "Poker strategy discussion", "Outsourcing optimization" , "Ping Pong Hangout" ]


GroupNames = ["VideoGamers","ReligousPPL","TallPeople" , "ChicagoRuby" , "YogaGroup" , "OutdoorsGroup" , "MovieFans" , 
	"WebDeveleporsGroup" , "BookReadersGroup", "ProfessionalGamers", "Poker players" , "Dancers", "rappersGroup" ,"Chicago Adventure Group" ,
"BrazillianCultureGroup" , "Volleyball players", "Swim trainers", "Intercity Volunteers"]
GroupDescrip = ["We Play VideoGames","we are religous","we talk about height","We like Ruby","Yogis welcome","we explore nature", "we talk about films" ,
"We make websites", "we read books" , "We Play VideoGames", "we talk about poker", "We like to dance", "we talk about rapping" , "We try to go on adventures",
"We talk about brazillian culture" , "we play volleyball" , "Lets train people to swim", "help intercity youth"]
Tags = ["recreational","spiritual","Niche","Professional","Social"]


#   create_table "sponsors", :force => true do |t|
#     t.string   "name"
#     t.string   "description"

SponsorNames = ["SalesForce" , "Citadel" , "RevolutionAnalytics","Google","PTA","CityOfChicago","Starbucks","CSPP","WPT","ChicagoBulls"]
DescriptionList = ["InternetCompany" , "FinancialCompany","SoftwareCompany","SearchCompany","EducationalGroup","PublicInsitution","CoffeeCompany","AcademicProgram","PokerOrganization","Basketball Team"]


i=-1
SponsorNames.each do |spons| 
	i+=1 
	Sponsor.create name: spons,
		description: DescriptionList[i]
end	


SponsorSize = SponsorNames.size - 1 

GroupNames.each_with_index do |gname, i|
	Group.create name: gname, 
				tag: Tags.sample() , 
				description: GroupDescrip[i], 
				sponsorid: Sponsor.find_by_name(SponsorNames[rand(SponsorSize)]).id

				# password_digest:  uname 
				#FIXME
end 


VenueSize= VenueNames.size - 1 
GroupSize = GroupNames.size - 1 
EventNames.each_with_index do |event , i |
	Event.create name: EventNames[i] , 
	time: Time.now.beginning_of_day + rand(24.hours) , 
	venue_id: Venue.find_by_name(VenueNames[rand(VenueSize)]).id , 
	group_id: Group.find_by_name(GroupNames[rand(GroupSize)]).id
	#FIXME , display the actual venue
end
  



#


#   create_table "memberships", :force => true do |t|
#     t.integer  "userid"
#     t.integer  "groupid"

# i=0
# UserNames.each do 
# 	i+=1
# 	Membership.create user_id: i , 
# 		group_id: rand(GroupNames.size)  
				
# 		# password_digest:  uname 
# 		#FIXME
# end 



#   create_table "photos", :force => true do |t|
#     t.string   "name"
#     t.integer  "eventid"







