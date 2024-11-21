local AutoEquipBag = LibStub("AceAddon-3.0"):NewAddon("AutoEquipBag", "AceEvent-3.0")

function AutoEquipBag:OnInitialize()
    self:RegisterEvent("BAG_UPDATE_DELAYED")
end

function AutoEquipBag:BAG_UPDATE_DELAYED()
    -- Check for a free bag slot
    for bagID = 0, NUM_BAG_SLOTS do
        if C_Container.GetContainerNumSlots(bagID) == 0 then

            -- Now, let's find a suitable bag in our inventory
            for bag = 0, NUM_BAG_SLOTS do
                for slot = 1, C_Container.GetContainerNumSlots(bag) do
                    local itemInfo = C_Container.GetContainerItemInfo(bag, slot)
                    if itemInfo then
                        local equipType = C_Item.GetItemInventoryTypeByID(itemInfo.itemID)
                        -- Check if the item is a bag and not already equipped
                        if equipType == 18 then
                            -- Found a bag to equip!
                            C_Container.UseContainerItem(bag, slot)
                            print("Equipped a bag!")
                            return
                        end
                    end
                end
            end
        end
    end
end


