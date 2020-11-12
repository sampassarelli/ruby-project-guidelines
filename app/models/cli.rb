require "tty-prompt"
require "tty-font"
require "colorize"


class CLI

    def self.main_menu(current_user)
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select ("Welcome to the Main Menu. Please Choose an Option!") do |menu|
            menu.choice "Find Tickets".light_blue.bold
            menu.choice "Your Tickets".white.bold
            menu.choice "Exit".light_red.bold
        end
    

        case user_input
        when "Find Tickets".light_blue.bold
            system "clear"
            self.events_menu
        when "Your Tickets".white.bold
            # puts "Your Ticket Works"
            self.user_tickets(current_user)
        when "Exit".light_red.bold
            system "clear"
            puts "Thank you for Using Raks of Tickets. We hope you enjoyed our CLI application!".yellow.bold
            sleep 3.5
            system "clear"
            exit!
        end
    end

    def self.events_menu
        prompt = TTY::Prompt.new
        user_input = prompt.select ("Please Select a Search Criterion") do |menu|
            menu.choice "Event Category".light_green.bold
            menu.choice "City".magenta.bold
            menu.choice "Zipcode".cyan.bold
            menu.choice "Return to Main Menu"
        end

        case user_input
        when "Event Category".light_green.bold
            system "clear"
            user_input2 = prompt.select ("Please Select an Event Type") do |menu|
                menu.choice "Sporting Event".light_blue.bold
                menu.choice "Concert".green.bold
                menu.choice "Return to Main Menu"
            end

            if user_input2 == "Sporting Event".light_blue.bold
                sporting_events = Event.all.select { |event| event.category == "Sporting Event"}
                sporting_event_names = sporting_events.map do |sporting_event|
                    "Event: #{sporting_event.event_name}, City: #{sporting_event.city}, Date: #{sporting_event.date}"                
                end
                user_input4 = prompt.select("Please Choose an Event", sporting_event_names, "Exit".red.bold)

                case user_input4
                when sporting_event_names
                    user_chomp = gets.chomp
                    self.buy_tickets
            
                when "Exit".red.bold
                    self.events_menu
                end
                

            elsif user_input2 == "Concert".green.bold
                concerts = Event.all.select { |event| event.category == "Concert"}
                concert_names = concerts.map do |concert|
                    "Event: #{concert.event_name},  City: #{concert.city}, Date: #{concert.date}"                
                end
                user_input3 = prompt.select("Please Choose an Event", concert_names, "Exit".red.bold)

                case user_input3
                when concert_names
                    puts "this button works"
                when "Exit".red.bold
                    self.events_menu
                end
            end
        end

        # when "City".magenta.bold
        # when "Zipcode".cyan.bold
        # when "Return to Main Menu"
    end

    def self.user_tickets(current_user)
        prompt = TTY::Prompt.new
        user_tickets = Ticket.all.select { |ticket| ticket.user_id == current_user.id }
        if user_tickets == []
            system "clear"
                user_input1 = prompt.select ("It looks like you do not have any tickets yet") do |menu|
                    menu.choice "Return to Main Menu".green.bold
                end
                case user_input1
                when "Return to Main Menu".green.bold
                    self.main_menu(current_user)
                end        
        elsif
            ticket_event_details = user_tickets.map do |ticket|
                "Event: #{ticket.event_id}, Location: #{ticket.event_id}, Quantity: #{ticket.quantity}"
            end
        end
        user_input2 = prompt.select("Please Choose an Event", ticket_event_details, "Exit".red.bold)

        case user_input2
        when ticket_event_details.find do |details|
            details == user_input2
            puts "this button works"
            end
        when "Exit".red.bold
            self.main_menu(current_user) 
        end
    end


    def self.buy_tickets
        puts "methods reached here"
    end


end







   # Done # if "Find Events" is selected, show menu of 
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