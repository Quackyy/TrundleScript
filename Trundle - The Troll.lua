function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Quackyy/TrundleScript/master/Trundle%20-%20The%20Troll.lua", SCRIPT_PATH .. "Trundle - The Troll.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end
GetWebResultAsync("https://raw.githubusercontent.com/Quackyy/TrundleScript/master/Trundle%20-%20The%20Troll.version", AutoUpdate)

  if Mode() == "Combo" then 
    if TrundleMenu.Gapclose.GCW:Value() and Ready(_W) and ValidTarget(target, 1000) then
      if GetDistance(myHero, target) > 340 and GetDistance(myHero, target) < 1000 and GetDistance(movePos) > GetDistance(target) then
        CastSkillShot(_W, target)
      end 
    end
  
    if TrundleMenu.Gapclose.GCE:Value() and Ready(_E) and ValidTarget(target, 1000) then
      if GetDistance(myHero, target) > 360 and GetDistance(myHero, Target) < 800 and GetDistance(movePos) > GetDistance(target) then
        local EPredE = GetCircularAOEPrediction(target, EStats)
        CastSkillShot(_E, EPredE.castPos)
      end
    end   
  end 
end)

GetWebResultAsync("https://raw.githubusercontent.com/Farscape2000/GOS/master/Versions/Better%20Skinchanger.version", AutoUpdate)

if GetObjectName(myHero) ~= "Trundle" then return end
OnProcessSpellComplete(function(unit, spell)
  if unit == myHero and spell.name:lower():find("attack") and IOW and IOW:Mode() == "Combo" then
    if IsReady(_Q) then
      CastSpell(_Q)
      return
    end
    if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) then
       CastSpell(GetItemSlot(myHero, 3077))
       return
    end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) then
       CastSpell(GetItemSlot(myHero, 3074))
       return
    end
   if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) then
       CastSpell(GetItemSlot(myHero, 3748))
       return
    end
  end
end)

skinMeta       = 
{
    ["Trundle"] = {"Classic", "Lil' Slugger", "Junkyard", "Traditional", "Constable"},
}
local Menu = MenuConfig(myHero.charName, myHero.charName.." Skin Changer")
Menu:SubMenu("misc", "Misc Settings")
Menu.misc:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], 
    function(model)
        HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") 
    end,
true)

print("Enjoy Your Free Skins ~Scortch")
