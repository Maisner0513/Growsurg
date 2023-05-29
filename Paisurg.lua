-- Auto Surgery 
 -- Script By Maisner 
 -- Run Script And Start Surgery

 function Wrench(x, y) 
 pkt = {} 
 pkt.type = 3 
 pkt.px = x 
 pkt.py = y 
 pkt.x = GetLocal().posX 
 pkt.y = GetLocal().posY 
 pkt.value = 32 
 SendPacketRaw (pkt) 
 end 
  
 tool = "" 
 itool = 0 
  
 function auto() 
    if tool == "Sponge" then 
       itool = 1258 
    elseif tool == "Splint" then 
       itool = 1268 
    elseif tool == "Antibiotic" then 
       itool = 1266 
    elseif tool == "Anesthetic" then 
       itool = 1262 
    elseif tool == "Scalpel" then 
       itool = 1260 
    elseif tool == "Stitches" then 
       itool = 1270 
    elseif tool == "Lab kit" then 
       itool = 4318 
    elseif tool == "Pins" then 
       itool = 4308 
    elseif tool == "Clamp" then 
       itool = 4314 
    elseif tool == "Transfusion" then 
       itool = 4310 
    elseif tool == "Ultrasound" then 
       itool = 4316 
    elseif tool == "Defibrillator" then 
       itool = 4312 
    elseif tool == "Fix it" then 
       itool = 1296 
    end 
    SendPacket(2, "action|dialog_return\ndialog_name|surgery\nbuttonClicked|tool"..itool) 
    LogToConsole("`c[`2Tools`c] `^"..tool) 
 end 
  
 function surg(var) 
 x=var.v2:match("|tilex|(%d+)") 
 y=var.v2:match("|tiley|(%d+)") 
     if var.v1:find("OnDialogRequest") and var.v2:find("end_dialog|surge|Cancel|Okay!|") then 
         SendPacket(2,"action|dialog_return\ndialog_name|surge\ntilex|"..x.."|\ntiley|"..y.."|") 
         return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("`4The patient wakes up!") and var.v2:find("tool1262") then 
       tool = "Anesthetic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("`4The patient screams and flails!") and var.v2:find("tool1262") then 
       tool = "Anesthetic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Status: `4Heart stopped!(.+)") and var.v2:find("tool4312") then 
       tool = "Defibrillator" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Status: `6Coming to(.+)") and var.v2:find("tool1262") then 
       tool = "Anesthetic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Pulse: `4(.+)") and var.v2:find("tool4310") then 
       tool = "Transfusion" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `4(%d+)(.+)") and var.v2:find("tool1266") then 
       tool = "Antibiotic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `4(%d+)(.+)") and var.v2:find("tool4318") then 
       tool = "Lab kit" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `6(%d+)(.+)") and var.v2:find("tool1266") then 
       tool = "Antibiotic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `6(%d+)(.+)") and var.v2:find("tool4318") then 
       tool = "Lab kit" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `3(%d+)(.+)") and var.v2:find("tool1266") then 
       tool = "Antibiotic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Temp: `3(%d+)(.+)") and var.v2:find("tool4318") then 
       tool = "Lab kit" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient is losing blood `4very quickly!(.+)") and var.v2:find("tool4314") then 
       tool = "Clamp" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient is losing blood `4very quickly!(.+)") and var.v2:find("tool1270") then 
       tool = "Stitches" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient is `6losing blood!(.+)") and var.v2:find("tool4314") then 
       tool = "Clamp" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient is `6losing blood!(.+)") and var.v2:find("tool1270") then 
       tool = "Stitches" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Incisions: `20(.+)") and var.v2:find("tool1296") then 
       tool = "Fix it" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Incisions: `30(.+)") and var.v2:find("tool1296") then 
       tool = "Fix it" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("The patient has not been diagnosed") and var.v2:find("tool4316") then 
       tool = "Ultrasound" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Status: `4Awake(.+)") and var.v2:find("tool1262") then 
       tool = "Anesthetic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+) broken``") and var.v2:find("tool1268") then 
       tool = "Splint" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+) broken``") and var.v2:find("tool1268") then 
       tool = "Splint" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient broke his arm.") and var.v2:find("tool1270") then 
       tool = "Stitches" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Status: `3Awake(.+)") and var.v2:find("tool1262") then 
       tool = "Anesthetic" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Pulse: `6(.+)") and var.v2:find("tool4310") then 
       tool = "Transfusion" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("`4You can't see what you are doing!(.+)") and var.v2:find("tool1258") then 
       tool = "Sponge" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("tool1296") and var.v2:find("tool1270") then 
       tool = "Stitches" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+), `6(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+), `6(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+), `6(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+), `6(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+), `4(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+), `4(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+), `4(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+), `4(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `6(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+) shattered(.+)") and var.v2:find("tool4308") then 
       tool = "Pins" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Bones: `4(.+) shattered(.+)") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient broke his leg.") and var.v2:find("tool1270") then 
       tool = "Stitches" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient is losing blood `3slowly.(.+)") and var.v2:find("tool4314") then 
       tool = "Clamp" 
       auto() 
       return true 
    elseif var.v1:find("OnDialogRequest") and var.v2:find("tool1260") then 
       tool = "Scalpel" 
       auto() 
       return true 
    end 
    return false 
 end 
 AddCallback("OnVarlist", surg)
