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

local ver = "3.0"

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Farscape2000/GOS/master/Better%20SkinChanger.lua", SCRIPT_PATH .. "Better SkinChanger.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/Farscape2000/GOS/master/Versions/Better%20Skinchanger.version", AutoUpdate)


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