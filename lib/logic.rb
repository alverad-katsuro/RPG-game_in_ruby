class Logic
	attr_reader :player_one, :player_two, :historia

	##### ADICIONA OS COMPONENTES BASICOS #####
	def add(player_one: nil, player_two:nil , scenery:nil, historia:nil)
		@player_one = player_one unless player_one == nil
		@player_two = player_two unless player_two == nil
		@scenery = scenery unless scenery == nil
		@historia = historia unless historia == nil
		@text_on = false
		@clock_dead = nil
		@round = 1
		@placar = "00"
	end
	#### FIM ####

	##### METODOS QUE NECESSITAM SER EXECUTADOS 60x/segundos
	def update!
		attack? ##verifica se os jogadores podem andar
		defend? ##verifica se os jogadores podem andar
		alives? ##verifica se os nbs morreram
		shadow!
		@scenery.update!
		logic_unshow_text
		logic_show_text
	end
	#### FIM ####

	def try_again!
		revive!
		@player_one.retry!
		@player_two.retry!
	end
	
	def revive!
		unless Time.now - @clock_dead < 5
			@player_one.reload!
			@player_two.reload!
			@player_two.objects[:animation].x = Window.width - @player_two.objects[:animation].width
			@clock_dead = nil
			@historia.some_placar
			@historia.some_round
			@text_on = false
		end
	end

	def logic_show_text
		@placar = atualiza_placar
		unless @player_one.objects[:stats_basic].vivo && @player_two.objects[:stats_basic].vivo || @clock_dead != nil || @placar.include?("2")
			@text_on = true
			@round += 1
			case @placar
			when "01"
				@historia.mostra_placar placar: @placar
				@clock_dead = Time.now
			when "10"
				@historia.mostra_placar placar: @placar
				@clock_dead = Time.now
			when "11"
				@historia.mostra_placar placar: @placar
				@clock_dead = Time.now
			end
			@historia.mostra_round round: @round
		end
	end
	
	def logic_unshow_text
		time = Time.now - @historia.clock_intro
		if time < 38
			unless time < 34 && time <= 36
				@historia.mostra_intro? resp: false 
				@historia.mostra_round round: @round
				@historia.mostra_placar placar: @placar
			end
			unless time < 36
				@historia.some_round
				@historia.some_placar
				@text_on = false
			end
		end
		revive! unless @clock_dead == nil || @placar.include?("2")
		winner! if @placar.include?"2"
	end

	def winner!
		@historia.some_placar
		@historia.some_round
		@text_on = true
		case @placar[0]
		when "2"
			@historia.mostra_winner player: :one
		else
			@historia.mostra_winner player: :two
		end
	end
	
	def atualiza_placar
		placar_right = @player_one.objects[:stats_basic].deaths.to_s
		placar_left = @player_two.objects[:stats_basic].deaths.to_s
		placar_left + placar_right
	end
	
	def clock
		if @text_on
			@clock = Time.now
		end
	end

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
		if (@player_one.objects[:stats_basic].action_now == :none || @player_one.objects[:stats_basic].action_now == :moving) && !@text_on && @player_one.objects[:stats_basic].vivo
			(k_b_1.clear; player_one_attack) if k_b_1.include? 'g'
			(k_b_1.clear; @player_one.hero_defend) if k_b_1.include? 'h'
			if k_b_1.size == 4 && !sobreposicao? #se não tiver sobreposto = false
				@player_one.control_moviment(kb_inputs: k_b_1)
			elsif sobreposicao?
				mod_remove_kb(kb: k_b_1, teclas: ['w', 's', 'a', 'd'], obj: [@player_one.objects[:animation], @player_two.objects[:animation]])
				@player_one.control_moviment(kb_inputs: k_b_1)
			end
		end
	end
	#### FIM ####

	##### JOGADOR 2 #####
	def action_player_two(k_b_2:)
		posicao_z!
		if (@player_two.objects[:stats_basic].action_now == :none || @player_two.objects[:stats_basic].action_now == :moving) && !@text_on && @player_two.objects[:stats_basic].vivo
			(k_b_2.clear; player_two_attack) if k_b_2.include? 'keypad 1'
			(k_b_2.clear; @player_two.hero_defend) if k_b_2.include? 'keypad 3'
			if k_b_2.size == 4 && !sobreposicao?
				@player_two.control_moviment(kb_inputs: k_b_2)
			elsif sobreposicao?
				mod_remove_kb(kb: k_b_2, teclas: ['up', 'down', 'left', 'right'], obj: [@player_two.objects[:animation], @player_one.objects[:animation]])
				@player_two.control_moviment(kb_inputs: k_b_2)
			end
		end
	end
	#### FIM ####

	##### JOGADOR 1 ATTACK #####
	def player_one_attack()
		if @player_one.objects[:stats_basic].vivo
			@player_one.hero_attack
			if @player_one.objects[:stats_basic].action_now == :attacking && colisao? && @player_one.objects[:stats_basic].vivo && !@text_on && (hero_seeing_oponent? p1: @player_one, p2: @player_two)
				unless @player_two.objects[:stats_basic].action_now == :defend && @player_one.objects[:stats_basic].direction_now != @player_two.objects[:stats_basic].direction_now
					if (@player_two.objects[:stats_basic].direction_now == :left && @player_one.objects[:stats_basic].direction_now == :right || @player_two.objects[:stats_basic].direction_now == :right) && @player_one.objects[:stats_basic].direction_now == :left && @player_two.objects[:stats_basic].action_now == :attacking && @player_one.objects[:stats_basic].action_now == :attacking
						attack_simutaneo
					else
						@player_two.hurt_animation
						@player_two.life_down
						empurado(player: @player_two, direction: @player_one.objects[:stats_basic].direction_now)
					end
				else
					@player_one.objects[:songs_defend][rand(@player_one.objects[:songs_defend].size)].play
					empurado(player: @player_one, direction: @player_two.objects[:stats_basic].direction_now)				
				end
			end
		end
	end
	#### FIM ####

	##### JOGADOR 2 ATTACK #####
	def player_two_attack()
		if @player_two.objects[:stats_basic].vivo
			@player_two.hero_attack
			if @player_two.objects[:stats_basic].action_now == :attacking && colisao? && @player_two.objects[:stats_basic].vivo &&!@text_on && (hero_seeing_oponent? p1: @player_two, p2: @player_one)
				unless @player_one.objects[:stats_basic].action_now == :defend && @player_one.objects[:stats_basic].direction_now != @player_two.objects[:stats_basic].direction_now
					if (@player_two.objects[:stats_basic].direction_now == :left && @player_one.objects[:stats_basic].direction_now == :right || @player_two.objects[:stats_basic].direction_now == :right && @player_one.objects[:stats_basic].direction_now == :left) && @player_two.objects[:stats_basic].action_now == :attacking && @player_one.objects[:stats_basic].action_now == :attacking
						attack_simutaneo
					else
						@player_one.hurt_animation
						@player_one.life_down
						empurado(player: @player_one, direction: @player_two.objects[:stats_basic].direction_now)
					end
				else
					@player_two.objects[:songs_defend][rand(@player_two.objects[:songs_defend].size)].play
					empurado(player: @player_two, direction: @player_one.objects[:stats_basic].direction_now)
				end
			end
		end
	end
	#### FIM ####

	###### FIM CAPTURA DE MOVIMENTO ######

	private ##### FUNCOES USADAS PELOS METODOS ACIMA

	def remove_coll(array, key)
		array.select! do |number|
			number != key
		end
	end

	def mod_remove_kb(kb:, teclas:[], obj:[])
		remove_coll(kb, teclas[0]) unless obj[0].y < obj[1].y
		remove_coll(kb, teclas[1]) unless obj[0].y > obj[1].y
		remove_coll(kb, teclas[2]) unless obj[0].x < obj[1].x
		remove_coll(kb, teclas[3]) unless obj[0].x > obj[1].x
	end

	def sobreposicao?
		collision?(@player_one.objects[:animation], [@player_two.objects[:animation]])
		#puts "P0 x #{@player_one.objects[:animation].x}, P0 y #{@player_one.objects[:animation].y}"
		#puts "P1 x #{@player_two.objects[:animation].x}, P1 y #{@player_two.objects[:animation].y}"
	end

	def attack_simutaneo
		empurado(player: @player_two, direction: @player_one.objects[:stats_basic].direction_now)
		empurado(player: @player_one, direction: @player_two.objects[:stats_basic].direction_now)
		@player_two.life_down
		@player_one.life_down
	end

	#### EU TENHO SOMBRA ####
	def shadow!
		@player_one.shadow_location
		@player_two.shadow_location
	end
	#### FIM ####

	#### EU NAO FICO VOANDO ####
	def posicao_z!
		if @player_one.objects[:animation].y < @player_two.objects[:animation].y
			@player_one.objects[:animation].z = 6
			@player_two.objects[:animation].z = 7
		else
			@player_one.objects[:animation].z = 7
			@player_two.objects[:animation].z = 6
		end
	end
	#### FIM ####

	#### POSSO ANDAR? ####
	def attack?
		@player_one.atack ##verifica se pode andar
		@player_two.atack ##verifica se pode andar
	end
	#### FIM ####

	#### POSSO ANDAR? ####
	def defend?
		@player_one.defend ##verifica se pode andar
		@player_two.defend ##verifica se pode andar
	end
	#### FIM ####

	#### ESTOU VIVO? ####
	def alives?
		@clock_dead = Time.now unless @player_one.hero_alive?
		@clock_dead = Time.now unless @player_two.hero_alive?
	end
	#### FIM ####

	#### IMPRIME VIDA ATUAL ####
	def life_now
		puts "P1: #{@player_one.objects[:stats_basic].life} P2: #{@player_two.objects[:stats_basic].life}"
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
	end
	#### FIM ####

	###### LOGICA COLISAO ######

	#### POSSO COLIDIR? ####
	def colisao?
		if collision?(@player_one.objects[:animation], [@player_two.objects[:animation]], width: 90, height: 100)
			true
		else
			false
		end
	end
	#### FIM ####

	#### MOTOR DA COLISAO ####
	def collision?(char, objects, width: 70, height: 20)
		Array(objects).any? do |object|
			horizontal_overlap(char, object, width) && vertical_overlap(char, object, height)
		end
	end
	
	def horizontal_overlap(char, object, width)
		char.x < (object.x + width) && (char.x + width) > object.x
	end

	def vertical_overlap(char, object, height)
		(char.y + height) > object.y && char.y < (object.y + height)
	end

	#### FIM DO MOTOR DA COLISAO ####

	###### FIM DA LOGICA DA COLISAO ######

	#### ESTOU VENDO MEU OPONENTE? ####
	def hero_seeing_oponent? (p1:, p2:)
		if (p1.objects[:animation].x > p2.objects[:animation].x && p1.objects[:stats_basic].direction_now == :left) ||
		(p1.objects[:animation].x < p2.objects[:animation].x && p1.objects[:stats_basic].direction_now == :right) ||
		(p1.objects[:animation].y > p2.objects[:animation].y && p1.objects[:stats_basic].direction_now == :top) ||
		(p1.objects[:animation].y < p2.objects[:animation].y && p1.objects[:stats_basic].direction_now == :bottom)
		true
		else
			false
		end
	end
	#### FIM ####
end