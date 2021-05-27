require_relative '../background/text.rb'

class Logic
    class Text_Organize
        attr_accessor :textos
        attr_reader :clock_intro
        def initialize
            @textos = {}
            @clock_intro = nil
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
            when true
                mostra!(key: :intro)
                @clock_intro = Time.now
            when false
                esconde!(key: :intro)
            end
        end

        def mostra_winner (player:)
            case player
            when :one
                mostra! key: :text_1_win
            when :two
                mostra! key: :text_2_win
            end
        end
        
        def mostra_round(round:)
            case round
            when 1
                mostra!(key: :first_round)
                mostra!(key: :placar_0_0)
            when 2
                mostra!(key: :second_round)
            when 3
                mostra!(key: :three_round)
            end
        end

        def some_round
            esconde!(key: :first_round)
            esconde!(key: :second_round)
            esconde!(key: :three_round)
        end

        def mostra_placar(placar:)
            case placar
            when "10"
                mostra!(key: :placar_1_0)
            when "01"
                mostra!(key: :placar_0_1)
            when "11"
                mostra!(key: :placar_1_1)
            end
        end

        def some_placar
            esconde!(key: :placar_0_0)
            esconde!(key: :placar_1_0)
            esconde!(key: :placar_0_1)
            esconde!(key: :placar_1_1)
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