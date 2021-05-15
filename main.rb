require 'Ruby2d'
require_relative './lib/characters/warrior.rb'
require_relative './lib/background/fundo.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1366,
    height: 728,
    fullscreen: false,
    diagnostics: true
)

hero = Graphics::Hero.new
background = Graphics::Background.new

hero.play animation: :stop_bottom, loop: true
background.add

keyboard_inputs = []
mouse_inputs = []



on :key_held do |event|
  if hero.action_now == :none || hero.action_now == :moving
    keyboard_inputs << event.key
      if keyboard_inputs.size == 4
        keyboard_inputs.pop(2).each_slice(2) do |k1, k2|
        case k1
        when 'a'
          hero.action action: :moving
          hero.play animation: :walk_left, loop: false
          hero.direction direction: :left
          hero.x += -2
          background.x += 0.4
          case k2
          when 'w'
            hero.y += -2
          when 's'
            hero.y += 2
          end
        when 'd'
          hero.action action: :moving
          hero.play animation: :walk_rigth, loop: false
          hero.direction direction: :rigth
          hero.x += 2
          background.x += -0.4
          case k2
          when 'w'
            hero.y += -2
          when 's'
            hero.y += 2
          end
        when 'w'
          hero.action action: :moving
          hero.play animation: :walk_top, loop: false
          hero.direction direction: :top
          hero.y += -2
          case k2
          when 'a'
            hero.x += -2
          when 'd'
            hero.x += 2
          end
        when 's'
          hero.action action: :moving
          hero.play animation: :walk_bottom, loop: false
          hero.direction direction: :bottom
          hero.y += 2
          case k2
          when 'a'
            hero.x += -2
          when 'd'
            hero.x += 2
          end
        end
      end
    end
  end
end
    
def moviment_stop()
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

on :key_up do |event|
    case event.key
    when 'a'
      hero.play animation: :stop_left, loop: true
      hero.action action: :none
    when 'd'
      hero.play animation: :stop_rigth, loop: true
      hero.action action: :none
    when 'w'
      hero.play animation: :stop_top, loop: true
      hero.action action: :none
    when 's'
      hero.play animation: :stop_bottom, loop: true
      hero.action action: :none
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