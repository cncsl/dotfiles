local M = {}

function M.init(config)
	spoon.ModalMgr:new("systemControl")
	local cmodal = spoon.ModalMgr.modal_list["systemControl"]
	cmodal:bind("", "escape", "Deactivate system control", function()
		spoon.ModalMgr:deactivate({ "systemControl" })
	end)
	cmodal:bind("", "q", "Deactivate system control", function()
		spoon.ModalMgr:deactivate({ "systemControl" })
	end)
	cmodal:bind("", "tab", "Toggle Cheatsheet", function()
		spoon.ModalMgr:toggleCheatsheet()
	end)

	-- volume control
	cmodal:bind("", "=", "Volume Up", function()
		local audio = hs.audiodevice.defaultOutputDevice()
		audio:setVolume(math.min(100, audio:volume() + 5))
	end)
	cmodal:bind("", "-", "Volume down", function()
		local audio = hs.audiodevice.defaultOutputDevice()
		audio:setVolume(math.max(0, audio:volume() - 5))
	end)
	cmodal:bind("", "0", "Change mutedness status", function()
		local audio = hs.audiodevice.defaultOutputDevice()
		audio:setOutputMuted(not audio:outputMuted())
	end)

	-- 
	cmodal:bind("", "]", "Next", function()
		hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
		hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
	end)
	cmodal:bind("", "[", "Previous", function()
		hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
		hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
	end)
	cmodal:bind("", "p", "Play/Pause", function()
		hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
		hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
	end)


	-- Register windowManage with modal supervisor
	spoon.ModalMgr.supervisor:bind(config.hyper, "s", "Enter System Control Modal", function()
		-- Deactivate some modal environments or not before activating a new one
		spoon.ModalMgr:deactivateAll()
		-- Show an status indicator so we know we're in some modal environment now
		spoon.ModalMgr:activate({ "systemControl" }, "#C0C0C0")
	end)
end

return M
