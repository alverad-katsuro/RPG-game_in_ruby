class A
    def initialize
        puts "A"
    end
    class B
        def initialize
            puts "B"
        end
    end
end


a = A::B