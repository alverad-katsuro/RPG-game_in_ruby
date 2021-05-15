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