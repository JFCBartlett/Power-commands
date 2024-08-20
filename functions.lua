function Notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

local PowerValue = 1.0

function MorePower(source, args)
	if args[1]then
		--first thing input turned from str to int
		local Value = tonumber(args[1])

	-- if it is an int make powervalue that
		if Value then
			PowerValue = Value*1.0
			Notify("Power Multiplied by ".. tostring(Value))
		-- if not say it isnt a num
		else
			Notify("Value is not a number")
		end
	else
		Notify("Power being defaulted to 1")
		PowerValue = 1.0
	end
end

Citizen.CreateThread(function()
	while true do
		--get player who called function
		local PlayerPed = GetPlayerPed(-1)
		--get car they are in
		local Vehicle = GetVehiclePedIsIn(PlayerPed, true)

		--apply power mult
		if Vehicle and IsPedInAnyVehicle(PlayerPed, true) then
			--set the power mult to powervalue
			SetVehicleCheatPowerIncrease(Vehicle, PowerValue)
		end

		--Wait for next frame
		Citizen.Wait(0)
	end
end)