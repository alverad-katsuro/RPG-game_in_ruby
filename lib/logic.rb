class Logic
	attr_reader :player_one, :player_two

	##### ADICIONA OS COMPONENTES BASICOS #####
	def add(player_one: nil, player_two:nil , scenery:nil)
		@player_one = player_one unless player_one == nil
		@player_two = player_two unless player_two == nil
		@scenery = scenery unless scenery == nil
	end
	#### FIM ####

	##### METODOS QUE NECESSITAM SER EXECUTADOS 60x/segundos
	def update!
		attack? ##verifica se os jogadores podem atacar
		alives? ##verifica se os nbs morreram
		shadow!
		@scenery.update!
	end
	#### FIM ####


	##### CHAMADA DO MOVIMENTO DE PARADA #####
	def stop? event
		@player_one.control_hero_stop event.key
		@player_two.control_hero_stop event.key
	end
	#### FIM ####

	###### CHAMADA DAS ACOES DO JOGADOR ######

	##### JOGADOR 1 #####
	def action_player_one(k_b_1:)
		posicao_z!
		if (@player_one.action_now == :none || @player_one.action_now == :moving) && @player_one.stats_basic.vivo
			if k_b_1.include? 'g'
				player_one_attack()
				k_b_1.clear
			elsif k_b_1.size == 4
				@player_one.control_moviment(kb_inputs: k_b_1)
			end
		end
	end
	#### FIM ####

	##### JOGADOR 2 #####
	def action_player_two(k_b_2:)
		posicao_z!
		if (@player_two.action_now == :none || @player_two.action_now == :moving) && @player_two.stats_basic.vivo
			if k_b_2.include? 'keypad 0'
				player_two_attack()
				k_b_2.clear
			elsif k_b_2.size == 4
				@player_two.control_moviment(kb_inputs: (k_b_2))
			end
		end
	end
	#### FIM ####

	##### JOGADOR 1 ATTACK #####
	def player_one_attack()
		if @player_one.stats_basic.vivo
			@player_one.hero_attack
			if @player_one.action_now == :attacking && colisao? && @player_two.stats_basic.vivo && (hero_seeing_oponent? p1: @player_one, p2: @player_two)
				@player_two.life_down
				@player_two.hurt_animation
				empurado(player: @player_two, direction: @player_one.direction_now)
			end
		end
	end
	#### FIM ####

	##### JOGADOR 2 ATTACK #####
	def player_two_attack()
		if @player_two.stats_basic.vivo
			@player_two.hero_attack
			if @player_two.action_now == :attacking && colisao? && @player_one.stats_basic.vivo && (hero_seeing_oponent? p1: @player_two, p2: @player_one)
				@player_one.life_down
				@player_one.hurt_animation
				empurado(player: @player_one, direction: @player_two.direction_now)
			end
		end
	end
	#### FIM ####

	###### FIM CAPTURA DE MOVIMENTO ######

	private ##### FUNCOES USADAS PELOS METODOS ACIMA

	#### EU TENHO SOMBRA ####
	def shadow!
		@player_one.shadow_location
		@player_two.shadow_location
	end
	#### FIM ####

	#### EU NAO FICO VOANDO ####
	def posicao_z!
		if @player_one.animation_characters.y < @player_two.animation_characters.y
			@player_one.animation_characters.z = 6
			@player_two.animation_characters.z = 7
		else
			@player_one.animation_characters.z = 7
			@player_two.animation_characters.z = 6
		end
	end
	#### FIM ####

	#### POSSO ATACAR? ####
	def attack?
		@player_one.atack ##verifica se pode andar
		@player_two.atack ##verifica se pode andar
	end
	#### FIM ####

	#### ESTOU VIVO? ####
	def alives?
		@player_one.hero_alive?
		@player_two.hero_alive?
	end
	#### FIM ####

	#### IMPRIME VIDA ATUAL ####
	def life_now
		puts "P1: #{@player_one.stats_basic.life} P2: #{@player_two.stats_basic.life}"
	end
	#### FIM ####

	#### ESTOU SENDO EMPURRADO ####
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
	#### FIM ####

	###### LOGICA COLISAO ######

	#### POSSO COLIDIR? ####
	def colisao?
		if collision?(@player_one.animation_characters, [@player_two.animation_characters])
			true
		else
			false
		end
	end
	#### FIM ####

	#### MOTOR DA COLISAO ####
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
	#### FIM DO MOTOR DA COLISAO ####

	###### FIM DA LOGICA DA COLISAO ######

	#### ESTOU VENDO MEU OPONENTE? ####
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
	#### FIM ####
end