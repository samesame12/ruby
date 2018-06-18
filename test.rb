require('rubygems')
require('colorize')
def main
    r = rand(1..50).to_i
    num_rand(r)
end

def hint(x)
    m = rand(3..7)
    a = x+m
    b = x-m 
    if b < 0
        b = 0
    end
    if a > 50
        a = 50
    end
    puts "hint : range between #{b} and #{a}"
end


def num_rand(r)
    store=[]
    count = 0
    loop do
        print "guess number(1-50) for fun!:"
        guess = gets.chomp
        guess.downcase!
        if guess == "secret"
            puts "secret: #{r}"
        elsif guess == "hint"
              puts hint(r)
        else
            guess = guess.to_i
            if guess <1 || guess >50
                puts "pleas input number between 1-50"
        next
            elsif store.include? (guess)
                puts "this number is duplicate".yellow
        next
            elsif guess > r
                puts "your num is hight more than secret".red
            elsif guess < r
                puts "your num is below more than secret".red
            else
                puts "you are winner, the secret is #{r}".blue
            break
            end
        store[count]=guess
        end
        count += 1
    break if count >5
    end  
    puts "you lose, the secret is #{r}".green             
end

main if __FILE__ == $0