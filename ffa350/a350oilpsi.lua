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

if PLANE_ICAO == "A350" then

    function set_oil_psi()
        set_array("sim/flightmodel/engine/ENGN_oil_press_psi", 0, get("1-sim/ind/eng/N3/L"))
        set_array("sim/flightmodel/engine/ENGN_oil_press_psi", 1, get("1-sim/ind/eng/N3/R"))
    end

    do_often("set_oil_psi()")

end
