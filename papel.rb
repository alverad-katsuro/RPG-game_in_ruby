require 'ruby2d'
require_relative './lib/background/mountain_close.rb'
require_relative './lib/background/rocks.rb'
require_relative './lib/background/sky.rb'
require_relative './lib/background/sky_night.rb'
require_relative './lib/background/sun.rb'
require_relative './lib/background/moon.rb'
require_relative './lib/background/road.rb'
require_relative './lib/background/pause.rb'
require_relative './lib/background/tela.rb'
require_relative './lib/background/shadow.rb'
require_relative './lib/background/clouds_big.rb'
require_relative './lib/background/clouds_medium.rb'
require_relative './lib/background/cloud_small.rb'
require_relative './lib/characters/warrior.rb'
require_relative './lib/logic.rb'
require_relative './lib/logic/logic_scenery.rb'
require_relative './lib/logic/logic_text.rb'
require_relative './lib/logic/logic_player.rb'
require_relative './lib/logic/modulos/characters/stats_warrior.rb'
require_relative './lib/logic/modulos/mod_moviment.rb'
require_relative './lib/logic/modulos/mod_controls.rb'
require_relative './lib/logic/modulos/mod_heath.rb'

set(
    title: "Demo",
    resizable: true,
    background: 'black',
    width: 1280,
    height: 728,
    fullscreen: false,
    diagnostics: true
)




show