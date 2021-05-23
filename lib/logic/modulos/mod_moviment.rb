class Logic
    class Characters
        module Hero
            #### Modifica a coordenada x do heroi
            def hero_y_modi (vertical:, dash: 1.0)
                if vertical == :top
                    if (y) >= Window.height*0.6
                        @animation_characters.y += (speed * dash)
                    end
                end
                if vertical == :bottom
                    if y <= (Window.height) -150
                        @animation_characters.y += (speed * dash)
                    end
                end
            end

            #### Modifica a coordenada x do heroi
            def hero_x_modi (horizontal:, dash: 1.0)
                if horizontal == :left
                    if x + 45 >= 0
                        @animation_characters.x += (speed * dash)
                    end
                end
                if horizontal == :right
                    if x <= (Window.width) - 165
                        @animation_characters.x += (speed * dash)
                    end
                end
            end

            ##### FIM DO CONTROLE DE MOVIMENTO

            def hurt_animation
                case direction_now
                when :left
                    play(animation: :hurt_left, loop: false)
                when :right
                    play(animation: :hurt_right, loop: false)
                when :top
                    play(animation: :hurt_top, loop: false)
                when :bottom
                    play(animation: :hurt_bottom, loop: false)
                end
            end

            ##### ANIMACAO MORTE #####
            def death_animation
                case direction_now
                when :left
                    play(animation: :death_left, loop: false)
                when :right
                    play(animation: :death_right, loop: false)
                when :top
                    play(animation: :death_top, loop: false)
                when :bottom
                    play(animation: :death_bottom, loop: false)
                end
            end
            ####

            ##### LOGICA DOS MOVIMENTOS
            def move_hero_top
                action(action: :moving)
                direction(direction: :top)
                play(animation: :walk_top, loop: false)
                hero_y_modi(vertical: :top, dash: -1)
            end

            def move_hero_bottom
                action(action: :moving)
                direction(direction: :bottom)
                play(animation: :walk_bottom, loop: false)
                hero_y_modi(vertical: :bottom, dash: 1)
            end

            def move_hero_left
                action(action: :moving)
                direction(direction: :left)
                play(animation: :walk_left, loop: false)
                hero_x_modi(horizontal: :left, dash: -1)
            end

            def move_hero_rigth
                action(action: :moving)
                direction(direction: :right)
                play(animation: :walk_right, loop: false)
                hero_x_modi(horizontal: :right, dash: 1)
            end
            ##### FIM DA LOGICA DOS MOVIMENTOS


            ##### CONTROLE DO HEROI PARADO
            def control_hero_stop event
                if ((@key_map.values).include? event) && (action_now != :attacking) && vivo
                    stop_hero_animation()
                    action action: :none
                end
            end

            ##### LOGICA DO HEROI PARADO
            def stop_hero_animation
                case direction_now
                    when :top
                        play(animation: :stop_top, loop: true)
                    when :bottom
                        play(animation: :stop_bottom, loop: true)
                    when :left
                        play(animation: :stop_left, loop: true)
                    when :right
                        play(animation: :stop_right, loop: true)
                end
            end
            ##### FIM DA LOGICA DO HEROI PARADO

            ##### PERMITE O HEROI ATACAR
            def hero_attack
                case direction_now
                when :left
                    play(animation: :attack_left, loop: false)
                    hero_attack_modulo()
                when :right
                    play(animation: :attack_right, loop: false)
                    hero_attack_modulo()
                when :top
                    play(animation: :attack_top, loop: false)
                    hero_attack_modulo()
                when :bottom
                    play(animation: :attack_bottom, loop: false)
                    hero_attack_modulo()
                end
            end

            private
            
            #### LOGICA REPETIVEL NO ATACK
            def hero_attack_modulo
                @stats_basic.time_attack = Time.now
                action(action: :attacking)
            end
            #### FIM ####
        end
    end
end