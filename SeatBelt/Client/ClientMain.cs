using System;
using System.Threading.Tasks;
using CitizenFX.Core;
using System.Collections.Generic;
using static CitizenFX.Core.Native.API;

namespace SeatBelt.Client
{
    public class ClientMain : BaseScript
    {
        private bool _seatBeltEnabled = false;

        public ClientMain()
        {
            Debug.WriteLine("Init Seatbelt module (test version).");
            EventHandlers["onClientResourceStart"] += new Action<string>(OnClientResourceStart);

        }

        private void OnClientResourceStart(string resourceName)
        {
            if (GetCurrentResourceName() != resourceName) return;

            RegisterCommand("ToggleSeatBelt", new Action<int, List<object>, string>((source, args, raw) =>
            {
                if (Game.Player.Character.IsInVehicle() == true)
                {
                    if (_seatBeltEnabled)
                    {
                        Debug.WriteLine("Seatbelt disabled.");

                        // sound
                        // message

                        SendNuiMessage("Seatbelt disabled.");
                        _seatBeltEnabled = false;

                        SendNUIMessage()

                        // logic

                    }
                    else
                    {
                        Debug.WriteLine("Player seatbelt enabled.");

                        // sound
                        // message

                        SendNuiMessage("Player seatbelt enabled.");
                        _seatBeltEnabled=true;

                        // logic
                    }
                }
                else
                {
                    Debug.WriteLine("Player is not in vehicle.");
                    SendNuiMessage("Player is not in vehicle.");
                }
            }), false);

            RegisterKeyMapping("ToggleSeatBelt", "Enables car seatbelt", "keyboard", "j");
        }


        [Tick]
        public Task OnTick()
        {
            return Task.FromResult(0);
        }
    }
}