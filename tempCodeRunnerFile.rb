class Test
    def saida1
        p 'saida1'
    end
    def saida2
        p 'saida2'
    end
    def saida3
        p 'saida3'
    end
    private
    def saida4
        p 'saida4'
    end
    public
    def saida5
        saida4()
    end
end

a = Test.new
a.saida5

