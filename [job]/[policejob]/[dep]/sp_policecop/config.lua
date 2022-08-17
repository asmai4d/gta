-- TriggerEvent('esx_policecop:openMenu') to open menu

Config = {
    Job = {'police'},
    Command = '', -- set to false if you dont want to have a command
    Model = 368603149,
    Model2 = 1581098148,	
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_cop_sitting@base',
        anim = 'base'
    },
    Drugs = {'lsd_pooch', 'coke_pooch', 'meth_pooch', 'weed_pooch'}, -- add all drugs here for the cop to detect
}

Strings = {
    ['not_police'] = 'You are not an officer!',
    ['menu_title'] = '👮 Teammate menu ',
    ['take_out_remove'] = 'Women',
    ['take_out_remove1'] = 'Man',	
    ['deleted_cop'] = 'Delete the teammate',
    ['spawned_cop'] = 'Call the teammate',
    ['sit_stand'] = 'Don\'t move stay here!',
    ['no_cop'] = "Tu n\'as pas de Coéquipier",
    ['cop_dead'] = 'Ton Coéquipier est mort',
    ['search_drugs'] = 'The teammate searches around him',
    ['no_drugs'] = 'Aucune drogue trouver.', 
    ['drugs_found'] = 'il y\'a de la drogue!',
    ['cop_too_far'] = 'Le Coéquipier est bien trop loin!',
    ['attack_closest'] = 'Attack nearby player'
}