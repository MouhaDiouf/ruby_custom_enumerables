module Enumerable
    def my_each
        if block_given?
            for i in 0...self.length 
                yield(self[i])
            end 
        else 
            puts "You must provide a block"
        end
    end 

    def my_each_with_index
        if block_given?
            for i in 0...self.length 
                yield(self[i], i)
            end 
        else 
            puts "You must provide a block"
        end
    end 

    def my_select 
        result = []
        if block_given?
            for i in 0...self.length 
                if yield(self[i]) == true
                    result << self[i]
                end 
            end
            result 
        else 
            puts "You must provide a block"
        end
    end 

    def my_all?
        if block_given?
            for i in 0...self.length 
                if yield(self[i]) == false
                    return false 
                end 
            end
            true 
        else 
            puts "You must provide a block"
        end
    end 

    def my_any?
        if block_given?
            for i in 0...self.length 
                if yield(self[i]) == true
                    return true 
                end 
            end
            false 
        else 
            puts "You must provide a block"
        end
    end 


    def my_none?
        if block_given?
            for i in 0...self.length 
                if yield(self[i]) == true
                    return false 
                end 
            end
            true 
        else 
            puts "You must provide a block"
        end
    end 

    def my_count(arg = nil)
        count = 0

        if arg 
            for i in 0...self.length 
                if arg == self[i]
                    count += 1
                end 
            end 
            count 
        elsif block_given?
            for i in 0...self.length 
                if yield(self[i]) == true
                    count += 1
                end 
            end
            count 
        else 
            self.length
        end
    end 

    def my_map 
        result = []
        if block_given?
            for i in 0...self.length    
                    result << yield(self[i])
            end
            result 
        else 
            puts "You must provide a block"
        end
    end 


    def my_inject(start)
        acc = self[start]
        if block_given?
            for i in start+1...self.length
                p "acc #{acc} value #{self[i]}"    
                acc = yield(acc, self[i])
                p "acc becomes #{acc}"
            end
            acc 
        else 
            puts "You must provide a block"
        end
    end 

end 

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each  { |item| puts item }


puts "my_each_with_index vs. each_with_index"
numbers = [1, 2, 3, 4, 5]
numbers.my_each_with_index  { |item, idx| puts "item, #{idx}" }
numbers.each_with_index { |item, idx| puts "item, #{idx}" }
puts "my all"
p numbers.my_all? {|item| item > 1}
puts "my any"
p numbers.my_any? {|item| item > 1}
puts "my none"
p numbers.my_none? {|item| item > 0}
puts "my count"
ary = [1, 2, 4, 2]
p ary.my_count                  #=> 4
p ary.my_count(2)               #=> 2
p ary.my_count { |x| x%2 == 0 } #=> 3

p "custom map"

array = ["a", "b", "c"]
p array.my_map { |string| string.upcase }

p (5..10).to_a.my_inject(2) { |product, n| product + n }
#p [5, 6, 7, 8, 9, 10].to_a.my_inject { |sum, n| sum + n }            #=> 45

