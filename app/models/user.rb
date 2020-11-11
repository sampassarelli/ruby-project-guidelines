class User < ActiveRecord::Base 
    has_many :tickets
    has_many :events, through: :tickets

    def self.setup_user
        system "clear"
        prompt = TTY::Prompt.new
        user_input = prompt.select("Do You Have An Account With Us?",
          %w(No Yes))
    
        if user_input == "No"
          self.create_new_user
        else
          self.find_existing_user
        end
    end

    def self.create_new_user
        puts "Welcome to Raks of Tickets! Please create username:"
        user_name_input = gets.chomp
    
        if User.find_by("username == ?", user_name_input)
          puts "Username already taken, please select a different username."
          create_new_user
        else
          current_user = User.create(username: user_name_input)
          puts "New user created! Welcome, #{current_user.username}!"
        end
        current_user
    end

    def self.find_existing_user
        puts "Please enter username:"
        user_name_input = gets.chomp
        current_user = User.find_by("username == ?", user_name_input)
        if User.all.map { |user| user.username }.include?(user_name_input)
          puts "Welcome back, #{current_user.username}!"
        else
          puts "Username not found"
          find_existing_user
        end
        current_user
      end

end