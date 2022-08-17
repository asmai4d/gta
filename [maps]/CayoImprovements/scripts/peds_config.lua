Config = {}

-- The distance at which NPCs will be spawned/despawned
Config.SpawnDistance = 400

Config.Peds = {
	
----------- CAYO PERICO PEDS ----------------------
	
	-- ISLAND GUARD 1
	{
		model = 's_m_y_blackops_01',
		weapons = {
			{name = 'weapon_assaultrifle_mk2', minAmmo = 20, maxAmmo = 100}
		},
		defaultWeapon = 'weapon_assaultrifle_mk2',
		locations = {
		
			{ x = 4976.98,  y = -5606.53, z = 22.80, heading = 49.44 },	-- Island Mansion Guard Gate
			{ x = 5005.61,  y = -5752.25, z = 27.85, heading = 248.48 }	-- Island Mansion Interior Guard
			
			
		}
	},
	
	-- ISLAND GUARD 2
	{
		model = 's_m_y_blackops_02',
		animation = {
			dict = 'anim@amb@nightclub@peds@',
			name = 'amb_world_human_stand_guard_male_base'
		},
		
		weapons = {
			
			{name = 'weapon_microsmg', minAmmo = 20, maxAmmo = 100}
		},
		defaultWeapon = 'weapon_microsmg',

		locations = {
		
			{ x = 4983.67,  y = -5708.37, z = 19.00, heading = 55.57 },	-- Island Mansion Guard Gate
			{ x = 5014.0034,  y = -5755.994, z = 27.88, heading = 64.74 }	-- Island Mansion Guard Gate
			
			
		}
	},
	
-- PANTHER AT CAYO PIERCO
{
		model = 'a_c_panther',
		animation = {
			dict = 'creatures@cougar@amb@world_cougar_rest@base',
			name = 'base'
		},
		
		locations = {
		
			{ x = 4982.1074,  y = -5765.036, z = 19.94, heading = 128.0382 }	-- PANTHER AT CAYO PIERCO
			
		}
	},
	
-- EL RUBIO SITTING NEAR FIREPLACE
	{
		model = 'ig_juanstrickler',
		animation = {
			dict = 'anim@amb@office@seating@male@var_d@base@',
			name = 'idle_b',
		},
		
		locations = {
		
			{ x = 5008.0474,  y = -5754.133, z = 27.41, heading = 175.1963 }	-- EL RUBIO SITTING NEAR FIREPLACE
			
		}
	}, 
	
--- ISLAND DANCERS ---


--- Beach Dancer Female 
	{
		model = 'a_f_y_beach_01',
		animation = {
			dict = 'anim@amb@nightclub@dancers@solomun_entourage@',
			name = 'mi_dance_facedj_17_v1_female^1',
		},
		
		locations = {
		
			{ x = 4892.0171,  y = -4915.774, z = 2.40, heading = -20.3340 }	-- Young Beach Girl 1
			
		}
	},

--- Beach Dancer Male 	
	{
		model = 'a_m_y_beach_01',
		animation = {
			dict = 'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
			name = 'hi_dance_facedj_09_v2_male^2',
		},
		
		locations = {
		
			{ x = 4892.9990,  y = -4916.062, z = 2.40, heading = 67.3608 }	-- Young Beach Guy 1
			
		}
	},


-- Topless Dancer 	
{
		model = 'a_f_y_topless_01',
		animation = {
			dict = 'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
			name = 'hi_dance_facedj_11_v2_female^1',
		},
		
		locations = {
		
			{ x = 4895.0640,  y = -4916.393, z = 2.40, heading = 8.6855 }	-- Topless Girl
			
		}
	},
	
-- Male Drinking Beer 1 	
{
		model = 'a_m_y_beach_01',
		scenario = 'WORLD_HUMAN_PARTYING',
		
		locations = {
		
			{ x = 4894.72,  y = -4915.29, z = 2.40, heading = 201.51 }
			
		}
	},
	

--- Beach Dancer Female 2
{
		model = 'a_f_y_beach_01',
		animation = {
			dict = 'anim@amb@nightclub@dancers@crowddance_facedj@',
			name = 'mi_dance_facedj_13_v2_female^1',
		},
		
		locations = {
		
			{ x = 4897.1362,  y = -4913.779, z = 2.30, heading = 8.6855 }
			
		}
	},
	
-- Jetski Dancer Male 
	
{
		model = 'a_m_y_jetski_01',
		animation = {
			dict = 'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
			name = 'hi_dance_facedj_09_v1_male^2',
		},
		
		locations = {
		
			{ x = 4897.0518,  y = -4912.960, z = 2.40, heading = -160.3151 }	-- Topless Girl
			
		}
	},
	
	
-- Kerry McIntost Dancer 
	
{
		model = 'ig_kerrymcintosh',
		animation = {
			dict = 'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity',
			name = 'hi_dance_facedj_17_v2_female^3',
		},
		
		locations = {
		
			{ x = 4891.78,  y = -4912.63, z = 2.45, heading = 309.39 }
			
		}
	},
	
-- Porn Dude 
	
{
		model = 'csb_porndudes',
		animation = {
			dict = 'anim@amb@casino@mini@dance@dance_solo@female@var_b@',
			name = 'med_center',
		},
		
		locations = {
		
			{ x = 4892.4839,  y = -4912.159, z = 2.40, heading = 125.2700 }
			
		}
	},

--- Beach DJ Security With Weapons

	{
		model = 's_m_y_doorman_01',
		animation = {
			dict = 'anim@amb@nightclub@peds@',
			name = 'amb_world_human_stand_guard_male_base'
		},
		
		weapons = {
			
			{name = 'weapon_microsmg', minAmmo = 20, maxAmmo = 100}
		},
		defaultWeapon = 'weapon_microsmg',

		locations = {
		
			{ x = 4893.7612,  y = -4904.039, z = 2.48, heading = -173.3417 },
			
			
		}
	},
	
-- DJ Cayo Perico

{
		model = 'ig_ary',
		animation = {
			dict = 'anim@amb@nightclub@djs@dixon@',
			name = 'dixn_sync_cntr_b_dix',
		},
		
		locations = {
		
			{ x = 4893.5679,  y = -4905.452, z = 2.48, heading = 172.2963 }
			
		}
	},
	
-- Beach DJ Security Without Weapons

	{
		model = 's_m_m_highsec_02',
		animation = {
			dict = 'anim@amb@nightclub@peds@',
			name = 'amb_world_human_stand_guard_male_base'
		
		},

		locations = {
		
			{ x = 4895.06,  y = -4908.66, z = 2.38, heading = 188.63 },
			
			
		}
	},
	
-- Seated Beach Party Goers 

	{
		model = 'u_f_y_spyactress', --- Woman In Black Dress 
		animation = {
			dict = 'anim@amb@office@seating@female@var_a@base@',
			name = 'idle_b'
		
		},

		locations = {
		
			{ x = 4885.13,  y = -4914.28, z = 1.90, heading = 128.06 },
			
			
		}
	},
	
	{
		model = 'ig_bestmen', --- Man In Wedding Suit 
		animation = {
			dict = 'anim@amb@office@boardroom@crew@male@var_c@base@',
			name = 'base',
		
		},

		locations = {
		
			{ x = 4885.8091,  y = -4915.331, z = 1.90, heading = 107.5300 },
			
			
		}
	},
	
	--- BAR STAFF 
	
	{
		model = 's_f_y_clubbar_01', --- Cayo Perico Bar Staff 
		animation = {
			dict = 'anim@amb@clubhouse@bar@drink@base',
			name = 'idle_a',
		
		},

		locations = {
		
			{ x = 4904.8154,  y = -4941.528, z = 2.45, heading = 36.7061 },
			
			
		}
	},
	
-- PILOT AT AIRFIELD CAYO PERICO
    {
        model = 'IG_Pilot',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
			
        locations = {
    { x = 4440.37,  y = -4482.26, z = 3.27, heading = 210.34 },

        }
    },
	


}