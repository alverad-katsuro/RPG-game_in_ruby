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

hero.play animation: :stop_bottom, loop: true

keyboard_inputs = []
mouse_inputs = []

on :key_held do |event|
  if hero.action_now == :none
    keyboard_inputs << event.key
      if keyboard_inputs.size == 4
        keyboard_inputs.pop(2).each_slice(2) do |k1, k2|
        case k1
        when 'a'
          hero.play animation: :walk_left, loop: false
          hero.direction direction: :left
          hero.x += -2
          hero.y += -2 if k2 == "w"
          hero.y += 2 if k2 == "s"
        when 'd'
          hero.play animation: :walk_rigth, loop: false
        hero.direction direction: :rigth
          hero.x += 2
          hero.y += -2 if k2 == "w"
          hero.y += 2 if k2 == "s"
        when 'w'
          hero.play animation: :walk_top, loop: false
          hero.direction direction: :top
          hero.y += -2
          hero.x += -2 if k2 == "a"
          hero.x += 2 if k2 == "d"
        when 's'
          hero.play animation: :walk_bottom, loop: false
          hero.direction direction: :bottom
          hero.y += 2
          hero.x += -2 if k2 == "a"
          hero.x += 2 if k2 == "d"
        end
      end
    end
  end
end
    
on :key_up do |event|
  if hero.action_now == :none
    case event.key
    when 'a'
      hero.play animation: :stop_left, loop: true
      hero.time_attack = Time.new
    when 'd'
      hero.play animation: :stop_rigth, loop: true
      hero.time_attack = Time.new
    when 'w'
      hero.play animation: :stop_top, loop: true
      hero.time_attack = Time.new
    when 's'
      hero.play animation: :stop_bottom, loop: true
      hero.time_attack = Time.new
    end
  end
end

on :mouse_down do |event|
  case event.button
  when :left
    if hero.direction_now == :left
      hero.play animation: :attack_left, loop: false
      hero.time_attack = Time.now
      hero.action(action: :attacking)
    elsif hero.direction_now == :rigth
      hero.play animation: :attack_rigth, loop: false
      hero.time_attack = Time.now
      hero.action action: :attacking
    elsif hero.direction_now == :top
      hero.play animation: :attack_top, loop: false
      hero.time_attack = Time.now
      hero.action action: :attacking
    elsif hero.direction_now == :bottom
      hero.play animation: :attack_bottom, loop: false
      hero.time_attack = Time.now
      hero.action action: :attacking
    end
  when :rigth
    #hero.play animation: :stop_rigth, loop: true
  when :x1
    #hero.play animation: :stop_top, loop: true
  when :x2
    #hero.play animation: :stop_bottom, loop: trueaaaaaaaaaa
  end
end


update do
  hero.atack ##verifica se pode andar
end

show