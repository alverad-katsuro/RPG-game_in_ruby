require 'ruby2d'
require_relative './lib/characters/warrior.rb'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/road.rb'
require_relative './lib/background/pause.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_player.rb'
require_relative './lib/logic/modulos/characters/stats_warrior.rb'
require_relative './lib/logic/modulos/mod_moviment.rb'
require_relative './lib/logic/modulos/mod_controls.rb'
require_relative './lib/logic/modulos/mod_heath.rb'
require_relative './lib/logic.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)

##### Cenario
scenery = Logic::Scenery.new sun: Graphics::Sun.new, road: Graphics::Road.new, rocks: Graphics::Rocks.new, mountain_close: Graphics::Mountain_close.new, sky: Graphics::Sky.new
####

##### Telado pause
pause = Graphics::Pause.new
pause.remove

##### Construindo Players #####
### Player One ###
hero_one = Graphics::Hero.new
player_one = Logic::Player.new animation_characters: hero_one,
  stats_basic: Logic::Hero.new, key_map: Logic::Controls::Auxiliar::Keyboard_Map_One
player_one.add_modulos modulos: [
  Logic::Controls::Controls_One_Keyboard,
  Logic::Characters::Hero, Logic::Heath
  ]

### Player Two ###
hero_two = Graphics::Hero.new
hero_two.x = Window.width - 200
hero_two.color = [1, 0.5, 0.2, 1]
player_two = Logic::Player.new animation_characters: hero_two,
 stats_basic: Logic::Hero.new, key_map: Logic::Controls::Auxiliar::Keyboard_Map_Two
player_two.add_modulos modulos: [
  Logic::Controls::Controls_Two_Keyboard,
  Logic::Characters::Hero, Logic::Heath
  ]
##### PLAYER CONSTRUC END #####

### Adicionando os jogadores a logica do Game
logic = Logic.new player_one: player_one, player_two: player_two


#### Movimentos capturados ####
keyboard_inputs_1 = []
keyboard_inputs_2 = []

##### captura keyboard
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


update do
  logic.attack? ##verifica se os jogadores podem atacar
  logic.alives? ##verifica se os nbs morreram
end 

show