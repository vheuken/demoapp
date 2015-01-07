local startup = true


GPurityLuaManager:doFile("scenes/init/servercfg.lua")
GPurityLuaManager:doFile("scenes/init/eventHandler.lua")

function main()
    if startup == true then
        print("Local IP Address: " .. GPurityNetwork:getLocalAddress())
        print("Public IP Address: " .. GPurityNetwork:getPublicAddress())
        print("Port: " .. port)
        
        if isServer then
            print("Running as a server...")
            GPurityNetwork:initializeServer(port)
        else
            print("Running as a client...")
            GPurityNetwork:initializeClient()
            GPurityNetwork:setPort(port)
            GPurityNetwork:connectToServer(server)
        end
         
        startup = false
    end
	
    player = GEntityManager:getMovableEntityByName(playerName)

	if GPurityActionManager:getActionState("MOVE_LEFT") then
		moveLeft(player)
	end
	if GPurityActionManager:getActionState("MOVE_RIGHT") then
		moveRight(player)
	end
	if GPurityActionManager:getActionState("MOVE_UP") then
		jump(player)
	end
end
