require 'ruby2d'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/moon.rb'
require_relative './lib/background/road.rb'
require_relative './lib/background/pause.rb'
require_relative './lib/background/tela.rb'
require_relative './lib/background/clouds_big.rb'
require_relative './lib/background/clouds_medium.rb'
require_relative './lib/background/cloud_small.rb'
require_relative './lib/characters/warrior.rb'
require_relative './lib/logic.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_player.rb'
require_relative './lib/logic/modulos/characters/stats_warrior.rb'
require_relative './lib/logic/modulos/mod_moviment.rb'
require_relative './lib/logic/modulos/mod_controls.rb'
require_relative './lib/logic/modulos/mod_heath.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'white',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)


#### CRIANDO CENARIO ####
scenery = Logic::Scenery.new 
scenery.add(:sun, Graphics::Sun.new)
scenery.add(:moon, Graphics::Moon.new)
scenery.add(:road, Graphics::Road.new)
scenery.add(:rocks, Graphics::Rocks.new)
scenery.add(:mountain_close, Graphics::Mountain_close.new)
scenery.add(:sky, Graphics::Sky.new)
scenery.add(:clouds_big, Graphics::CloudBig.new)
scenery.add(:clouds_med, Graphics::CloudMed.new)
scenery.add(:cloud_small, Graphics::CloudSmall.new)
scenery.add(:tela, Graphics::Tela.new)
#### FIM ####

scenery.manha!
update do
    scenery.update!
end
show