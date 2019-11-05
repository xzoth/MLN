---
--- Generated by MLN Team (http://www.immomo.com)
--- Created by MLN Team.
--- DateTime: 2019-09-05 12:05
---

local _class = {
    _name = 'TabToolBar',
    _version = '1.0'
}

---@public
function _class:new()
    local o = {}
    setmetatable(o, {__index = self})
    return o
end

---@public
function _class:setupItems(normalImages, selectImages, callback)
    self.clickCallback = callback
    self:createBarButtonItems(normalImages, selectImages)
end

---@private
function _class:createBarButtonItems(normalImages, selectImages)
    if normalImages:size() ~= selectImages:size() then
        return
    end
    self.normalImages = normalImages
    self.selectImages = selectImages
    local itemCount = normalImages:size()

    local tabToolBarHeight = 60
    local info = System:deviceInfo()
    if System:iOS() and ((string.len(info) > 9 and info > "iPhone10,5") or info == "iPhone10,3") then
        tabToolBarHeight = tabToolBarHeight + 34 --适配iPhoneX及以上机型
    end

    local barItemHeight = 30
    local barItemWidth = 30
    local barItemSpacing = (window:width() - barItemWidth * itemCount) / (itemCount + 1)

    self.contentView = View():bgColor(Color(255,255,255,1)):width(MeasurementType.MATCH_PARENT):height(tabToolBarHeight):marginBottom(0):setGravity(Gravity.BOTTOM)
    self.tabToolBar = LinearLayout(LinearType.HORIZONTAL)
    self.tabToolBar:bgColor(Color(255,255,255,1)):width(MeasurementType.MATCH_PARENT):height(tabToolBarHeight):marginBottom(0):setGravity(Gravity.BOTTOM)

    for i = 1, itemCount do
        local barItem = ImageView():marginLeft(barItemSpacing):marginTop(10):width(barItemWidth):height(barItemHeight)
        barItem:onClick(function()
            self:updateBarItemImages(barItem, i)
            self.clickCallback(i)
        end)
        if i == 1 then
            self.preBarItem = barItem
            self.preIndex = 1
            barItem:image(selectImages:get(1))
        else
            barItem:image(normalImages:get(i))
        end
        self.tabToolBar:addView(barItem)
    end

    self.contentView:addView(self.tabToolBar)
end

function _class:updateBarItemImages(barItem, index)
    if index == self.preIndex then
        return --点击同一个barItem不更新image
    end
    self.preBarItem:image(self.normalImages:get(self.preIndex))
    barItem:image(self.selectImages:get(index))
    self.preBarItem = barItem
    self.preIndex = index
end

return _class