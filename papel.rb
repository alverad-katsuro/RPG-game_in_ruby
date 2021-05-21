class Test
    attr_reader :x
    def initialize x 
        @x = x
    end
end

class B
    def saida
        p 'sai'
    end
end

test = Test.new B.new

def chama_saida test_class
    test_class.x.saida
    #test_class.map(&:x.saida)
end

chama_saida test
    