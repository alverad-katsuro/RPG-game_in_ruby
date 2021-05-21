class Logic
    module Controls
        module Auxiliar
            Keyboard_Map_One = {left:'a', right:'d', up:'w', down:'s', attack:'g'}
            Keyboard_Map_Two = {left:'left', right:'right', up:'up', down:'down', attack:'keypad 0'}
            ##### METODOS DE CONTROLES DE MOVIMENTO #####

            def modulo_keyboard(keyboard_inputs, key_map)
                if keyboard_inputs.size == 4
                    keyboard_inputs.pop(2).each_slice(2) do |k1, k2|
                        case k1
                            when key_map[:left]
                                move_hero_left()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:right]
                                move_hero_rigth()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:up]
                                move_hero_top()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:down]
                                move_hero_bottom()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:attack]
                                hero_attack()                            
                        end
                    end
                end
            end

            def moviment_k2_horizontal (k2:, key_map:)
                case k2
                    when key_map[:left]
                        hero_x_modi(horizontal: :left, dash: -0.3)
                    when key_map[:right]
                        hero_x_modi(horizontal: :right, dash: 0.3)
                    when key_map[:attack]
                        hero_attack()
                end
            end

            def moviment_k2_vertical (k2:, key_map:)
                case k2
                    when key_map[:up]
                        hero_y_modi(vertical: :top, dash: -0.3)
                    when key_map[:down]
                        hero_y_modi(vertical: :bottom, dash: 0.3)
                    when key_map[:attack]
                        hero_attack()     
                end
            end 
        end

        module Controls_One_Keyboard
            include Logic::Controls::Auxiliar
            ##### CONTROLES DE MOVIMENTO #####
            def control_moviment(kb_inputs:)
                modulo_keyboard(kb_inputs, @key_map)
            end
        end

        module Controls_Two_Keyboard
            include Logic::Controls::Auxiliar
            ##### CONTROLES DE MOVIMENTO #####
            def control_moviment(kb_inputs:)
                modulo_keyboard(kb_inputs, @key_map)
            end
        end
    end
end

