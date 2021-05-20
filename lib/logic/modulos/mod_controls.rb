class Logic
    module Controls
        module Auxiliar
            Keyboard_Map_One = {a:'a', d:'d', w:'w', s:'s', g:'g'}
            Keyboard_Map_Two = {a:'left', d:'right', w:'up', s:'down', g:'keypad 0'}
            ##### METODOS DE CONTROLES DE MOVIMENTO #####

            def modulo_keyboard(keyboard_inputs, key_map)
                if keyboard_inputs.size == 4
                    keyboard_inputs.pop(2).each_slice(2) do |k1, k2|
                        case k1
                            when key_map[:a]
                                move_hero_left()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:d]
                                move_hero_rigth()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:w]
                                move_hero_top()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:s]
                                move_hero_bottom()
                                moviment_k2_horizontal(k2: k2, key_map: key_map)
                            when key_map[:g]
                                hero_attack()                            
                        end
                    end
                end
            end

            def moviment_k2_horizontal (k2:, key_map:)
                case k2
                    when key_map[:a]
                        hero_x_modi(horizontal: :left, dash: -0.3)
                    when key_map[:d]
                        hero_x_modi(horizontal: :rigth, dash: 0.3)
                    when key_map[:g]
                        hero_attack()
                end
            end

            def moviment_k2_vertical (k2:, key_map:)
                case k2
                    when key_map[:w]
                        hero_y_modi(vertical: :top, dash: -0.3)
                    when key_map[:s]
                        hero_y_modi(vertical: :bottom, dash: 0.3)
                    when key_map[:g]
                        hero_attack()     
                end
            end 
        end

        module Controls_One_Keyboard
            include Logic::Controls::Auxiliar
            ##### CONTROLES DE MOVIMENTO #####
            def control_moviment(keyboard_inputs)
                modulo_keyboard(keyboard_inputs, Keyboard_Map_One)
            end
        end

        module Controls_Two_Keyboard
            include Logic::Controls::Auxiliar
            ##### CONTROLES DE MOVIMENTO #####
            def control_moviment(keyboard_inputs)
                modulo_keyboard(keyboard_inputs, Keyboard_Map_Two)
            end
        end
    end
end

