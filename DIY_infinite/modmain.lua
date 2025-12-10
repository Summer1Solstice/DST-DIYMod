local function infiniteMod(inst)
    local self1 = inst.components.finiteuses
    if self1 then
        function self1:Use(num) return true end

        if self1.total < 5 then
            self1.total = 10
        end
        self1:SetUses(self1.total)
    end
end

-- 应用到多个物品
AddPrefabPostInit("greenstaff", infiniteMod)