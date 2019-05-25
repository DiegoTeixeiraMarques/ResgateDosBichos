local composer = require( "composer" ) 	-- importação do composer
local scene = composer.newScene()		-- criação do composer
local tempoFinal = 0
local araraAzulPontos = 0
local loboGuaraPontos = 0
local macacoAranhaPontos = 0
local oncaPintadaPontos = 0	
local guarubaPontos = 0	
local micoLeaoDouradoPontos = 0
local tartarugaOlivaPontos = 0

-- Desabilita a barra de Status
display.setStatusBar(display.HiddenStatusBar)

-- Reserve channel 1 para música de fundo
audio.reserveChannels( 1)

-- Intensidade do volume do som
audio.setVolume( 1, { channel = 1} )


-- Faz transição para o game-template.lua
local function gotoGame()
	composer.gotoScene("game-template", {time=800, effect="zoomOutInFade"})
end

-- Faz transição para o score.lua
local function gotoScore()

	-- Cria variável acessivel para outra cena
	composer.setVariable( "tempo", tempoFinal )
	composer.setVariable( "araraAzulPontos", araraAzulPontos )	
	composer.setVariable( "loboGuaraPontos", loboGuaraPontos )	
	composer.setVariable( "macacoAranhaPontos", macacoAranhaPontos )	
	composer.setVariable( "oncaPintadaPontos", oncaPintadaPontos )	
	composer.setVariable( "guarubaPontos", guarubaPontos )	
	composer.setVariable( "micoLeaoDouradoPontos", micoLeaoDouradoPontos )	
	composer.setVariable( "tartarugaOlivaPontos", tartarugaOlivaPontos )
	composer.gotoScene("score", {time=800, effect="crossFade"})
end

-- Criação da cena
function scene:create( event )

	local sceneGroup = self.view

	-- Carrega o game-template in back
	composer.loadScene( "game-template" )

	-- Tela menu
	local background = display.newImageRect( sceneGroup, "images/tela_menu.png", display.contentHeight * 1.8, display.contentWidth / 1.5)
	background.x = display.contentCenterX
    background.y = display.contentCenterY

	-- Botões menu
    local botaoJogar = display.newImageRect( sceneGroup, "images/botao_jogar.png", 477 / 2.5, 165 / 2.5)
    botaoJogar.x = display.contentCenterX - 120
	botaoJogar.y = display.contentCenterY + 65

	local botaoScores = display.newImageRect( sceneGroup, "images/botao_scores.png", 477 / 2.5, 165 / 2.5)
    botaoScores.x = display.contentCenterX + 120
	botaoScores.y = display.contentCenterY + 65

	-- Funcionalidades dos botões
	botaoJogar:addEventListener("tap", gotoGame)

	-- Funcionalidades dos botões
	botaoScores:addEventListener("tap", gotoScore)
	
end

scene:addEventListener( "create", scene )

return scene