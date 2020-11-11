require_relative '../config/environment'
require "pry"

#Display Welcome to our App 

#Activate authentication of user. (New User or Existing User)
current_user = User.setup_user


#When They create user or login, they will have a menu of what their options are 
    # Find Events
    # Your Tickets


    # if "Find Events" is selected, show menu of 
        # Find by Event Type
        # Find by City 
        # Find by State (I DONT THINK WE NEED THIS ATTRIBUTE TO SEARCH BY SINCE WE HAVE CITY, STILL OK TO KEEP ON TABLE THOUGH )
        # Find by Zip

        #if "Find by event type" show menu of 
            #Sporting Event
            #Concert
            #------------THE BELOW CODE CAN BE USED FOR ALL "FIND BY" SELECTIONS -------------
                #Returns a list of events based on the chosen type
                   #scroll over the list of events and choose which one you want 
                   # Once clicked, show how much per ticket (NOT SURE HOW TO DO THIS) and say "Choose Quantity"
                     # User enters in quantity with a chomp
                        #Returns a "Thank you for Your Purchase, your Tickets are available in your account"

        #if "Find by City" show menu of cities
            # Chicago
            # Milwaukee
            # St. Louis 
            # Minneapolis
            # Indianapolis 
                #------------THE BELOW CODE CAN BE USED FOR ALL "FIND BY" SELECTIONS------------ 
                    #Returns a list of events based on the chosen type
                    #scroll over the list of events and choose which one you want 
                    # Once clicked, show how much per ticket (NOT SURE HOW TO DO THIS) and say "Choose Quantity"
                        # User enters in quantity with a chomp
                            #Returns a "Thank you for Your Purchase, your Tickets are available in your account"

        #if "Find by State" show menu of cities ( I DONT THINK WE NEED THIS ATTRIBUTE TO SEARCH BY SINCE WE HAVE CITY )
            # Illinois
            # Wisconsin
            # Misouri
            # Minnessota 
            # Indiana 
                #------------THE BELOW CODE CAN BE USED FOR ALL "FIND BY" SELECTIONS------------ 
                    #Returns a list of events based on the chosen type
                    #scroll over the list of events and choose which one you want 
                    # Once clicked, show how much per ticket (NOT SURE HOW TO DO THIS) and say "Choose Quantity"
                        # User enters in quantity with a chomp
                            #Returns a "Thank you for Your Purchase, your Tickets are available in your account"
    
        #if "Find by zip" will need a user input ( I DONT THINK WE NEED THIS ATTRIBUTE TO SEARCH BY SINCE WE HAVE CITY )
            # USER INPUT (CHOMP)
                #------------THE BELOW CODE CAN BE USED FOR ALL "FIND BY" SELECTIONS------------ 
                    #Returns a list of events based on the chosen type 
                    #If there are no events in that ZIP, you will receive a message "No Results found, please try another zip"
                    #scroll over the list of events and choose which one you want 
                    # Once clicked, show how much per ticket (NOT SURE HOW TO DO THIS) and say "Choose Quantity"
                        # User enters in quantity with a chomp
                            #Returns a "Thank you for Your Purchase, your Tickets are available in your account"





















# def display_title
#     font = TTY::Font.new("3d")
#     pastel = Pastel.new
#     puts pastel.green(font.write("Welcome"))
#     puts pastel.yellow(font.write("TO"))
#     puts pastel.magenta(font.write("OUR_TICKET_BUYING_APP"))
#     sleep(5,)
# end

# display_title
# system "clear"

# puts "Please Enter Your Name"
# name = gets.chomp
# system "clear"
# sleep(2,)
# puts "Welcom #{name}"
# sleep(2,)
# promt = TTY::Prompt.new
# input = prompt.select("Please Choose an Event", %w(Sporting_Event, Concert))

# if input == "Sporting Event"
#     #some argument or formula
# elsif input == "Concert"


# # cli = CommandLineInterface.new
# # cli.run
