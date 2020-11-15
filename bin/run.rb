require_relative '../config/environment'
require "pry"
require "tty-prompt"

system "clear"
def logo 
    a = Artii::Base.new 
        puts a.asciify('StubMaster!').red.bold
        spinner = TTY::Spinner.new(":spinner :spinner :spinner :spinner :spinner :spinner :spinner :spinner :spinner :spinner ", format: :arrow_pulse)
            spinner.auto_spin
            sleep(3)
            spinner.stop
end

logo

CLI.new.sign_in  