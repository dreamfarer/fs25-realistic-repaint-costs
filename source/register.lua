--[[
    File: register.lua
    Author: Dreamfarer
    Description: Adds specialization specified in the 'modDesc.xml' to the game.
    Year: 2025
    License: GPL-3.0
--]]

RegisterSpecialization = {};

function RegisterSpecialization:register()
    local xmlFile = loadXMLFile("registerSpecializationXML", Utils.getFilename("modDesc.xml", g_currentModDirectory))
    local key = "modDesc.register(0)"
    local specializationFilename = Utils.getFilename(getXMLString(xmlFile, key .. "#filename"), g_currentModDirectory)
    local specializationName = getXMLString(xmlFile, key .. "#name")
    local specializationClassName = getXMLString(xmlFile, key .. "#className")
    local requiredSpecialization   = getXMLString(xmlFile, key .. "#required")
    if g_specializationManager:getSpecializationByName(specializationName) == nil then
        g_specializationManager:addSpecialization(specializationName, specializationClassName, specializationFilename, nil)
        for vehicleType, vehicle in pairs(g_vehicleTypeManager.types) do
            if vehicle ~= nil then
                for name in pairs(vehicle.specializationsByName) do
                    if string.lower(name) == string.lower(requiredSpecialization) then
                        local specializationObject = g_specializationManager:getSpecializationObjectByName(specializationName)
                        if vehicle.specializationsByName[specializationName] == nil then
                            vehicle.specializationsByName[specializationName] = specializationObject
                            table.insert(vehicle.specializationNames, specializationName)
                            table.insert(vehicle.specializations, specializationObject)
                        end
                    end
                end
            end
        end
    end
end

RegisterSpecialization:register()
