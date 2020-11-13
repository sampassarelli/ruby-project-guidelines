require "tty-prompt"
require "tty-font"
require "colorize"


class CLI
       
    def sign_in
        @current_user = User.setup_user
        main_menu
    end

#--------------Main Menu--------------
    def main_menu
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select ("Welcome to the Main Menu. Please Choose an Option!") do |menu|
            menu.choice "Find Tickets".light_blue.bold
            menu.choice "Your Tickets".light_blue.bold
            menu.choice "Sign Out".light_red.bold
        end
    
        case user_input
        when "Find Tickets".light_blue.bold
            system "clear"
            events_menu
        when "Your Tickets".light_blue.bold
            # puts "Your Ticket Works"
            user_tickets
        when "Sign Out".light_red.bold
            system "clear"
            puts "Thank you for Using StubMaster. We hope you enjoyed our CLI application!".yellow.bold
            sleep 3.5
            system "clear"
            exit!
        end
    end

#---------------Events Types Menu---------------
    def events_menu
        prompt = TTY::Prompt.new
        user_input = prompt.select ("SEARCH BY:") do |menu|
            menu.choice "Event Category".green.bold
            menu.choice "City".green.bold
            menu.choice "Date".green.bold
            menu.choice "Covid Friendly: Outdoor Events Only!".cyan.bold
            menu.choice "Return to Main Menu".red.bold
        end

        case user_input
        when "Event Category".green.bold
            system "clear"
            user_input2 = prompt.select ("Please Select an Event Type") do |menu|
                menu.choice "Sporting Event".light_blue.bold
                menu.choice "Music".light_blue.bold
                menu.choice "Performing Arts/Entertainment".light_blue.bold
                menu.choice "Return to Main Menu".red.bold
            end

            if user_input2 == "Sporting Event".light_blue.bold
                system "clear"
                sporting_event_menu               
            elsif user_input2 == "Music".light_blue.bold
                system "clear"
                music_menu 
            elsif user_input2 == "Performing Arts/Entertainment".light_blue.bold
                system "clear"
                theater_menu                   
            elsif user_input2 == "Return to Main Menu".red.bold
                system "clear"
                main_menu
            end

        when "City".green.bold
            system "clear"
            cities = Event.all.map { |event| event.city }.uniq
            user_input3 = prompt.select("Please Choose a City", cities, "Return".red.bold)
                if user_input3 == "Return".red.bold
                    system "clear"
                    events_menu
                else cities
                    city_menu(user_input3)
                end 
            
        when "Date".green.bold
            system "clear"
            dates = Event.all.map { |event| event.date }.uniq
            user_input4 = prompt.select("Please Choose a Date", dates, "Return".red.bold)
                if user_input4 == "Return".red.bold
                    system "clear"
                    events_menu
                else dates
                    date_menu(user_input4)
                end 

        when "Covid Friendly: Outdoor Events Only!".cyan.bold
            system "clear"
            prompt = TTY::Prompt.new
            covid_events = Event.all.select { |event| event.location == "Outdoor"}
            covid_event_details = covid_events.each_with_object({}) do |event,hash| 
                hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
            end
            covid_event_details["Return".red.bold] = "Return"
            user_input4 = prompt.select("Please Choose an Event", covid_event_details)
                if user_input4 == "Return"
                    system "clear"
                    events_menu
                else covid_event_details
                    buy_tickets(user_input4)
                end   

        when "Return to Main Menu".red.bold
            main_menu
        end
    end

    #-------------------Event Category Menus-------------------
    def sporting_event_menu
        prompt = TTY::Prompt.new
        sporting_events = Event.all.select { |event| event.category == "Sporting Event"}
            sporting_event_details = sporting_events.each_with_object({}) do |event,hash| 
                hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
            end
            sporting_event_details["Return".red.bold] = "Return"
            user_input = prompt.select("Please Choose an Event", sporting_event_details)
                if user_input == "Return"
                    system "clear"
                    events_menu
                else sporting_event_details
                    buy_tickets(user_input)
                end    
    end
    
    def music_menu
        prompt = TTY::Prompt.new
        concerts = Event.all.select { |event| event.category == "Music"}
        concert_details = concerts.each_with_object({}) do |event,hash| 
            hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
        end
        concert_details["Return".red.bold] = "Return"
        user_input = prompt.select("Please Choose an Event", concert_details)
            if user_input == "Return"
                system "clear"
                events_menu
            else concert_details
                   buy_tickets(user_input)
            end

    end

    def theater_menu
        prompt = TTY::Prompt.new
        theater_events = Event.all.select { |event| event.category == "Theater"}
            theater_events_details = theater_events.each_with_object({}) do |event,hash| 
                hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
            end
            theater_events_details["Return".red.bold] = "Return"
            user_input = prompt.select("Please Choose an Event", theater_events_details)
                if user_input == "Return"
                    system "clear"
                    events_menu
                else theater_events_details
                    buy_tickets(user_input)
                end
    end


#---------------City Menu---------------------
    def city_menu(city)
        system "clear"
        prompt = TTY::Prompt.new
        city_events = Event.all.select { |event| event.city == city}.sort
        city_event_details = city_events.each_with_object({}) do |event,hash| 
            hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
        end
        city_event_details["Return".red.bold] = "Return"
        user_input = prompt.select("Please Choose an Event", city_event_details)
            if user_input == "Return"
                system "clear"
                events_menu
            else city_event_details
                buy_tickets(user_input)
            end
    end    


#------------------Date Menu--------------------
    def date_menu(date)
        system "clear"
        prompt = TTY::Prompt.new
        event_dates = Event.all.select { |event| event.date == date}.sort
        event_date_details = event_dates.each_with_object({}) do |event,hash| 
            hash["Event: #{event.event_name} | City: #{event.city} | Date: #{event.date}"] = event 
        end
        event_date_details["Return".red.bold] = "Return"
        user_input = prompt.select("Please Choose an Event", event_date_details)
            if user_input == "Return"
                system "clear"
                events_menu
            else event_date_details
                buy_tickets(user_input)
            end
    end 



#------------------User Tickets--------------------
    def user_tickets
        system "clear"
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
            user_ticket_details = user_tickets.each_with_object({}) do |ticket,hash| 
                hash["Event: #{ticket.event.event_name} | Location: #{ticket.event.city} | Date: #{ticket.event.date} | Quantity: #{ticket.quantity}"] = ticket 
            end
            user_ticket_details["Return".red.bold] = "Return"
            user_input2 = prompt.select("Please Choose an Event", user_ticket_details)
                if user_input2 == "Return"
                    system "clear"
                    main_menu
                else user_ticket_details
                    system "clear"
                    cancel_ticket(user_input2)
                end
        end
    end
#-------------Delete/Update Ticket Method--------------------
    def cancel_ticket(ticket)
        prompt = TTY::Prompt.new
        puts "What Would You Like To Do With Your Tickets?".yellow.bold
        sleep 1
        user_input = prompt.select ("Please Choose an Option:") do |menu|
            menu.choice "Cancel Tickets".light_blue.bold
            menu.choice "Return to Main Menu".red.bold
            
        end
            if user_input == "Cancel Tickets".light_blue.bold
                system "clear"
                Ticket.delete(ticket.id)
                sleep 1
                puts "Tickets for #{ticket.event.event_name} have been CANCELLED.".yellow.bold
                sleep 3
                main_menu
            else
                main_menu
            end
    end


#--------------Buy Ticket Method---------------
    def buy_tickets(event)
        puts "Please select a quantity".yellow.bold
        quantity_input = gets.chomp
        Ticket.create(user_id: @current_user.id, event_id: event.id, quantity: quantity_input)
        sleep 1
        puts "You Have Successfully Purchased #{quantity_input} tickets to #{event.event_name}!".yellow.bold
        sleep 3
        puts "Tickets Will Be Available in 'Your Tickets'. Enjoy the Event!".light_blue.bold
        sleep 3
        main_menu
#-----NOTE: Need to add function that only integers greater than 1 can be accepted.
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