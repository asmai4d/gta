-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = {'police', 'sheriff'},
    Command = '', -- set to false if you dont want to have a command
    Model = 351016938,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'lsd_pooch', 'coke_pooch', 'meth_pooch', 'weed_pooch'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = 'Вы не офицер!!',
    ['menu_title'] = '🐶 Полицейский Пёс',
    ['take_out_remove'] = 'Позвать / Отозвать',
    ['deleted_dog'] = 'Отогнать',
    ['spawned_dog'] = 'Позвать собаку',
    ['sit_stand'] = 'Рядом',
    ['no_dog'] = "У тебя нет собаки",
    ['dog_dead'] = 'Ваша собака мертва',
    ['search_drugs'] = 'Следить',
    ['no_drugs'] = 'Никаких наркотиков не найти.', 
    ['drugs_found'] = 'Помощь!',
    ['dog_too_far'] = 'Собака слишком далеко!',
    ['attack_closest'] = 'Фас'
}