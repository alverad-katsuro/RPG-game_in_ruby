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
require_relative './lib/background/shadow.rb'
require_relative './lib/background/clouds_big.rb'
require_relative './lib/background/clouds_medium.rb'
require_relative './lib/background/cloud_small.rb'
require_relative './lib/background/life.rb'
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
    title: "Duelo",
    resizable: false,
    background: 'white',
    width: 1366,
    height: 728,
    fullscreen: false,
    diagnostics: true
)

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

##### MUSIC #####
music = Music.new("./assets/songs/music.mp3")
music.play
#### FIM ####

#### Tela do pause ####
#pause = Graphics::Pause.new
#pause.remove
#### FIM ####

###### Construindo Players ######

### Player One ###
hero_one = Graphics::Hero.new
player_one = Logic::Player.new
player_one.add key: :animation, value: hero_one
player_one.add key: :stats_basic, value: Logic::Hero.new
player_one.add key: :key_map, value: Logic::Controls::Auxiliar::Keyboard_Map_One
player_one.add key: :shadow, value: Graphics::Shadow.new
player_one.add key: :corazon, value: Graphics::Corazon.new
player_one.add key: :songs_atk, value:[Sound.new("./assets/songs/atk01.mp3"), Sound.new("./assets/songs/atk02.mp3")]
player_one.add key: :songs_defend, value:[Sound.new("./assets/songs/def01.mp3"), Sound.new("./assets/songs/def02.mp3"),
                                          Sound.new("./assets/songs/def03.mp3"), Sound.new("./assets/songs/def04.mp3")
                                          ]
player_one.add_modulos modulos: [
                                Logic::Controls::Controls_Keyboard,
                                Logic::Characters::Hero, Logic::Heath
                                ]
#### FIM ####

### Player Two ###
hero_two = Graphics::Hero.new
hero_two.x = Window.width - 200
hero_two.color = [1, 0.5, 0.2, 1]
player_two = Logic::Player.new
player_two.add key: :animation, value: hero_two
player_two.add key: :stats_basic, value: Logic::Hero.new
player_two.add key: :key_map, value: Logic::Controls::Auxiliar::Keyboard_Map_Two
player_two.add key: :shadow, value: Graphics::Shadow.new
player_two.add key: :corazon, value: Graphics::Corazon.new(x_posi: 0.8)
player_two.add key: :songs_atk, value:[Sound.new("./assets/songs/atk01.mp3"), Sound.new("./assets/songs/atk02.mp3")]
player_two.add key: :songs_defend, value:[Sound.new("./assets/songs/def01.mp3"), Sound.new("./assets/songs/def02.mp3"),
                                          Sound.new("./assets/songs/def03.mp3"), Sound.new("./assets/songs/def04.mp3")
                                        ]
player_two.add_modulos modulos: [
                                Logic::Controls::Controls_Keyboard,
                                Logic::Characters::Hero, Logic::Heath
                                ]
#### FIM ####

###### PLAYER CONSTRUC END ######

#### CRIANDO HISTORIA ####

historia = create_history
#### FIM ####

##### Adicionando os componentes ao Game ######
game = Logic.new
game.add player_one: player_one
game.add player_two: player_two
game.add scenery: scenery
game.add historia: historia
#### FIM ####

game.historia.mostra_intro? resp:true

#### Movimentos capturados ####
keyboard_inputs_1 = []
keyboard_inputs_2 = []
#### FIM ####

###### CAPTURA DE MOVIMENTOS ######

##### CAPTURA DO KEYBOARD #####

on :key_held do |event|
  if ('asdw2'.include? event.key) && (keyboard_inputs_1.size) < 4
    keyboard_inputs_1 << event.key
  elsif (['left', 'right', 'up', 'down'].include? event.key) && (keyboard_inputs_2.size) < 4
    keyboard_inputs_2 << event.key
  end
  game.action_player_one(k_b_1: keyboard_inputs_1)
  game.action_player_two(k_b_2: keyboard_inputs_2)
end

on :key_down do |event|
  if 'g' == event.key
    keyboard_inputs_1 << event.key
  elsif 'keypad 1' == event.key
    keyboard_inputs_2 << event.key
  elsif 'h' == event.key
    keyboard_inputs_1 << event.key
  elsif 'keypad 3' == event.key
    keyboard_inputs_2 << event.key
  end
end

on :key_up do |event|
	game.stop? event
end

##### FIM DO KEYBOARD #####

###### FIM DA CAPTURA ######

update do
  game.update! 
  scenery.update!
end 

show