require_relative '../background/text.rb'

class Logic
    class Text_Organize
        attr_accessor :textos
        def initialize
            @textos = {}
        end

        def add(key:, texto:, font_size:, color: nil)
            @textos[key] = []
            (texto.split("\n")).each do |frase|
                @textos[key] << (Graphics::Dialogo.new text: frase, font_size: font_size, color: color)
            end
            tabulacao_do_text frases: @textos[key]
        end
        
        def movimentar_text(key:, x: 0, y: 0)
            @textos[key].each do |frase|
                frase.x += x
                frase.y += y
            end
        end

        def mostra_intro? (resp:)
            case resp
            when :yes
                mostra!(key: :intro)
            when :no
                esconde!(key: :intro)
            end
        end

        def mostra_round(placar:)
            case round
            when :first
                mostra!(key: :first_round)
            when :second
                mostra!(key: :second_round)
            when :three
                mostra!(key: :three_round)
            when :final
                mostra!(key: :final_round)
            end
        end

        def some_round(round:)
            case round
            when :first
                esconde!(key: :first_round)
            when :second
                esconde!(key: :second_round)
            when :three
                esconde!(key: :three_round)
            when :final
                esconde!(key: :final_round)
            end
        end

        def mostra_placar(placar:)
            case placar
            when :zero_zero
                mostra!(key: :placar_0_0)
            when :one_zero
                mostra!(key: :placar_1_0)
            when :zero_one
                mostra!(key: :placar_0_1)
            when :one_one
                mostra!(key: :placar_1_1)
            end
        end

        def some_placar(placar:)
            case placar
            when :zero_zero
                esconde!(key: :placar_0_0)
            when :one_zero
                esconde!(key: :placar_1_0)
            when :zero_one
                esconde!(key: :placar_0_1)
            when :one_one
                esconde!(key: :placar_1_1)
            end
        end

        private

        def esconde!(key:)
            linha = 0
            @textos[key].each do |frase|
                frase.remove
            end
        end

        def mostra!(key:)
            linha = 0
            @textos[key].each do |frase|
                frase.add
            end
        end

        def tabulacao_do_text frases:
            linha = 0
            frases.each do |frase|
                frase.y += frase.height * linha
                linha +=1
                frase.remove
            end
        end
    end
end