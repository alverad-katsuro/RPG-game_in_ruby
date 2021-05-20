module Test
    module Saida
        def saida
            p 'sai'
        end
    end
    
    private: Privado
    module Privado
        def priva_sai
            p 'sai da privada'
        end
    end
end

Test::Privado.priva_sai
