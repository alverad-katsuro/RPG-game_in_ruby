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

def create_history
    intro = "Era uma vez.....
Duas Nações que estavam em uma guerra sangrenta e para evitar o exterminio de todos
seus cidadões, recrutados a força para guerra, decidiram enviar gladiadores para
decidir o futuro de seus respectivos Estados. Foi decido que haveria 3 combates,
quem ganhasse dois destes combates poderia fazer o que quiser com o outro estado,
seja escravizar seja colonizar.

Agora é sua oportunidade de defender sua Patria!!!!!!."
    first_round = "First Round"
    second_round = "Second Round"
    three_round = "Final Round"
    placar_0_0 = "0 x 0"
    placar_1_0 = "1 x 0"
    placar_0_1 = "0 x 1"
    placar_1_1 = "1 x 1"
    text_1_win = "O Estado localizado ao Oeste Ganhou!!!!!!"
    text_2_win = "O Estado localizado ao Leste Ganhou!!!!!!"
    historia = Logic::Text_Organize.new
    historia.add key: :intro, texto: intro, font_size: 30, color: 'blue'
    historia.movimentar_text key: :intro, x: Window.width / 6, y: Window.height / 3
    historia.add key: :first_round, texto: first_round, font_size: 60, color: 'green'
    historia.movimentar_text key: :first_round, x: Window.width / 2.55, y: Window.height / 2
    historia.add key: :second_round, texto: second_round, font_size: 60, color: 'yellow'
    historia.movimentar_text key: :second_round, x: Window.width / 2.7, y: Window.height / 2
    historia.add key: :three_round, texto: three_round, font_size: 60, color: 'purple'
    historia.movimentar_text key: :three_round, x: Window.width / 2.6, y: Window.height / 2
    historia.add key: :text_1_win, texto: text_1_win, font_size: 60, color: 'orange'
    historia.movimentar_text key: :text_1_win, x: Window.width / 8, y: Window.height / 2
    historia.add key: :text_2_win, texto: text_2_win, font_size: 60, color: 'orange'
    historia.movimentar_text key: :text_2_win, x: Window.width / 8, y: Window.height / 2
    historia.add key: :placar_0_0, texto: placar_0_0, font_size: 60, color: 'silver'
    historia.movimentar_text key: :placar_0_0, x: Window.width / 2.2, y: Window.height / 1.7
    historia.add key: :placar_1_0, texto: placar_1_0, font_size: 60, color: 'silver'
    historia.movimentar_text key: :placar_1_0, x: Window.width / 2.2, y: Window.height / 1.7
    historia.add key: :placar_0_1, texto: placar_0_1, font_size: 60, color: 'silver'
    historia.movimentar_text key: :placar_0_1, x: Window.width / 2.2, y: Window.height / 1.7
    historia.add key: :placar_1_1, texto: placar_1_1, font_size: 60, color: 'silver'
    historia.movimentar_text key: :placar_1_1, x: Window.width / 2.2, y: Window.height / 1.7
    return historia
end