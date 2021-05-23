require 'ruby2d'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/moon.rb'
require_relative './lib/background/road.rb'
require_relative './lib/background/pause.rb'
require_relative './lib/background/tela.rb'
require_relative './lib/background/shadow.rb'
require_relative './lib/background/clouds_big.rb'
require_relative './lib/background/clouds_medium.rb'
require_relative './lib/background/cloud_small.rb'
require_relative './lib/characters/warrior.rb'
require_relative './lib/logic.rb'
require_relative './lib/logic/logic_scenery.rb'
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

#### CRIANDO CENARIO ####
scenery = Logic::Scenery.new 
scenery.add(:sun, Graphics::Sun.new)
scenery.add(:moon, Graphics::Moon.new)
scenery.add(:road, Graphics::Road.new)
scenery.add(:rocks, Graphics::Rocks.new)
scenery.add(:mountain_close, Graphics::Mountain_close.new)
scenery.add(:sky, Graphics::Sky.new)
scenery.add(:clouds_big, Graphics::CloudBig.new)
scenery.add(:clouds_med, Graphics::CloudMed.new)
scenery.add(:cloud_small, Graphics::CloudSmall.new)
scenery.add(:tela, Graphics::Tela.new)
#### FIM ####
scenery.manha!

#### Tela do pause ####
pause = Graphics::Pause.new
pause.remove
#### FIM ####

###### Construindo Players ######

### Player One ###
hero_one = Graphics::Hero.new
player_one = Logic::Player.new
player_one.add animation_characters: hero_one
player_one.add stats_basic: Logic::Hero.new
player_one.add key_map: Logic::Controls::Auxiliar::Keyboard_Map_One
player_one.add shadow: Graphics::Shadow.new
player_one.add_modulos modulos: [
  Logic::Controls::Controls_One_Keyboard,
  Logic::Characters::Hero, Logic::Heath
  ]
#### FIM ####

### Player Two ###
hero_two = Graphics::Hero.new
hero_two.x = Window.width - 200
hero_two.color = [1, 0.5, 0.2, 1]
player_two = Logic::Player.new
player_two.add animation_characters: hero_two
player_two.add stats_basic: Logic::Hero.new
player_two.add key_map: Logic::Controls::Auxiliar::Keyboard_Map_Two
player_two.add shadow: Graphics::Shadow.new
player_two.add_modulos modulos: [
  Logic::Controls::Controls_Two_Keyboard,
  Logic::Characters::Hero, Logic::Heath
  ]
#### FIM ####

###### PLAYER CONSTRUC END ######

### Adicionando os jogadores a logica do Game
logic = Logic.new player_one: player_one, player_two: player_two


#### Movimentos capturados ####
keyboard_inputs_1 = []
keyboard_inputs_2 = []
#### FIM ####

###### CAPTURA DE MOVIMENTOS ######

##### CAPTURA DO KEYBOARD #####

on :key_held do |event|
  if ('asdw'.include? event.key) && (keyboard_inputs_1.size) < 4
    keyboard_inputs_1 << event.key
  elsif (['left', 'right', 'up', 'down'].include? event.key) && (keyboard_inputs_2.size) < 4
    keyboard_inputs_2 << event.key
  end
  logic.action_player_one(k_b_1: keyboard_inputs_1)
  logic.action_player_two(k_b_2: keyboard_inputs_2)
end

on :key_down do |event|
  if event.key == 'return'
    pause.add
    #loop do
    #  x = gets
    #end
  end
  if 'g' == event.key
    keyboard_inputs_1 << event.key
  elsif 'keypad 0' == event.key
    keyboard_inputs_2 << event.key
  end
end

on :key_up do |event|
	logic.stop? event
end

##### FIM DO KEYBOARD #####

###### FIM DA CAPTURA ######

update do
  logic.update! 
  scenery.update!
end 

show