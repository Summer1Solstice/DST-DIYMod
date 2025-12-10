-- 无限耐久
local function infiniteMod(inst)
    local self1 = inst.components.finiteuses
    if self1 then
        function self1:Use(num) return true end

        print("infiniteMod: ", inst.prefab)
        local uses = GLOBAL.TUNING[string.upper(inst.prefab .. "_USES")]
        if uses ~= nil and self1.total < uses then
            uses = math.ceil(uses / 2)
            print("infiniteMod: ", inst.prefab, "=", uses)
            self1.total = uses
            self1:SetUses(self1.total)
        end
        -- if self1.total < 5 then
        --     self1.total = 10
        -- end
        -- self1:SetUses(self1.total)
    end
end
-- 创建一个数组
local infiniteItems = { "greenstaff" }
-- 遍历数组
for i = 1, #infiniteItems do
    AddPrefabPostInit(infiniteItems[i], infiniteMod)
end
