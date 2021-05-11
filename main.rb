require 'Ruby2d'
require_relative './lib/characters/warrior.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1366,
    height: 728,
    fullscreen: false,
    diagnostics: true
)

##create_movimente - quantidade de frames, a coluna do frame, a linha do frame, a largura, o deslocamento relativo se houver erro na coordenada x, a altura do frame
def create_movimente(qt_frames:0, coluna:0, linha:0, width:0, desloc_width:0, height:0)
  Array.new(qt_frames) {|range| {x: ((range + coluna) * width + 1 + desloc_width*range), y: (linha * height +1) , width: width, height: height}}
end



hero = Graphics::Hero.new
hero.play animation: :stop_bottom

on :key_held do |event|
    case event.key
      when 'a'
        hero.play animation: :walk_left, loop: false
      when 'd'
        hero.play animation: :walk_rigth, loop: false
      when 'w'
        hero.play animation: :walk_top, loop: false
      when 's'
        hero.play animation: :walk_bottom, loop: false
    end
end

on :key_up do |event|
  case event.key
    when 'a'
      hero.play animation: :stop_left, loop: true
      hero.direction direction: :left
    when 'd'
      hero.play animation: :stop_rigth, loop: true
      hero.direction direction: :rigth
    when 'w'
      hero.play animation: :stop_top, loop: true
      hero.direction direction: :top
    when 's'
      hero.play animation: :stop_bottom, loop: true
      hero.direction direction: :bottom
  end
end

on :mouse_down do |event|
  p event
  case event.button
    when :left
      if hero.direction_now == :left
        hero.play animation: :attack_left, loop: false
      elsif hero.direction_now == :rigth
        hero.play animation: :attack_rigth, loop: false
      elsif hero.direction_now == :top
        hero.play animation: :attack_top, loop: false
      elsif hero.direction_now == :bottom
        hero.play animation: :attack_bottom, loop: false
      end
    when :rigth
      #hero.play animation: :stop_rigth, loop: true
    when :x1
      #hero.play animation: :stop_top, loop: true
    when :x2
      #hero.play animation: :stop_bottom, loop: true
  end
end

def test hero
  if hero.action_now == :none
    case action_now
      when :left
        hero.play animation: :stop_left, loop: true
      when :rigth
        hero.play animation: :stop_rigth, loop: true
      when :top
        hero.play animation: :stop_top, loop: true
      when :bottom
        hero.play animation: :stop_bottom, loop: true 
    end
  end
end

time_start = Time.now + 10

update do
end

show