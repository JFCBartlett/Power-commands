local PowerValue = 1

function MorePower(source, args)
	--first thing input turned from str to int
	local Value = tonumber(args[1])

	-- if it is an int make powervalue that
	if Value then
		PowerValue = Value
		Notify("Power Multiplied by".. args[1])
	-- if not say it isnt a num
	else
		Notify("Value is not a number")
	end
end

Citizen.CreateThread(function()
	while true do
		--get player who called function
		local PlayerPed = GetPlayerPed(-1)
		--get car they are in
		local Vehicle = GetVehiclePedIsIn(PlayerPed, false)

		--apply power mult
		if Vehicle and IsPedInAnyVehicle(PlayerPed, false) then
			--set the power mult to powervalue
			SetVehicleCheatPowerIncrease(Vehicle, PowerValue)
		end

		--Wait for next frame
		Citizen.Wait(0)
	end
end)


function Notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end