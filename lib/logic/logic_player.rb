require 'forwardable'

class Logic
    class Player
        extend Forwardable
        attr_reader :animation_characters, :stats_basic

        delegate [:speed, :direction_now, :action_now, :time_attack] => :@stats_basic
        delegate [:play, :x, :y] => :@animation_characters


        def initialize animation_characters:, stats_basic:
            @animation_characters = animation_characters
            @stats_basic = stats_basic
        end

        def add_modulos modulos:
            modulos.each do |modulo|
                extend modulo
            end
        end
    end
end


