local composer = require( "composer" ) 	-- importação do composer
local scene = composer.newScene()		-- criação do composer

local function gotoMenu()
	composer.gotoScene("menu", {time=800, effect="crossFade"})
end

-- Criação da cena
function scene:create( event )

    local sceneGroup = self.view


	-- Tela menu
	local background = display.newImageRect( sceneGroup, "images/tela_score.png", display.contentHeight * 1.8, display.contentWidth / 1.5)
	background.x = display.contentCenterX
    background.y = display.contentCenterY

    local botaoVoltar = display.newImageRect( sceneGroup, "images/botao_voltar.png",  477 / 2.5, 165 / 2.5)
	botaoVoltar.x = display.contentCenterX
    botaoVoltar.y = display.contentCenterY + 95
    
    -- Funcionalidades dos botões
	botaoVoltar:addEventListener("tap", gotoMenu)

    local tempoFinal = composer.getVariable( "tempo" )
    local araraAzulPontos = composer.getVariable( "araraAzulPontos" )	
    local loboGuaraPontos = composer.getVariable( "loboGuaraPontos" )	
    local macacoAranhaPontos = composer.getVariable( "macacoAranhaPontos")	
    local oncaPintadaPontos = composer.getVariable( "oncaPintadaPontos" )	
    local guarubaPontos = composer.getVariable( "guarubaPontos" )	
    local micoLeaoDouradoPontos = composer.getVariable( "micoLeaoDouradoPontos" )	
    local tartarugaOlivaPontos = composer.getVariable( "tartarugaOlivaPontos" )

    local score = tempoFinal + araraAzulPontos + loboGuaraPontos + macacoAranhaPontos + oncaPintadaPontos + guarubaPontos + micoLeaoDouradoPontos + tartarugaOlivaPontos 
    
    local scoreText = display.newText(score, display.contentCenterX + 80, display.contentCenterY - 115, "Mario-Kart-DS", 36)
    local guarubaText = display.newText(guarubaPontos, display.contentCenterX - 240, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local araraAzulText = display.newText(araraAzulPontos, display.contentCenterX - 155, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local oncaPintadaText = display.newText(oncaPintadaPontos, display.contentCenterX - 85, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local MacacoAranhaText = display.newText(macacoAranhaPontos, display.contentCenterX - 15, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local loboGuaraText = display.newText(loboGuaraPontos, display.contentCenterX + 55, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local tartarugaOlivaText = display.newText(tartarugaOlivaPontos, display.contentCenterX + 125, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local micoLeaoDouradoText = display.newText(micoLeaoDouradoPontos, display.contentCenterX + 190, display.contentCenterY + 25, "Mario-Kart-DS", 36)
    local tempoText = display.newText(tempoFinal, display.contentCenterX + 250, display.contentCenterY + 25, "Mario-Kart-DS", 36)

    sceneGroup:insert (scoreText)
    sceneGroup:insert (guarubaText)
    sceneGroup:insert (araraAzulText)
    sceneGroup:insert (oncaPintadaText)
    sceneGroup:insert (MacacoAranhaText)
    sceneGroup:insert (loboGuaraText)
    sceneGroup:insert (tartarugaOlivaText)
    sceneGroup:insert (micoLeaoDouradoText)
    sceneGroup:insert (tempoText)
	
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene("score")												-- Remove a cena do jogo
	end
end

-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    print("destruido")
    display.remove (scoreText)
	--composer.removeScene("score")		

end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene