/// @description spells
if (instance_exists(opId)) {
    //nearest totem
    if (numTotems > 0) {
        var lowestDist = point_distance(totems[0].x, totems[0].y, opId.x, opId.y);
        nearestTotem = totems[0];
        
        for (var i = 1; i < numTotems; i++) {
            var dist = point_distance(totems[i].x, totems[i].y, opId.x, opId.y);
        
            if (dist < lowestDist) {
                lowestDist = dist;
                nearestTotem = totems[i];
            }
        }
    }
    
    //spells
    if (summonTotem) {
        summonTotem = false;
        ttCdId.image_index = 0;
        buildingTotem = instance_create(opId.x, opId.y, objTotem); //totem build time has to be shorter than totoem cooldown time otherwise two will be building at once
        
        if (numTotems > maxTotems - 1) {
            numTotems--;
        
            with (totems[0]) {
                instance_destroy();
            }
            
            for (var i = 0; i < numTotems; i++) {
                totems[i] = totems[i + 1];
            }
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
        ltCdId.image_index = 0;
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

