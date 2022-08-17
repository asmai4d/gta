Strings = {
    ["browse_vehicles"] = "Просматривайте свои автомобили",
    ["garage_blip"] = "Гараж",
    ["store_vehicle"] = "Храните свой автомобиль",
    ["select_vehicle"] = "Выберите автомобиль",
    ["impounded"] = "%s (%s) [конфискованный]",
    ["take_out"] = "Убрать %s (%s)",
    ["already_out"] = "Автомобиль уже вышел.",
    ["not_your_vehicle"] = "Вы не являетесь владельцем данного автомобиля",
    ["no_vehicles"] = "У вас нет автомобилей, хранящихся в этом гараже.",
    ["invalid_vehicletype"] = "Вы не можете хранить данный тип автомобиля в этом гараже.",
    ["invalid_job"] = "Вы не можете хранить этот автомобиль в этом гараже.",

    ["impound_blip"] = "Конфисковоный",
    ["browse_impound"] = "Проверка конфискованных транспортных средств",
    ["no_money"] = "У вас недостаточно денег, чтобы забрать этот автомобиль.",
    ["no_impounded"] = "У вас здесь нет конфискованных автомобилей..",

    ["ping"] = "Ваш автомобиль пинговался в течение 30 секунд",

    ["browsing_takeout"] = "~INPUT_FRONTEND_RDOWN~ Привод ~h~%s~h~ [~b~%s~s~]",
    ["browsing_impounded"] = "~h~%s~h~ [~b~%s~s~] - ~r~impounded~s~",
    ["browsing_tip"] = "%s\nUse ~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_RIGHT~ для замены автомобиля\nНажмите ~INPUT_FRONTEND_RRIGHT~ прекратить просмотр",
}

-- ignore this
setmetatable(Strings, {__index = function(self, key)
    print("NO KEY", key)
    return "Error: Missing translation for \""..key.."\""
end})