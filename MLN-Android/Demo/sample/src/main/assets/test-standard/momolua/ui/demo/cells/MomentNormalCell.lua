---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by David.
--- DateTime: 2018/5/14 下午12:28
---
local _class = {}
_class._version = '1.0'
_class._classname = 'MomentNormalcell'

function MomentNormalcell()
    return _class
end

function _class:onCreate(cell, item)
    local width=cell.contentView:width()
    local height=cell.contentView:height()
    cell.bgImage = ImageView():marginTop(height/2-height/4):marginLeft(width/2-width/4):width(width/2):height(height/2)
    --cell.bgImage:lazyLoad(false)
    cell.bgImage:contentMode(ContentMode.SCALE_TO_FILL)
    cell.contentView:cornerRadius(8)

    cell.titleLabel = Label():width(MeasurementType.MATCH_PARENT):height(MeasurementType.MATCH_PARENT)
    cell.titleLabel:textColor(Color(0,0,0,1))
    cell.titleLabel:fontSize(14)
    cell.contentView:bgColor(Color(255,0,0,0.5))
    cell.titleLabel:height(30):x(20):y(50)
    --cell.titleLabel:setMatchParent(true)
    --cell.bgImage:setMatchParent(true)
    cell.contentView:addView(cell.bgImage):addView(cell.titleLabel)
    --cell.contentView:flexChildren({cell.bgImage, cell.titleLabel})

end

function _class:onLayout(cell, item)
    cell.bgImage:image(item.iconName)
    cell.titleLabel:text(item.title)
end

return _class