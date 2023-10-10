module Funcollection

    #print alphabet in reverse order 
    def printalphabet
        ("a".."z").reverse_each { |letter| p letter }
    end
    
    #validate the input using regex
    def checkinfo(name, email, number ,gender, amount)

        resultstring = ""

        if /^[a-zA-Z ]+$/ === name
            resultstring+="#{name} : valid name\n"
        else
            resultstring+="#{name} : Invalid name\n"
        end
        
        if /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ === email
            resultstring+="#{email} : valid email\n"
        else
            resultstring+="#{email} : Invalid email\n"
        end

        if  /^[0-9]{10}$/ === number
            resultstring+="#{number} : valid number\n"
        else 
            resultstring+="#{number} : Invalid number\n"
        end
        
        if  /^[MF]$/i === gender
            resultstring+="#{gender} : valid gender\n"
        else 
            resultstring+="#{gender} : Invalid gender\n"
        end
        
        if /^\d+$/ === amount
            resultstring+="#{amount} : valid amount\n"
        else 
            resultstring+="#{amount} : Invalid amount\n"

        end
        resultstring
    end 
    
    #assign grade according to input 
    def checkgrade(input)
        begin 
        grade = Integer(input)
    
        if grade <= 0 
            return "Enter a valid grade."
        elsif (1..5) === grade
            return "Elementary"
        elsif (6..8) === grade
            return "Middle School"
        elsif (9..12) === grade
            return "High School"
        else
            return "College"
        end
        rescue ArgumentError
        return "Invalid input. Please enter a valid number."
        end
    end
  
  
    #check the class of ip address
    def ipclass(ip_address)
        first_octet = ip_address.split('.')[0].to_i
        
        if (1..126) === first_octet
        return "IP address class - Class A"
        elsif (128..191) === first_octet
        return "IP address class - Class B"
        elsif (192..223) === first_octet
        return "IP address class - Class C"
        elsif (224..239) === first_octet
        return "IP address class - Class D"
        elsif (240..255) === first_octet
        return "IP address class - Class E"
        else
        return "Invalid IP Address"
        end
    end
  
   
    #check number is prime or not 
    def isprime(input)
        begin
        number = Integer(input)
    
        if number <= 1
            return "0, 1, and negative numbers cannot be prime."
        else
            i = 2
            while i <= Math.sqrt(number) do 
            if number % i == 0 
                return "The #{number} is not a prime number."
            end
            i += 1
            end
            return "The #{number} is a prime number."
        end
        rescue ArgumentError
        return "Invalid input. Please enter a valid number."
        end
    end
end 


class Operations
    include Funcollection

    def start_here
        loop do
            puts <<~MESSAGE
                Welcome to collection of functions\n
                (Keys ---> operation)\n
                1 ---> print alphabets in reverse order
                2 ---> check the grade of students
                3 ---> check the ip class
                4 ---> check the number is prime or not
                5 ---> validate the information (email, phone etc..)\n
                Enter the choice (1-5) or type 'exit' to quit
            MESSAGE

            choice = gets.chomp.downcase

            break if choice == 'exit'

            choice = choice.to_i

            until (1..5).include?(choice)
                puts "Error: Invalid choice. Please enter a number between 1 and 5.\n"
                choice = gets.chomp.to_i
            end

            puts "------------------function start-----------------------"

            case choice
                when 1
                    printalphabet
                when 2
                    puts "Enter the grade(1-12): "
                    input = gets.chomp
                    result = checkgrade(input)
                    puts "Result : #{result}"
                when 3
                    print "Enter an IP address: "
                    ip_address = gets.chomp
                    ipclass_result = ipclass(ip_address)
                    puts "Result : #{ipclass_result}"
                when 4
                    puts "Enter the number:"
                    input = gets.chomp
                    result = isprime(input)
                    puts "Result : #{result}"
                when 5 
                    puts "Enter the name : "
                    name = gets.chomp
                    puts "\nEnter the email : "
                    email = gets.chomp
                    puts "\nEnter the number : "
                    number = gets.chomp
                    puts "\nEnter the gender(M/F) : "
                    gender = gets.chomp.upcase
                    puts "\nEnter the amount : "
                    amount = gets.chomp 
                    result = checkinfo(name, email, number ,gender, amount)
                    puts "\n---------------Validation result-------------\n#{result}"
       
            end
            puts "-------------------------------------END-----------------------------\n"
        end
    end
end

operations = Operations.new
operations.start_here

