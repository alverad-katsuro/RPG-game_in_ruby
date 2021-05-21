class Logic
  attr_reader :player_one, :player_two

  def initialize player_one:, player_two:
    @player_one = player_one
    @player_two = player_two
  end

  def life_now
    puts "P1: #{@player_one.stats_basic.life} P2: #{@player_two.stats_basic.life}"
  end

  def player_one_attack()
	@player_one.hero_attack
    if @player_one.action_now == :attacking && colisao? && (hero_seeing_oponent? p1: @player_one, p2: @player_two)
      @player_two.life_down
      	empurado(player: @player_two, direction: @player_one.direction_now)
    end
  end

  def player_two_attack()
	@player_two.hero_attack
	puts "att? #{@player_two.action_now == :attacking} coli: #{colisao?} hero_see: #{(hero_seeing_oponent? p1: @player_two, p2: @player_one)}"
    if @player_two.action_now == :attacking && colisao?  && (hero_seeing_oponent? p1: @player_two, p2: @player_one)
      @player_one.life_down
    	empurado(player: @player_one, direction: @player_two.direction_now)
    end
  end

  def action_player_one(k_b_1:)
		if @player_one.action_now == :none || @player_one.action_now == :moving
			if k_b_1.include? 'g'
				player_one_attack()
				k_b_1.clear
			elsif k_b_1.size == 4
				@player_one.control_moviment(kb_inputs: k_b_1)
			end
		end
  end
  
  def action_player_two(k_b_2:)
      	if @player_two.action_now == :none || @player_two.action_now == :moving
			if k_b_2.include? 'keypad 0'
				player_two_attack()
				k_b_2.clear
			elsif k_b_2.size == 4
				@player_two.control_moviment(kb_inputs: (k_b_2))
			end
    	end
  end

  def colisao?
	if collision?(@player_one.animation_characters, [@player_two.animation_characters])
		true
	else
		false
	end
  end

  def alives?
	@player_one.hero_alive?
    @player_two.hero_alive?
  end

  def attack?
    @player_one.atack ##verifica se pode andar
    @player_two.atack ##verifica se pode andar
  end

  def stop? event 
    @player_one.control_hero_stop event.key
	  @player_two.control_hero_stop event.key
  end

  private

  def empurado player:, direction:
    case direction
    when :left
      	player.hero_x_modi(horizontal: :left, dash: -6.0)
    when :right
     	player.hero_x_modi(horizontal: :right, dash: 6.0)
    when :top
      	player.hero_y_modi(vertical: :top, dash: -6.0)
    when :bottom
     	player.hero_y_modi(vertical: :bottom, dash: 6.0)
    end
    life_now
  end

  def collision?(char, objects)
    Array(objects).any? do |object|
      horizontal_overlap(char, object) &&
    	vertical_overlap(char, object)
    end
  end
  
  def horizontal_overlap(char, object)
    (char.x + (char.width) -80) > object.x &&
      char.x < (object.x + (object.width) - 80)
  end
  
  def vertical_overlap(char, object)
    (object.y + (object.height) -100) > char.y &&
      object.y < (char.y + (char.height) -100)
  end

  def hero_seeing_oponent? (p1:, p2:)
    if (p1.animation_characters.x > p2.animation_characters.x && p1.stats_basic.direction_now == :left) ||
       (p1.animation_characters.x < p2.animation_characters.x && p1.stats_basic.direction_now == :right) ||
       (p1.animation_characters.y > p2.animation_characters.y && p1.stats_basic.direction_now == :top) ||
       (p1.animation_characters.y < p2.animation_characters.y && p1.stats_basic.direction_now == :bottom)
      true
    else
      false
    end
  end
end