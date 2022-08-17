-- TriggerEvent('esx_familliesdog:openMenu') to open menu

Config = {
    Job3 = {'famillies'},
    Command = 'famillieschien', -- set to false if you dont want to have a command
    Model = -1788665315,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'bagofdope', 'coke_pooch', 'meth_pooch', 'crack_pooch'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = 'You are ~r~not ~s~ a famillies!',
    ['menu_title'] = '🐶 Famillies Dog',
    ['take_out_remove'] = 'Take it out / Put it in the niche',
    ['deleted_dog'] = 'Send the dog back',
    ['spawned_dog'] = 'Call the dog',
    ['sit_stand'] = 'Don\'t move stay here!',
    ['no_dog'] = "You don\'t have a dog",
    ['dog_dead'] = 'Your dog is dead',
    ['search_drugs'] = 'The dog is looking around',
    ['no_drugs'] = 'No drugs find.', 
    ['drugs_found'] = 'Woof woof! drug!',
    ['dog_too_far'] = 'The dog is far too far!',
    ['attack_closest'] = 'Attack nearby player',
    ['small'] = '🚑 Bandaging the dog'
}