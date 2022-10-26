
if (GetLocale() ~= "zhCN") then return end

LibItemStatsPatterns = {
    setprefix = "套装[：:]",
	ignore = {
        "^使用",
        "^击中时可能",
        "宠物的攻击强度",
	},
    multiple = {
        { key1 = "Healing", key2 = "SpellDamage", pattern = "%+(%d+)治疗和%+(%d+)法术伤害(.*)" },
    },
	recursive = {
        "(%+%d+.-)，(%+%d+.+)",
        "(初级速度)和(.+)",
        "^(.-)及(.+)",
        "^(.-)/(.+)",
	},
	general = {
		{ key = "Armor",  pattern = "护甲" },
		{ key = "Stamina",   pattern = "耐力" },
		{ key = "Agility",   pattern = "敏捷" },
		{ key = "Strength",   pattern = "力量" },
		{ key = "Intellect",   pattern = "智力" },
		{ key = "Spirit",   pattern = "精神" },
		{ key = "hp", pattern = "生命值$" },
		{ key = "mp", pattern = "法力值$" },
		{ key = "Resilience", pattern = "韧性等级" },		
		{ key = "Stamina|Agility|Strength|Intellect|Spirit", pattern = "所有属性" },
		{ key = "ManaRestore", pattern = "法力恢复" },
		{ key = "ManaRestore", pattern = "法力回复" },
		{ key = "ResistanceFrost", pattern = "冰霜抗性" },
		{ key = "ResistanceShadow", pattern = "暗影抗性" },
        { key = "ResistanceShadow", pattern = "暗影抗性" },
		{ key = "ResistanceArcane", pattern = "奥术抗性" },
		{ key = "ResistanceFire", pattern = "火焰抗性" },
		{ key = "ResistanceNature", pattern = "自然抗性" },
		{ key = "ResistanceHoly", pattern = "神圣抗性" },
		{ key = "ResistanceFrost|ResistanceShadow|ResistanceArcane|ResistanceFire|ResistanceNature|ResistanceHoly", pattern = "所有抗性" },
		{ key = "DamageFrost", pattern = "冰霜法术伤害" },
		{ key = "DamageShadow", pattern = "暗影法术伤害" },
		{ key = "DamageArcane", pattern = "奥术法术伤害" },
		{ key = "DamageFire", pattern = "火焰法术伤害" },
		{ key = "DamageNature", pattern = "自然法术伤害" },
		{ key = "DamageHoly", pattern = "神圣法术伤害" },
		{ key = "DamageShadow", pattern = "阴影法术伤害" },
		{ key = "DamageFrost", pattern = "冰霜伤害" },
		{ key = "DamageShadow", pattern = "暗影伤害" },
		{ key = "DamageArcane", pattern = "奥术伤害" },
		{ key = "DamageFire", pattern = "火焰伤害" },
		{ key = "DamageNature", pattern = "自然伤害" },
		{ key = "DamageHoly", pattern = "神圣伤害" },
		{ key = "SpellDamage",         pattern = "伤害法术" },
		{ key = "SpellDamage|Healing",   pattern = "法术伤害和治疗" },
		{ key = "SpellDamage|Healing",   pattern = "法术治疗和伤害" },
		{ key = "SpellDamage|Healing",         pattern = "法术能量" },
		{ key = "SpellDamage|Healing",         pattern = "法术伤害" },
		{ key = "SpellStrike",       pattern = "法术穿透" },
		{ key = "SpellHitRating",     pattern = "法术命中等级" },
		{ key = "SpellCrit", pattern = "法术爆击等级" },
		{ key = "Healing", pattern = "法术治疗" },
		{ key = "Healing", pattern = "治疗法术" },
		{ key = "Healing",     pattern = "治疗" },
		{ key = "Dodge", pattern = "躲闪等级" },
		{ key = "Parry", pattern = "招架等级" },
		{ key = "Defense", pattern = "防御等级" },
		{ key = "HitRating", pattern = "命中等级" },
		{ key = "RangedAttackPower", pattern = "远程攻击强度" },		
		{ key = "AttackCrit|RangedAttackCrit", pattern = "爆击等级" },		
		{ key = "AttackPower|RangedAttackPower", pattern = "攻击强度" },
		{ key = "Block", pattern = "格挡等级" },
	},
	extra = {
		{ key = "Armor", pattern = "(%d+)点护甲$" },
		{ key = "Block", pattern = "(%d+)格挡$" },
		{ key = "ManaRestore", pattern = "每5秒恢复(%d+)点法力" },
		{ key = "ManaRestore", pattern = "每5秒法力回复%+(%d+)" },
		{ key = "Resilience", pattern = "韧性等级提高(%d+)" },
        { key = "Resilience", pattern = "提高(%d+)点韧性" },
		{ key = "SpellHitRating", pattern = "法术命中等级提高(%d+)" },
        { key = "SpellHitRating", pattern = "提高(%d+)点法术命中" },
		{ key = "HasteSpell", pattern = "法术急速等级提高(%d+)" },
		{ key = "SpellCrit", pattern = "法术爆击等级(%d+)" },
        { key = "SpellCrit", pattern = "提高(%d+)点法术爆击" },
		{ key = "SpellStrike", pattern = "法术穿透提高(%d+)" },		
		{ key = "SpellDamage|Healing", pattern = "所有法术和魔法效果所造成的伤害和治疗效果，最多(%d+)", },
		{ key = "SpellDamage|Healing", pattern = "使法术和魔法效果的治疗和伤害提高最多(%d+)", },
		{ key = "Healing", extra = 0.33, pattern = "使法术治疗提高最多(%d+)", },
		{ key = "DamageFrost", pattern = "冰霜法术和效果所造成的伤害，最多(%d+)" },
		{ key = "DamageShadow", pattern = "暗影法术和效果所造成的伤害，最多(%d+)" },
		{ key = "DamageArcane", pattern = "奥术法术和效果所造成的伤害，最多(%d+)" },
		{ key = "DamageFire", pattern = "火焰法术和效果所造成的伤害，最多(%d+)" },
		{ key = "DamageNature", pattern = "自然法术和效果所造成的伤害，最多(%d+)" },
		{ key = "DamageHoly", pattern = "神圣法术和效果所造成的伤害，最多(%d+)" },
		{ key = "HasteMelee", pattern = "急速等级提高(%d+)" },
		{ key = "RangedAttackPower", pattern = "远程攻击强度提高(%d+)" },		
		{ key = "AttackCrit|RangedAttackCrit", pattern = "爆击等级提高(%d+)" },		
		{ key = "AttackPower|RangedAttackPower", pattern = "攻击强度提高(%d+)" },
		{ key = "HitRating", pattern = "命中等级提高(%d+)" },
		{ key = "Parry", pattern = "招架等级提高(%d+)" },
		{ key = "Defense", pattern = "防御等级提高(%d+)" },
		{ key = "Dodge", pattern = "躲闪等级提高(%d+)" },
		{ key = "Block", pattern = "盾牌格挡值提高(%d+)" },
		{ key = "Block", pattern = "格挡等级提高(%d+)" },
		{ key = "Block", pattern = "盾牌格挡等级(%d+)" },
		{ key = "ReduceResistance", pattern = "使你的法术目标的魔法抗性降低(%d+)点。" },
		{ key = "SpellHitRating", pattern = "提高法术命中等级(%d+)" },
		{ key = "SpellCrit", pattern = "提高法术爆击等级(%d+)" },
		{ key = "RangedAttackPower", pattern = "提高远程攻击强度(%d+)" },		
		{ key = "AttackCrit|RangedAttackCrit", pattern = "提高爆击等级(%d+)" },		
		{ key = "AttackPower|RangedAttackPower", pattern = "提高攻击强度(%d+)" },
		{ key = "HitRating", pattern = "提高命中等级(%d+)" },
		{ key = "Parry", pattern = "提高招架等级(%d+)" },
		{ key = "Defense", pattern = "提高防御等级(%d+)" },
		{ key = "Dodge", pattern = "提高躲闪等级(%d+)" },
	},
    percent = {
		{ key = "SpellDamage", baseon = "Intellect", pattern = "法术伤害加成提高,数值最多相当于你的智力总值的(%d+)%%" },
	},
	special = {
		{ key = "DamageShadow|DamageFrost", value = 54, pattern = "灵魂冰霜$" },
		{ key = "DamageFire|DamageArcane", value = 50, pattern = "烈日火焰$" },
		{ key = "ResistanceComa", value = 5, pattern = "昏迷抗性" },
		{ key = "ManaRestore|HealthRestore", value = 4, pattern = "活力$" },
		{ key = "AttackPower|RangedAttackPower", value = 70, pattern = "野蛮$" },		
		{ key = "MountSpeed", value = 4, pattern = "秘银马刺" },
		{ key = "MountSpeed", value = 2, pattern = "坐骑移动速度略微提升" },
		{ key = "MountSpeed", value = 10, pattern = "坐骑速度提高10%%" },
		{ key = "MountSpeed", value = 3, pattern = "坐骑速度提高3%%" },
		{ key = "RunSpeed", value = 8, pattern = "略微提高移动速度" },
		{ key = "RunSpeed", value = 8, pattern = "略微提高奔跑速度" },
		{ key = "RunSpeed", value = 8, pattern = "移动速度略微提升" },
		{ key = "RunSpeed", value = 8, pattern = "初级速度" },		
		{ key = "SpellDamage|Healing", value = 42, pattern = "超强巫师之油" },
		{ key = "SpellDamage|Healing", value = 16, pattern = "次级巫师之油" },
		{ key = "SpellDamage|Healing", value = 8, pattern = "初级巫师之油" },
		{ key = "SpellDamage|Healing", value = 24, pattern = "巫师之油" },
		{ key = "ManaRestore", value = 14, pattern = "超强法力之油" },
		{ key = "ManaRestore", value = 12, continue = true, pattern = "卓越法力之油" },
		{ key = "Healing", value = 24, continue = true, pattern = "卓越法力之油" },
	},
    buff = {
		convert = {
			{ from = "并", to = "," },
			{ from = "点和", to = "点," },
		},		
		{ key = "Armor", pattern = "护甲值提高(%d+)",},
        { key = "Armor", pattern = "护甲提高(%d+)",},
		{ key = "Stamina", pattern = "耐力提高(%d+)",},
		{ key = "Spirit", pattern = "提高精神(%d+)",},
		{ key = "ResistanceShadow", pattern = "暗影抗性提高(%d+)",},
		{ key = "Intellect", pattern = "智力提高(%d+)",},
		{ key = "ResistanceFrost", pattern = "冰霜抗性提高(%d+)",},	
		{ key = "Stamina|Agility|Strength|Intellect|Spirit", pattern = "所有属性提高(%d+)点",},
		{ key = "ResistanceFrost|ResistanceShadow|ResistanceArcane|ResistanceFire|ResistanceNature|ResistanceHoly", pattern = "所有抗性提高(%d+)点", conflict = true },
		{ key = "ManaRestore", pattern = "每5秒恢复(%d+)点法力",},
		{ key = "HealthRestore", pattern = "每5秒恢复(%d+)点生命",},
		{ key = "Stamina|Agility|Strength|Intellect|Spirit", percent = true, pattern = "所有属性提高(%d+)%%",},
		{ key = "SpellCrit", percent = true, pattern = "法术爆击几率提高(%d+)%%",},
		{ key = "Dodge", percent = true, pattern = "闪躲几率提高(%d+)%%",},
		{ key = "AttackPower", pattern = "近战攻击强度提高(%d+)",},
		{ key = "hp", pattern = "生命力上限提高(%d+)",},
		{ key = "hp", pattern = "生命力提高(%d+)",},
		{ key = "ResistanceFrost|ResistanceShadow|ResistanceArcane|ResistanceFire|ResistanceNature|ResistanceHoly", pattern = "对所有系别的魔法抗性提高(%d+)",},
		{ key = "SpellDamage", pattern = "提高法术伤害加成(%d+)",},
		{ key = "RangedAttackPower", pattern = "远程攻击强度提高(%d+)",},
		{ key = "AttackPower|RangedAttackPower", pattern = "提高攻击强度(%d+)",},
		{ key = "ResistanceNature", pattern = "自然抗性提高(%d+)",},
		{ key = "Stamina", pattern = "耐力%+(%d+)",},
		{ key = "Defense", pattern = "生命力提高(%d+)",},
		{ key = "Healing", pattern = "治疗效果提高(%d+)",},
		{ key = "Healing", pattern = "治疗效果提高(%d+)",},
		{ key = "Agility", pattern = "敏捷提高(%d+)",},
		{ key = "Strength", pattern = "力量提高(%d+)",},
		{ key = "Spirit", pattern = "精神提高(%d+)",},
		{ key = "Intellect|Spirit", pattern = "智力和精神提高(%d+)",},
		{ key = "SpellDamage", pattern = "法术伤害和治疗效果提高最多(%d+)",},
		{ key = "SpellCrit", pattern = "法术爆击等级提高(%d+)",},		
		{ key = "AttackCrit|RangedAttackCrit", pattern = "爆击提高(%d+)",},
		{ key = "SpellDamage", pattern = "法术伤害提高(%d+)",},
		{ key = "SpellDamage", pattern = "法术伤害提高最多(%d+)",},
		{ key = "DamageShadow", baseon = "SpellDamage", percent = true, pattern = "造成的暗影伤害提高(%d+)%%",}, --@todo(法伤+额外暗伤)*系数
		{ key = "ArmorReduce2", pattern = "受到物理攻击时承受的伤害降低(%d+)%%",},	
	},
}

LibItemStatsLocale = {
    Strength = "力量",
    Agility  = "敏捷",
    Stamina = "耐力",
    Intellect = "智力",
    Spirit = "精神",
    Armor = "护甲",
    Resilience = "韧性",
    Defense = "防御技能",
    Dodge = "躲闪几率",
    Parry = "招架几率",
    Block = "格挡几率",
    ResistanceNature = "自然抗性",
    ResistanceFire = "火焰抗性",
    ResistanceArcane = "奥术抗性",
    ResistanceShadow = "暗影抗性",
    ResistanceFrost = "冰霜抗性",
    ResistanceHoly = "神圣抗性",
    ResistanceComa = "昏迷抵抗",
    DamageNature = "自然伤害",
    DamageFire = "火焰伤害",
    DamageArcane = "奥术伤害",
    DamageShadow = "暗影伤害",
    DamageFrost = "冰霜伤害",
    DamageHoly = "神圣伤害",
    HitRating = "物理命中",
    AttackDamage = "近战伤害",
    AttackSpeed = "近战速度",
    AttackPower = "近战强度",
    AttackCrit = "近战爆击",
    HasteMelee = "加速等级",
    RangedAttackDamage = "远程伤害",
    RangedAttackSpeed = "远程速度",
    RangedAttackPower = "远程强度",
    RangedAttackCrit = "远程爆击",
    HasteRanged = "远程加速等级",
    HasteSpell = "法术加速",
    SpellDamage = "法术伤害",
    Healing = "治疗加成",
    SpellHitRating = "法术命中",
    SpellCrit = "法术爆击",
    SpellStrike = "法术穿透",
    ManaRestore = "战斗回蓝",
    HealthRestore = "生命力回复",
    RunSpeed = "移动速度",
    MountSpeed = "坐骑速度",
    Talent = "天赋",
    Suit = "套装",
    Attribute = "属性",
    Resistance = "抗性",
    Attack = "近战&远程",
    Spell = "法术",
    Health = "生命&法力",
    ReduceResistance = "降低抗性",
    HP = "生命值",
    MP = "法力值",
    ArmorReduce = "物理免伤",
}
