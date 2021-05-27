require 'ruby2d'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sky_night.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/moon.rb'
require_relative './lib/background/road.rb'
require_relative './lib/background/pause.rb'
require_relative './lib/background/tela.rb'
require_relative './lib/background/clouds_big.rb'
require_relative './lib/background/clouds_medium.rb'
require_relative './lib/background/cloud_small.rb'
require_relative './lib/characters/warrior.rb'
require_relative './lib/logic.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_text.rb'
require_relative './lib/logic/logic_player.rb'
require_relative './lib/logic/modulos/characters/stats_warrior.rb'
require_relative './lib/logic/modulos/mod_moviment.rb'
require_relative './lib/logic/modulos/mod_controls.rb'
require_relative './lib/logic/modulos/mod_heath.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)

#### CRIANDO HISTORIA ####
intro = "Era uma vez.....
Dois Estados que estavam em uma guerra sangrenta.
E para evitar o exterminio de todos seus cidadões, decidiram enviar gladiadores
para decidir o futuro de seus respectivos paises.
Foi decido que haveria 3 combates, quem ganhasse dois destes combates poderia
fazer o que quiser com o outro estado, seja escravizar seja colonizar.

Agora é sua oportunidade de defender sua Patria!!!!!!."
first_round = "Fist Round"
second_round = "Second Round"
three_round = "Three Round"
final_round = "Final Round"
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
historia.add key: :final_round, texto: final_round, font_size: 60, color: 'red'
historia.movimentar_text key: :final_round, x: Window.width / 2.55, y: Window.height / 2
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
#### FIM ####


#### CRIANDO CENARIO ####
scenery = Logic::Scenery.new 
scenery.add(:sun, Graphics::Sun.new)
scenery.add(:moon, Graphics::Moon.new)
scenery.add(:road, Graphics::Road.new)
scenery.add(:rocks, Graphics::Rocks.new)
scenery.add(:mountain_close, Graphics::Mountain_close.new)
scenery.add(:sky, Graphics::Sky.new)
scenery.add(:sky_night, Graphics::Sky_Night.new)
scenery.add(:clouds_big, Graphics::CloudBig.new)
scenery.add(:clouds_med, Graphics::CloudMed.new)
scenery.add(:cloud_small, Graphics::CloudSmall.new)
scenery.add(:tela, Graphics::Tela.new)
#### FIM ####

on :key_held do |event|
    p event.key
end

update do
    scenery.update!
end
show