-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local height = 570

local background = display.newImageRect( "background.png", 360, height )
background.x = display.contentCenterX
background.y = display.contentCenterY

local handler =display.newImageRect( "handler.png", 360, 50 )
local handler2 =display.newImageRect( "handler.png", 360, 50 )
local leftSildeHandler = display.newRect(
  display.contentCenterX - (display.contentWidth/2), display.contentCenterY, 10, display.contentHeight
)
local rightSildeHandler = display.newRect(
  display.contentCenterX + (display.contentWidth/2), display.contentCenterY, 10, display.contentHeight
)
handler.x = display.contentCenterX
handler.y = display.contentHeight

handler2.x = display.contentCenterX
handler2.y = 0


local ballon_size = 112
local ballon =display.newImageRect( "ballon2.png", ballon_size, ballon_size )
ballon.x = display.contentCenterX
ballon.y = 50
ballon.alpha = 0.7

local ball = display.newCircle( display.contentCenterX - 50, 20, 10 )
local ball2 = display.newCircle( display.contentCenterX + 50, 20, 10 )


local physics = require( "physics" )
physics.start()

physics.addBody( handler, "static" )
physics.addBody( handler2, "static" )
physics.addBody( leftSildeHandler, "static" )
physics.addBody( rightSildeHandler, "static" )

physics.addBody( ball, "dynamic", { radius=50, bounce=1 } )
physics.addBody( ball2, "dynamic", { radius=50, bounce=1 } )
physics.addBody( ballon, "dynamic", { radius=50, bounce=1 } )


local function pushBalloon()
    ballon:applyLinearImpulse( 0, -0.75, ballon.x, ballon.y )
end
 
ballon:addEventListener( "tap", pushBalloon )