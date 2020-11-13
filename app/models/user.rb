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
        puts "Welcome to Raks of Tickets! Please create username:"
        user_name_input = gets.chomp
    
        if User.find_by("username == ?", user_name_input)
            sleep 1
          puts "Username already taken, please select a different username."
          sleep 3
          create_new_user
        else
          current_user = User.create(username: user_name_input)
          system "clear"
          puts "New user created! Welcome, #{current_user.username}!"
          sleep 3

        end
        current_user
    end

#--------------Find Existing User -----------------
    def self.find_existing_user
        puts "Please enter username:"
        user_name_input = gets.chomp
        current_user = User.find_by("username == ?", user_name_input)
        if User.all.map { |user| user.username }.include?(user_name_input)
            sleep 1
            system "clear"
            puts "Welcome back, #{current_user.username}!"
            sleep 2
        else
          sleep 1
          puts "Username not found"
          find_existing_user
        end
        current_user
    end

end