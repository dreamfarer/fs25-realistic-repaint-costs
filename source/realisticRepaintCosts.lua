--[[
    File: realisticRepaintCosts.lua
    Author: Dreamfarer
    Description: Overwrites the original 'getRepaintPrice()' function with a function that divides the repaint costs by 50.
    Year: 2025
    License: GPL-3.0
--]]

RealisticRepaintCosts = {};

--- prerequisitesPresent checks if the vehicle has the 'Wearable' specialization before loading the repaint costs code onto that vehicle.
function RealisticRepaintCosts.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Wearable, specializations);
end;

--- registerOverwrittenFunctions tells the game engine to replace the original 'getRepaintPrice()' function with our 'getRepaintPrice()' function.
function RealisticRepaintCosts.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getRepaintPrice", RealisticRepaintCosts.getRepaintPrice);
end
--- getRepaintPrice calls the original 'getRepaintPrice()' function (with superFunc) and then divides its output by 50.
function RealisticRepaintCosts:getRepaintPrice(superFunc)
    return superFunc(self) / 50; -- adjust reduction in costs here
end;