class Logic
    class Characters
        module Hero
            #### Modifica a coordenada x do heroi
            def hero_y_modi (vertical:, dash: 1.0)
                if vertical == :top
                    if (@objects[:animation].y) >= Window.height*0.6
                        @objects[:animation].y += (@objects[:stats_basic].speed * dash)
                    end
                end
                if vertical == :bottom
                    if @objects[:animation].y <= (Window.height) - @objects[:animation].height * 0.8
                        @objects[:animation].y += (@objects[:stats_basic].speed * dash)
                    end
                end
            end

            #### Modifica a coordenada x do heroi
            def hero_x_modi (horizontal:, dash: 1.0)
                if horizontal == :left
                    if @objects[:animation].x + 45 >= 0
                        @objects[:animation].x += (@objects[:stats_basic].speed * dash)
                    end
                end
                if horizontal == :right
                    if @objects[:animation].x <= (Window.width) - 165
                        @objects[:animation].x += (@objects[:stats_basic].speed * dash)
                    end
                end
            end

            ##### FIM DO CONTROLE DE MOVIMENTO

            def hurt_animation
                case @objects[:stats_basic].direction_now
                when :left
                    @objects[:animation].play(animation: :hurt_left, loop: false)
                when :right
                    @objects[:animation].play(animation: :hurt_right, loop: false)
                when :top
                    @objects[:animation].play(animation: :hurt_top, loop: false)
                when :bottom
                    @objects[:animation].play(animation: :hurt_bottom, loop: false)
                end
            end

            ##### ANIMACAO MORTE #####
            def death_animation
                case @objects[:stats_basic].direction_now
                when :left
                    @objects[:animation].play(animation: :death_left, loop: false)
                when :right
                    @objects[:animation].play(animation: :death_right, loop: false)
                when :top
                    @objects[:animation].play(animation: :death_top, loop: false)
                when :bottom
                    @objects[:animation].play(animation: :death_bottom, loop: false)
                end
            end
            ####

            ##### LOGICA DOS MOVIMENTOS
            def move_hero_top
                action(action: :moving)
                direction(direction: :top)
                @objects[:animation].play(animation: :walk_top, loop: false)
                hero_y_modi(vertical: :top, dash: -1)
            end

            def move_hero_bottom
                action(action: :moving)
                direction(direction: :bottom)
                @objects[:animation].play(animation: :walk_bottom, loop: false)
                hero_y_modi(vertical: :bottom, dash: 1)
            end

            def move_hero_left
                action(action: :moving)
                direction(direction: :left)
                @objects[:animation].play(animation: :walk_left, loop: false)
                hero_x_modi(horizontal: :left, dash: -1)
            end

            def move_hero_rigth
                action(action: :moving)
                direction(direction: :right)
                @objects[:animation].play(animation: :walk_right, loop: false)
                hero_x_modi(horizontal: :right, dash: 1)
            end
            ##### FIM DA LOGICA DOS MOVIMENTOS


            ##### CONTROLE DO HEROI PARADO
            def control_hero_stop event
                if ((@objects[:key_map].values).include? event) && (@objects[:stats_basic].action_now != :attacking) && 
                    (@objects[:stats_basic].action_now != :defend) && objects[:stats_basic].vivo
                    stop_hero_animation()
                    action action: :none
                end
            end

            ##### LOGICA DO HEROI PARADO
            def stop_hero_animation
                case @objects[:stats_basic].direction_now
                when :top
                    @objects[:animation].play(animation: :stop_top, loop: true)
                when :bottom
                    @objects[:animation].play(animation: :stop_bottom, loop: true)
                when :left
                    @objects[:animation].play(animation: :stop_left, loop: true)
                when :right
                    @objects[:animation].play(animation: :stop_right, loop: true)
                end
            end
            ##### FIM DA LOGICA DO HEROI PARADO

            def hero_defend
                case @objects[:stats_basic].direction_now
                when :left
                    @objects[:animation].play(animation: :defend_left, loop: false)
                    hero_defend_modulo
                when :right
                    @objects[:animation].play(animation: :defend_right, loop: false)
                    hero_defend_modulo
                when :top
                    @objects[:animation].play(animation: :defend_top, loop: false)
                    hero_defend_modulo
                when :bottom
                    @objects[:animation].play(animation: :defend_bottom, loop: false)
                    hero_defend_modulo
                end
            end

            ##### PERMITE O HEROI ATACAR
            def hero_attack
                @objects[:songs_atk][rand(@objects[:songs_atk].size)].play
                case @objects[:stats_basic].direction_now
                when :left
                    @objects[:animation].play(animation: :attack_left, loop: false)
                    hero_attack_modulo()
                when :right
                    @objects[:animation].play(animation: :attack_right, loop: false)
                    hero_attack_modulo()
                when :top
                    @objects[:animation].play(animation: :attack_top, loop: false)
                    hero_attack_modulo()
                when :bottom
                    @objects[:animation].play(animation: :attack_bottom, loop: false)
                    hero_attack_modulo()
                end
            end

            private
            
            #### LOGICA REPETIVEL NO ATACK
            def hero_attack_modulo
                @objects[:stats_basic].time_attack = Time.now
                action(action: :attacking)
            end
            #### FIM ####

            #### LOGICA REPETIVEL NA DEFESA
            def hero_defend_modulo
                @objects[:stats_basic].time_defend = Time.now
                action(action: :defend)
            end
            #### FIM ####
        end
    end
end