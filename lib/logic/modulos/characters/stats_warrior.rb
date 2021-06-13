class Logic
    class Hero
        attr_accessor :time_attack, :time_defend, :speed, :action_now, :direction_now, :life, :deaths, :vivo
        def initialize
            @speed = 5.0
            @direction_now = :bottom
            @action_now = :none
            @time_attack = Time.now
            @time_defend = Time.now
            @life = 100
            @deaths = 0
            @vivo = true
        end
    end
end
