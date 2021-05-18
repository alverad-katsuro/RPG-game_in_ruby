require 'Ruby2d'
require_relative './lib/characters/warrior.rb'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/road.rb'
require_relative './lib/logic/logic_warrior.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_rectangle.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)


scenery = Logic::Scenery.new sun: Graphics::Sun.new, road: Graphics::Road.new, rocks: Graphics::Rocks.new, mountain_close: Graphics::Mountain_close.new, sky: Graphics::Sky.new, ancoras: ancoras

hero = Logic::Hero.new hero: Graphics::Hero.new, scenery: scenery


keyboard_inputs = []
mouse_inputs = []

on :key_held do |event|
	if hero.action_now == :none || hero.action_now == :moving
		keyboard_inputs << event.key
		hero.control_moviment(keyboard_inputs)
	end
end

on :key_up do |event|
	hero.control_hero_stop event.key
end

on :mouse_down do |event|
  case event.button
  when :left
	hero.hero_attack
  when :rigth
    #hero.play animation: :stop_rigth, loop: true
  when :x1
    #hero.play animation: :stop_top, loop: true
  when :x2
    #hero.play animation: :stop_bottom, loop: true
  end
end

update do
  hero.atack ##verifica se pode andar
  hero.att_scenery
end

show