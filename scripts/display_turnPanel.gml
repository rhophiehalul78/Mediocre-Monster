///display_turnPanel()
turnPanelQueue = ds_priority_create();
ds_priority_copy(turnPanelQueue, turnOrder);

var turnPanelPositionX = 400;
var turnPanelPositionY = 0;
var loopCount = 0;

// delete turn panel display
for(i=0; i<=2; i++)
{
    with (monster[i].turnPanel)
    {
        instance_destroy();
    }
    with (hero[i].turnPanel)
    {
        instance_destroy();
    }
}

// display turn panel display showing updated positions
while(!ds_priority_empty(turnPanelQueue))
{    
    panelObject = ds_priority_delete_max(turnPanelQueue);
    with(panelObject)
    {
        if(loopCount == 0)
        {
            instance_create(turnPanelPositionX + (loopCount * 26), turnPanelPositionY + 18, turnPanel);                   
        }
        else
        {
            instance_create(turnPanelPositionX + (loopCount * 26), turnPanelPositionY, turnPanel);                     
        }        
    }  
    loopCount++;  
}
ds_priority_destroy(turnPanelQueue);
