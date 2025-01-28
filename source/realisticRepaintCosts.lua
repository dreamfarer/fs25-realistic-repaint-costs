--[[
    File: realisticRepaintCosts.lua
    Author: Dreamfarer
    Description: Overwrites the original 'getRepaintPrice()' function with a function that divides the repaint costs by 50.
    Year: 2025
    License: GPL-3.0
--]]

RealisticRepaintCosts = {};

function RealisticRepaintCosts.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Wearable, specializations);
end;

function RealisticRepaintCosts.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getRepaintPrice", RealisticRepaintCosts.getRepaintPrice);
end

function RealisticRepaintCosts:getRepaintPrice(superFunc)
    return superFunc(self) / 50; -- adjust reduction in costs here
end;