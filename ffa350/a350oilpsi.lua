-- Filename: a350oilpsu.lua
-- Version: 0.1
-- Author: Samuel Ribas
-- Copyright: 2023
-- ----------------------------------------------------------------------------------
-- Fix Engine Oil PSI indicator for FF A350 on XP12
-- It is still a working in progress. I still researching to find a formula that
-- does calculate the oil pressure properly. At this moment the values are obtained
-- from both engine N3
-- ----------------------------------------------------------------------------------
if PLANE_ICAO == "A359" then

    function set_oil_psi()

        local left_psi = 0
        local right_psi = 0

        DataRef( "engine_n3_left", "1-sim/ind/eng/N3/L" )
        DataRef( "engine_n3_right", "1-sim/ind/eng/N3/R")

        if engine_n3_left > 0 then
            left_psi = math.floor((engine_n3_left / 0.62)/3)
        end

        if engine_n3_right > 0 then
            right_psi = math.floor((engine_n3_right / 0.62)/3)
        end
        
        set_array("sim/flightmodel/engine/ENGN_oil_press_psi", 0, left_psi)
        set_array("sim/flightmodel/engine/ENGN_oil_press_psi", 1, right_psi)
    end

    do_every_frame("set_oil_psi()")

end
