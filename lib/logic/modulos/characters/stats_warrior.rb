class Logic
    class Hero
        attr_accessor :time_attack, :speed, :action_now, :direction_now
        def initialize
            @speed = 15.0
            @direction_now = :bottom
            @action_now = :none
            @time_attack = Time.now
        end
    end
end
