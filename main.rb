require 'ruby2d'
require_relative './lib/characters/warrior.rb'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/road.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_player.rb'
require_relative './lib/logic/modulos/characters/stats_warrior.rb'
require_relative './lib/logic/modulos/mod_moviment.rb'
require_relative './lib/logic/modulos/mod_controls.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)


scenery = Logic::Scenery.new sun: Graphics::Sun.new, road: Graphics::Road.new, rocks: Graphics::Rocks.new, mountain_close: Graphics::Mountain_close.new, sky: Graphics::Sky.new
##### Construindo Players #####
### Player One ###
hero_one = Graphics::Hero.new
hero_one
player_one = Logic::Player.new animation_characters: hero_one, stats_basic: Logic::Hero.new
player_one.add_modulos modulos: [Logic::Controls::Controls_One_Keyboard, Logic::Characters::Hero]

### Player Two ###
hero_two = Graphics::Hero.new
hero_two.x = Window.width - 200
hero_two.color = [1, 0.5, 0.2, 1]
player_two = Logic::Player.new animation_characters: hero_two, stats_basic: Logic::Hero.new
player_two.add_modulos modulos: [Logic::Controls::Controls_Two_Keyboard, Logic::Characters::Hero]

#### Constructor Player END ####
keyboard_inputs_1 = []
keyboard_inputs_2 = []
mouse_inputs = []

##### jogadores #####
def entradas_player_one(player_one, keyboard_inputs_1)
  if player_one.action_now == :none || player_one.action_now == :moving
    player_one.control_moviment(keyboard_inputs_1)
  end
end

def entradas_player_two(player_two, keyboard_inputs_2)
  if player_two.action_now == :none || player_two.action_now == :moving
		player_two.control_moviment(keyboard_inputs_2)
	end
end

on :key_held do |event|
  if ('asdw'.include? event.key) && (keyboard_inputs_1.size) < 4
    keyboard_inputs_1 << event.key
  elsif (['left', 'right', 'up', 'down'].include? event.key) && (keyboard_inputs_2.size) < 4
    keyboard_inputs_2 << event.key
  end
  entradas_player_one(player_one, keyboard_inputs_1)
  entradas_player_two(player_two, keyboard_inputs_2)
end

on :key_down do |event|
  if 'g' == event.key && (keyboard_inputs_1.size) < 4
    keyboard_inputs_1 << event.key
  elsif 'keypad 0' == event.key && (keyboard_inputs_2.size) < 4
    keyboard_inputs_2 << event.key
  end
end

on :key_up do |event|
	player_one.control_hero_stop event.key
	player_two.control_hero_stop event.key
end

on :mouse_down do |event|
  case event.button
  when :left
	  #player_one.hero_attack
  when :rigth
    #player_one.play animation: :stop_rigth, loop: true
  when :x1
    #player_one.play animation: :stop_top, loop: true
  when :x2
    #player_one.play animation: :stop_bottom, loop: true
  end
end

update do
  player_one.atack ##verifica se pode andar
  player_two.atack ##verifica se pode andar
end

show