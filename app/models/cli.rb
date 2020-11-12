require "tty-prompt"
require "tty-font"
require "colorize"


class CLI
       
    def sign_in
        @current_user = User.setup_user
        main_menu
    end




    def main_menu
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select ("Welcome to the Main Menu. Please Choose an Option!") do |menu|
            menu.choice "Find Tickets".light_blue.bold
            menu.choice "Your Tickets".white.bold
            menu.choice "Sign Out".light_red.bold
        end
    

        case user_input
        when "Find Tickets".light_blue.bold
            system "clear"
            events_menu
        when "Your Tickets".white.bold
            # puts "Your Ticket Works"
            user_tickets
        when "Sign Out".light_red.bold
            system "clear"
            puts "Thank you for Using Raks of Tickets. We hope you enjoyed our CLI application!".yellow.bold
            sleep 3.5
            system "clear"
            exit!
        end
    end

    def events_menu
        prompt = TTY::Prompt.new
        user_input = prompt.select ("SEARCH BY:") do |menu|
            menu.choice "Event Category".light_green.bold
            menu.choice "City".magenta.bold
            menu.choice "Zipcode".cyan.bold
            menu.choice "Return to Main Menu".red.bold
        end

        case user_input
        when "Event Category".light_green.bold
            system "clear"
            user_input2 = prompt.select ("Please Select an Event Type") do |menu|
                menu.choice "Sporting Event".light_blue.bold
                menu.choice "Music".green.bold
                menu.choice "Performing Arts/Entertainment".white.bold
                menu.choice "Return to Main Menu"
            end

            if user_input2 == "Sporting Event".light_blue.bold
                sporting_events = Event.all.select { |event| event.category == "Sporting Event"}
                
                sporting_event_details = sporting_events.each_with_object({}) do |event,hash| 
                    hash["Event: #{event.event_name} | City: #{event.city}"] = event 
                end
                sporting_event_details["Exit".red.bold] = "Exit"
                user_input4 = prompt.select("Please Choose an Event", sporting_event_details)
                    if user_input4 == "Exit"
                        events_menu
                    else sporting_event_details
                        buy_tickets(user_input4)
                    end
                

            elsif user_input2 == "Music".green.bold
                concerts = Event.all.select { |event| event.category == "Music"}
                concert_details = concerts.each_with_object({}) do |event,hash| 
                    hash["Event: #{event.event_name} | City: #{event.city}"] = event 
                end
                concert_details["Exit".red.bold] = "Exit"
                user_input5 = prompt.select("Please Choose an Event", concert_details)
                    if user_input5 == "Exit"
                        events_menu
                    else concert_details
                        buy_tickets(user_input5)
                    end
                
            elsif user_input2 == "Performing Arts/Entertainment".white.bold
                theater_events = Event.all.select { |event| event.category == "Theater"}
                theater_events_details = theater_events.each_with_object({}) do |event,hash| 
                    hash["Event: #{event.event_name} | City: #{event.city}"] = event 
                end
                theater_events_details["Exit".red.bold] = "Exit"
                user_input6 = prompt.select("Please Choose an Event", theater_events_details)
                    if user_input6 == "Exit"
                        events_menu
                    else theater_events_details
                        buy_tickets(user_input6)
                    end

                   
            end
        

        # when "City".magenta.bold
        #     user_input5 = 
            
        # when "Zipcode".cyan.bold
        when "Return to Main Menu".red.bold
            main_menu
        end
    end

    def user_tickets
        prompt = TTY::Prompt.new
        user_tickets = Ticket.all.select { |ticket| ticket.user_id == @current_user.id }
        if user_tickets == []
            system "clear"
                user_input1 = prompt.select ("It looks like you do not have any tickets yet") do |menu|
                    menu.choice "Return to Main Menu".green.bold
                end
                case user_input1
                when "Return to Main Menu".green.bold
                    main_menu
                end        
        elsif
            ticket_event_details = user_tickets.map do |ticket|
                "Event: #{ticket.event.event_name}, Location: #{ticket.event.city}, Quantity: #{ticket.quantity}"
            end
        end
        user_input2 = prompt.select("Please Choose an Event", ticket_event_details, "Exit".red.bold)

        case user_input2
        when ticket_event_details.find do |details|
            details == user_input2
            puts "this button works"
            end
        when "Exit".red.bold
            main_menu
        end
    end


    def buy_tickets(event)
        puts "Please select a quantity".yellow.bold
        quantity_input = gets.chomp
        Ticket.create(user_id: @current_user.id, event_id: event.id, quantity: quantity_input)
        puts "You Have Successfully Purchased #{quantity_input.green.bold} tickets to #{event.event_name}!".yellow.bold
        sleep 3
        puts "Tickets Will Be Available in 'Your Tickets'.  Have a Great Time!".light_blue.bold
        sleep 3
        main_menu
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