package com.monstrofil
{
    import lesta.components.Plane;
    import lesta.controls.MessageListItemRenderer;
    import lesta.dialogs.battle_window_controllers.ComplainController;
    import lesta.structs.Player;
    
    /**
     * ...
     * @author Monstrofil
     */
    public class ComplainController extends lesta.dialogs.battle_window_controllers.ComplainController
    {
        
        public function ComplainController()
        {
            super();
        
        }
        
        public override function handleAddChatMessage(param1:MessageListItemRenderer, param2:Object):void
        {
            if (param2.avatarId != 0)
            {
                var player:Player = gameInfoHolder.mapPlayers[param2.avatarId];
                var playerInfoStr:String = player.name + " (" + player.shipShortName + ")";
                param2.message = param2.message.replace(player.name, playerInfoStr);
            }
            super.handleAddChatMessage(param1, param2);
        
        }
    
    }

}