/// @description spells
if (instance_exists(heroId)) {
    //nearest totem
    if (numTotems > 0) {
		var first = ds_list_find_value(totems, 0);
        var lowestDist = point_distance(first.x, first.y, heroId.x, heroId.y);
        nearestTotem = first;
        
        for (var i = 1; i < numTotems; i++) {
			var curr = ds_list_find_value(totems, i);
            var dist = point_distance(curr.x, curr.y, heroId.x, heroId.y);
        
            if (dist < lowestDist) {
                lowestDist = dist;
                nearestTotem = curr;
            }
        }
    }
	
    //spells
    if (summonTotem) {
        summonTotem = false;
        ttCdId.image_index = 0;
        buildingTotem = instance_create(heroId.x, heroId.y, objTotem); //totem build time has to be shorter than totem cooldown time otherwise two will be building at once
		
        if (numTotems >= maxTotems) {
            var totemToDelete = ds_list_find_value(totems, 0);
			ds_list_delete(totems, 0);
			
			with (totemToDelete.durationBar) {
				instance_destroy();
			}
			
			with (totemToDelete) {
				instance_destroy();
			}
			
            numTotems--;
        }
    } else if (summonWind) {
        summonWind = false;
        
        if (nearestTotem != -1) {
            wdCdId.image_index = 0;
            var tempX = nearestTotem.x;
            var tempY = nearestTotem.y;
            instance_create(tempX, tempY + windHeight, objWindTunnel);
            instance_create(tempX, tempY, objWindTunnel);
            
            while (tempY >= 0) {
                tempY -= windHeight;
                instance_create(tempX, tempY, objWindTunnel);
            }
        }
    } else if (summonLightning) {
        summonLightning = false;
		
		if (numTotems >= 2) {
			ltCdId.image_index = 0;
			lightningOn = true;
			var tempNumTotems;
        
	        if (numTotems == 2) {
	            tempNumTotems = 1;
	        } else {
	            tempNumTotems = numTotems;
	        }
		
			for (var i = 0; i < tempNumTotems; i++) {
				a = ds_list_find_value(totems, i);
	            b = ds_list_find_value(totems, (i + 1) % numTotems);
	            var xDiff = b.x - a.x;
	            var yDiff = -1 * (b.y - a.y);
	            var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
	            currLightningDx = xDiff * lightningWidth / hyp;
	            currLightningDy = yDiff * lightningWidth / hyp;
				var firstHbId;
				
				for (var j = 0; j < hyp / lightningWidth; j++) {
					var hbId = instance_create(a.x + j * currLightningDx, a.y - j * currLightningDy, objLightningStraight);
				
					if (j == 0) {
						firstHbId = hbId;
					}
				
					hbId.projId = firstHbId;
				}
			
				instance_create(a.x, a.y, objLightningEffect);
			}
		
	        /*ltCdId.image_index = 0;
	        var tempNumTotems;
        
	        if (numTotems == 2) {
	            tempNumTotems = 1;
	        } else {
	            tempNumTotems = numTotems;
	        }
        
	        for (var i = 0; i < tempNumTotems; i++) {
	            a = totems[i];
	            b = totems[(i + 1) % numTotems];
	            var xDiff = b.x - a.x;
	            var yDiff = -1 * (b.y - a.y);
	            var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
	            currLightningDx = xDiff * lightningWidth / hyp;
	            currLightningDy = yDiff * lightningWidth / hyp;
	            startPlace = "mid";
	            endPlace = "mid";
            
	            for (var j = 0; j < hyp / lightningWidth; j++) {
	                var rand = irandom(2);
            
	                if (endPlace == "top") {
	                    startPlace = "top";
                    
	                    if (rand == 0) {
	                        endPlace = "top";
	                    } else if (rand == 1) {
	                        endPlace = "mid";
	                    } else {
	                        endPlace = "bot";
	                    }
	                } else if (endPlace == "mid") {
	                    startPlace = "mid";
                    
	                    if (rand == 0) {
	                        endPlace = "top";
	                    } else if (rand == 1) {
	                        endPlace = "mid";
	                    } else {
	                        endPlace = "bot";
	                    }
	                } else {
	                    startPlace = "bot";
                    
	                    if (rand == 0) {
	                        endPlace = "top";
	                    } else if (rand == 1) {
	                        endPlace = "mid";
	                    } else {
	                        endPlace = "bot";
	                    }
	                }
                
	                instance_create(a.x + j * currLightningDx, a.y - j * currLightningDy, objLightning);
	            }
	        }*/
		}
    } else if (summonFire) {
        summonFire = false;
            
        if (nearestTotem != -1) {
            frCdId.image_index = 0;
            instance_create(nearestTotem.x, nearestTotem.y, objFireSpirit);
        }
    }
} else {
    instance_destroy();
}

