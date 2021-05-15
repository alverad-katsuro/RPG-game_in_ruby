{
    walk_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 2, width: 165, desloc_width: 1.5, height: 165)),
    walk_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 8, width: 165, height: 165)),
    walk_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 14, width: 165, height: 165)),
    walk_rigth: (create_movimente(qt_frames: 30, coluna: 0, linha: 21, width: 165, height: 165)),
    stop_top: (create_movimente(qt_frames: 30, coluna: 0, linha: 1, width: 165, desloc_width: 1.5, height: 165)),
    stop_bottom: (create_movimente(qt_frames: 30, coluna: 0, linha: 7, width: 165, height: 165)),
    stop_left: (create_movimente(qt_frames: 30, coluna: 0, linha: 13, width: 165, height: 165)),
    stop_rigth: (create_movimente(qt_frames: 30, coluna: 0, linha: 20, width: 165, height: 165)),
    attack_top: (create_movimente(qt_frames: 14, coluna: 0, linha: 3, width: 165, desloc_width: 1.5, height: 165)),
    attack_bottom: (create_movimente(qt_frames: 14, coluna: 0, linha: 9, width: 165, height: 165)),
    attack_left: (create_movimente(qt_frames: 14, coluna: 0, linha: 15, width: 165, height: 165)),
    attack_rigth: (create_movimente(qt_frames: 14, coluna: 0, linha: 16, width: 165, height: 165)),
  }


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
