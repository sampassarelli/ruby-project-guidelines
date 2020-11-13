require 'colorize'

class User < ActiveRecord::Base 
    has_many :tickets
    has_many :events, through: :tickets

#-------------Signin Main Menu--------------
    def self.setup_user
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select("Do You Have An Account With Us?") do |menu|
            menu.choice "Sign In".green
            menu.choice "Create Account".light_blue
            menu.choice "Exit".red
        end
    
        if user_input == "Create Account".light_blue
            system "clear"
            self.create_new_user
        elsif user_input == "Sign In".green
            system "clear"
            self.find_existing_user
        else user_input == "Exit".red
            system "clear"
            puts "Thank you for visiting Raks of Tickets. We hope to see you soon!".yellow
            sleep 3
            system "clear"
            exit!
                
        end
    end

#--------------Create New User--------------
    def self.create_new_user
        system "clear"
        prompt = TTY::Prompt.new
        puts "Welcome to Raks of Tickets! Please create username:"
        username_input = prompt.ask("Create a Username:")
        
        if User.find_by("username == ?", username_input)
          sleep 1
          puts "Username already taken, please select a different username.".yellow.bold
          sleep 3
          self.create_new_user
        else
          password_input = prompt.mask("Create a Password:")
          current_user = User.create(username: username_input, password: password_input)
          system "clear"
          puts "New user created! Welcome, #{current_user.username}!".light_blue.bold
          sleep 3
          return current_user
        end
    end

#--------------Find Existing User -----------------
    def self.find_existing_user
        prompt = TTY::Prompt.new
        username_input = prompt.ask("Please Enter Your Username:")
        password_input = prompt.mask("Please Enter Your Password:")
        if User.find_by(username: username_input, password: password_input)
            current_user = User.find_by(username: username_input, password: password_input)
            system "clear"
            puts "Welcome back, #{current_user.username}!".light_blue.bold
            sleep 2
            return current_user
        else
            system("clear")
            choice = prompt.select('Incorrect username and/or password!') do |menu|
                menu.choice "Retry Log In".green.bold
                menu.choice "Create Username and Password".light_blue.bold
                menu.choice "Exit".red.bold
            end
            if choice == "Retry Log In".green.bold
                system("clear")
                self.find_existing_user
            elsif choice == "Create Username and Password".light_blue.bold
                system("clear")
                self.create_new_user
            elsif choice == "Exit".red.bold
                system("clear")
                exit!
            end
        end
            
        # puts "Please enter username:"
        # user_name_input = gets.chomp
        # current_user = User.find_by("username == ?", user_name_input)
        # if User.all.map { |user| user.username }.include?(user_name_input)
        #     sleep 1
            # system "clear"
            # puts "Welcome back, #{current_user.username}!".light_blue.bold
            # sleep 2
            # return current_user
        # else
        #   system "clear"
        #   puts "Username not found".yellow.bold
        #   self.find_existing_user
        # end
    end

end