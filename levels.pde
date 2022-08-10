void setupLevel_1() {
    /*level1.add(new Block(800, 200, 200, 200, "static-2x2"));
    level1.add(new Block(200, 200, 200, 200, "static-2x2"));
    level1.add(new Block(400, 300, 200, 100, "moving-horizontal-2x1", 400, 600, 5));*/

    /*WALLS*/
    for (int i = 0; i < numWalls; i++) {
        level1.add(new Block(0+(i*400), -400, 400, 400, "static-4x4")); //Width
        level1.add(new Block(-400, -400+(i*400), 400, 400, "static-4x4")); //Height
        level1.add(new Block(-400+(i*400), (numWalls-1)*400, 400, 400, "static-4x4")); //Height
        level1.add(new Block((numWalls-1)*400, -400+(i*400), 400, 400, "static-4x4")); //Width
    }
    level1.add(new Block(4800, 4800, 400, 400, "static-4x4"));

    /*TOP CRUMBLING AREA*/
    for (int i = 0; i < 10; i++) {
        level1.add(new Block(0+(i*200), 400, 200, 200, "static-2x2"));
        level1.add(new Block(2000+(i*200), 400, 200, 100, "static-2x1"));
    }

    level1.add(new Block(4000, 400, 100, 100, "static-1x1"));
    level1.add(new Block(4120, 400, 100, 100, "static-1x1"));
    level1.add(new Block(4300, 400, 100, 100, "static-1x1"));
    level1.add(new Block(4500, 400, 100, 100, "static-1x1"));
    level1.add(new Block(3800, 500, 200, 100, "static-2x1"));

    /*LEFT WALL FOR DROP*/
    for (int i = 0; i < 19; i++) {
        level1.add(new Block(3800, 600+(i*200), 200, 200, "static-2x2"));
    }

    /*CRUMBLED BLOCKS AT BOTTOM OF DROP*/
    level1.add(new Block(4700, 4700, 100, 100, "static-1x1"));
    level1.add(new Block(4600, 4700, 100, 100, "static-1x1"));
    level1.add(new Block(4600, 4600, 100, 100, "static-1x1"));
    level1.add(new Block(4500, 4700, 100, 100, "static-1x1"));
    level1.add(new Block(4500, 4600, 100, 100, "static-1x1"));
    level1.add(new Block(4500, 4500, 100, 100, "static-1x1"));
    level1.add(new Block(4200, 4700, 200, 100, "static-1x1x2"));

    /*AREA TO ACID RIGHT*/
    level1.add(new Block(3400, 4600, 200, 200, "static-2x2"));
    level1.add(new Block(3200, 4600, 200, 200, "static-2x2"));
    level1.add(new Block(3200, 4400, 200, 200, "static-2x2"));
    level1.add(new Block(2830, 4400, 70, 160, "solid-pipe"));

    /*AREA TO ACID LEFT*/
    level1.add(new Block(1600, 4600, 200, 200, "static-2x2"));
    level1.add(new Block(1800, 4600, 200, 200, "static-2x2"));
    level1.add(new Block(1800, 4400, 200, 200, "static-2x2"));
    level1.add(new Block(2000, 4400, 70, 160, "solid-pipe-flipped"));

    /*BLOCK OVER ACID*/
    level1.add(new Block(2550, 4400, 100, 100, "static-1x1"));

    /*WALL AFTER ACID & PIPES*/
    for (int i = 0; i < 10; i++) {
        level1.add(new Block(200, 2800+(i*200), 200, 200, "static-2x2"));
    }

    /*PARKOR BLOCKS ON WALL*/
    level1.add(new Block(400, 4600, 100, 100, "static-1x1"));
    level1.add(new Block(600, 4450, 200, 100, "static-2x1"));
    level1.add(new Block(400, 4300, 100, 100, "static-1x1"));
    level1.add(new Block(700, 4100, 100, 100, "static-1x1"));
    level1.add(new Block(1000, 4100, 200, 100, "static-2x1"));
    level1.add(new Block(900, 3900, 100, 200, "static-1x2"));
    level1.add(new Block(700, 3700, 100, 100, "static-1x1"));
    level1.add(new Block(400, 3600, 100, 100, "static-1x1"));
    level1.add(new Block(600, 3400, 100, 100, "static-1x1"));
    level1.add(new Block(400, 3200, 100, 100, "static-1x1"));
    level1.add(new Block(600, 3000, 100, 100, "static-1x1"));
    level1.add(new Block(400, 2800, 100, 100, "static-1x1"));

    level1.add(new Block(2000, 4600, 200, 200, "acid"));
    level1.add(new Block(2200, 4600, 200, 200, "acid"));
    level1.add(new Block(2400, 4600, 200, 200, "acid"));
    level1.add(new Block(2600, 4600, 200, 200, "acid"));
    level1.add(new Block(2800, 4600, 200, 200, "acid"));
    level1.add(new Block(3000, 4600, 200, 200, "acid"));

    /*EXIT*/
    level1.add(new Block(0, 4550, 200, 250, "exit"));

    level1.add(new Block(600, 0, 110, 130, "light", 100, 400));
    level1.add(new Block(1000, 0, 110, 130, "light", 100, 400));
    level1.add(new Block(1400, 0, 110, 130, "light", 100, 400));
    level1.add(new Block(200, 0, 110, 130, "light", 100, 400));
    level1.add(new Block(1800, 0, 110, 130, "light", 100, 400));


}

void setupLevel_2() {
    /*WALLS*/
    for (int i = 0; i < numWalls; i++) {
        level2.add(new Block(0+(i*400), -400, 400, 400, "static-4x4")); //Width
        level2.add(new Block(-400, -400+(i*400), 400, 400, "static-4x4")); //Height
        level2.add(new Block(-400+(i*400), (numWalls-1)*400, 400, 400, "static-4x4")); //Height
        level2.add(new Block((numWalls-1)*400, -400+(i*400), 400, 400, "static-4x4")); //Width
    }
    level2.add(new Block(4800, 4800, 400, 400, "static-4x4"));

    level2.add(new Block(500, 600, 210, 210, "saw"));
    level2.add(new Block(1300, 600, 210, 210, "saw"));
    level2.add(new Block(2300, 900, 210, 210, "saw"));
    level2.add(new Block(2500, 1100, 200, 200, "saw"));


    for (int i = 0; i < 10; i++) {
        level2.add(new Block(0+(i*200), 600, 200, 200, "static-2x2"));
    }

    level2.add(new Block(1800, 800, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 800, 200, 200, "static-2x2"));

    level2.add(new Block(2000, 1000, 200, 200, "static-2x2"));
    level2.add(new Block(2200, 1000, 200, 200, "static-2x2"));
    level2.add(new Block(2200, 1200, 200, 200, "static-2x2"));
    level2.add(new Block(2400, 1200, 200, 200, "static-2x2"));
    level2.add(new Block(2400, 1400, 200, 200, "static-2x2"));
    level2.add(new Block(2600, 1400, 200, 200, "static-2x2"));

    level2.add(new Block(2600, 1600, 200, 200, "static-2x2"));
    level2.add(new Block(2600, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(2800, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(3000, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(3200, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(4200, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(4000, 1800, 200, 200, "static-2x2"));
    level2.add(new Block(4200, 1600, 200, 200, "static-2x2"));
    level2.add(new Block(4200, 1400, 200, 200, "static-2x2"));

    level2.add(new Block(2800, 1425, 70, 160, "solid-pipe-flipped"));
    level2.add(new Block(3400, 1400, 200, 100, "moving-horizontal-2x1", 3200, 4000, 3));

    level2.add(new Block(2800, 1600, 200, 200, "acid"));
    level2.add(new Block(3200, 1600, 200, 200, "acid"));
    level2.add(new Block(3000, 1600, 200, 200, "acid"));
    level2.add(new Block(3400, 1600, 200, 200, "acid"));
    level2.add(new Block(3600, 1600, 200, 200, "acid"));
    level2.add(new Block(3800, 1600, 200, 200, "acid"));
    level2.add(new Block(4000, 1600, 200, 200, "acid"));

    level2.add(new Block(4400, 1400, 200, 100, "drop-2x1"));
    level2.add(new Block(4600, 1400, 200, 100, "drop-2x1"));

    level2.add(new Block(4300, 2100, 210, 210, "saw"));
    level2.add(new Block(4300, 2300, 210, 210, "saw"));
    level2.add(new Block(4700, 2100, 210, 210, "saw"));
    level2.add(new Block(4700, 2300, 210, 210, "saw"));
    level2.add(new Block(4700, 2500, 210, 210, "saw"));
    level2.add(new Block(4300, 2500, 210, 210, "saw"));
    level2.add(new Block(4300, 2700, 200, 200, "saw"));
    level2.add(new Block(4700, 2700, 200, 200, "saw"));

    level2.add(new Block(4200, 3000, 200, 100, "static-2x1"));
    level2.add(new Block(4400, 3000, 200, 100, "static-2x1"));
    level2.add(new Block(4600, 3000, 200, 100, "static-2x1"));

    level2.add(new Block(4000, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(3200, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 2600, 200, 200, "static-2x2"));
    level2.add(new Block(3200, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(3200, 2600, 200, 200, "static-2x2"));
    level2.add(new Block(3000, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2800, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2800, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(2800, 2600, 200, 200, "static-2x2"));
    level2.add(new Block(2600, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2400, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2400, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(2400, 2600, 200, 200, "static-2x2"));

    level2.add(new Block(4000, 2900, 100, 100, "static-1x1"));
    level2.add(new Block(3800, 2700, 100, 100, "static-1x1"));


    level2.add(new Block(2600, 2600, 200, 100, "drop-2x1"));
    level2.add(new Block(3400, 2600, 200, 100, "drop-2x1"));

    level2.add(new Block(2700, 2900, 210, 210, "saw"));
    level2.add(new Block(3500, 2900, 210, 210, "saw"));
    level2.add(new Block(3000, 2800, 200, 200, "acid"));

    level2.add(new Block(2200, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(1800, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(1600, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(1400, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(1200, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(2200, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(2100, 2900, 100, 100, "static-1x1"));
    level2.add(new Block(2300, 2700, 100, 100, "static-1x1"));


    level2.add(new Block(2000, 2600, 100, 100, "static-1x1"));
    level2.add(new Block(1800, 2600, 100, 200, "static-1x2"));
    level2.add(new Block(1400, 2600, 200, 100, "static-1x1x2"));
    level2.add(new Block(1100, 2600, 200, 100, "static-2x1"));
    level2.add(new Block(1000, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(800, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(600, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(600, 2600, 200, 200, "static-2x2"));
    level2.add(new Block(400, 3000, 200, 200, "static-2x2"));
    level2.add(new Block(400, 2800, 200, 200, "static-2x2"));
    level2.add(new Block(400, 2600, 200, 200, "static-2x2"));
    level2.add(new Block(200, 2600, 200, 200, "static-2x2"));

    level2.add(new Block(200, 2400, 200, 200, "static-2x2"));
    level2.add(new Block(200, 2250, 200, 100, "static-2x1"));
    level2.add(new Block(200, 2000, 200, 200, "static-2x2"));
    level2.add(new Block(200, 1850, 200, 100, "static-2x1"));
    level2.add(new Block(200, 1600, 200, 200, "static-2x2"));

    level2.add(new Block(0, 3000, 200, 200, "moving-horizontal-2x2", 0, 200, 3));
    level2.add(new Block(105, 3305, 210, 210, "saw"));
    level2.add(new Block(200, 3400, 200, 200, "static-2x2"));
    level2.add(new Block(0, 3400, 200, 200, "static-2x2"));

    level2.add(new Block(600, 2250, 200, 200, "static-2x2"));
    level2.add(new Block(500, 2350, 100, 100, "static-1x1"));

    level2.add(new Block(400, 1920, 200, 200, "static-2x2"));
    level2.add(new Block(600, 2020, 100, 100, "static-1x1"));

    level2.add(new Block(500, 1675, 100, 100, "static-1x1"));

    level2.add(new Block(200, 3600, 200, 200, "static-2x2"));
    level2.add(new Block(200, 3800, 200, 200, "static-2x2"));
    level2.add(new Block(200, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(200, 4000, 200, 200, "static-2x2"));
    level2.add(new Block(200, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(200, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(600, 3200, 200, 200, "static-2x2"));
    level2.add(new Block(600, 3400, 200, 200, "static-2x2"));
    level2.add(new Block(600, 3600, 200, 200, "static-2x2"));
    level2.add(new Block(600, 3800, 200, 200, "static-2x2"));
    level2.add(new Block(505, 4705, 210, 210, "saw"));

    level2.add(new Block(1200, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(1400, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(1400, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(1600, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(1600, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(1800, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(1800, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(1800, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(1600, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 4000, 200, 200, "static-2x2"));
    level2.add(new Block(1800, 4000, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(2000, 3800, 200, 200, "static-2x2"));

    level2.add(new Block(4200, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(4000, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(4000, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(3800, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 4600, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 4400, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 4200, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 4000, 200, 200, "static-2x2"));
    level2.add(new Block(3600, 4000, 200, 200, "static-2x2"));
    level2.add(new Block(3400, 3800, 200, 200, "static-2x2"));

    level2.add(new Block(2400, 3800, 200, 100, "drop-2x1"));
    level2.add(new Block(2800, 3800, 200, 100, "drop-2x1"));
    level2.add(new Block(3200, 3800, 200, 100, "drop-2x1"));
    level2.add(new Block(3000, 3800, 200, 100, "drop-2x1"));
    level2.add(new Block(2600, 3800, 200, 100, "drop-2x1"));
    level2.add(new Block(2200, 3800, 200, 100, "drop-2x1"));

    level2.add(new Block(2310, 4700, 200, 210, "saw"));
    level2.add(new Block(3300, 4700, 200, 210, "saw"));

    level2.add(new Block(2200, 4200, 1200, 600, "darkness"));
    level2.add(new Block(4400, 4700, 200, 100, "static-2x1"));

    level2.add(new Block(4600, 4550, 200, 250, "exit"));

    level2.add(new Block(2650, 2000, 110, 130, "light", 100, 600));
    level2.add(new Block(3450, 2000, 110, 130, "light", 100, 600));
    level2.add(new Block(800, 0, 110, 130, "light", 100, 600));

}

void setupLevel_3() {
    level3.add(new Block(1800+50, 1000, 110, 130, "light", 40, 300));
    level3.add(new Block(800+50, 1800, 110, 130, "light", 100, 600));
    level3.add(new Block(1200+50, 1800, 110, 130, "light", 100, 600));
    level3.add(new Block(1400-50, 4300, 110, 130, "light", 100, 500));
    level3.add(new Block(150, 0, 110, 130, "light", 100, 400));
    level3.add(new Block(2000, 2600, 110, 130, "light", 100, 400));
    level3.add(new Block(2600, 2600, 110, 130, "light", 100, 400));
    level3.add(new Block(3200, 2600, 110, 130, "light", 100, 400));
    level3.add(new Block(3800, 2600, 110, 130, "light", 100, 400));
    level3.add(new Block(4400, 2600, 110, 130, "light", 100, 400));


    level3.add(new Block(0, 400, 200, 200, "static-2x2"));
    level3.add(new Block(200, 400, 200, 200, "static-2x2"));
    level3.add(new Block(400, 500, 100, 100, "static-1x1"));
    level3.add(new Block(600, 620, 70, 160, "solid-pipe-flipped"));

    level3.add(new Block(0, 800, 200, 200, "acid"));
    level3.add(new Block(200, 800, 200, 200, "static-2x2"));
    level3.add(new Block(400, 800, 200, 200, "static-2x2"));
    level3.add(new Block(400, 600, 200, 200, "static-2x2"));
    level3.add(new Block(0, 600, 200, 200, "acid"));
    level3.add(new Block(200, 600, 200, 200, "acid"));
    level3.add(new Block(1800, 600, 200, 200, "static-2x2"));

    level3.add(new Block(1105, 705, 210, 210, "moving-sideways-saw", 1105, 1700, 15));

    level3.add(new Block(0, 1000, 200, 200, "acid"));
    level3.add(new Block(0, 1200, 200, 200, "acid"));
    level3.add(new Block(0, 1400, 200, 200, "acid"));

    level3.add(new Block(0, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(200, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(400, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(600, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(800, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1000, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1200, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1400, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1600, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1800, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(1800, 800, 200, 200, "static-2x2"));


    level3.add(new Block(200, 1400, 200, 200, "acid"));
    level3.add(new Block(400, 1400, 200, 200, "acid"));
    level3.add(new Block(600, 1400, 200, 200, "acid"));
    level3.add(new Block(800, 1400, 200, 200, "acid"));
    level3.add(new Block(1000, 1400, 200, 200, "acid"));
    level3.add(new Block(1400, 1400, 200, 200, "acid"));
    level3.add(new Block(1200, 1400, 200, 200, "acid"));
    level3.add(new Block(1600, 1400, 200, 200, "acid"));
    level3.add(new Block(1800, 1400, 200, 200, "acid"));

    level3.add(new Block(1000, 1300, 200, 100, "static-2x1"));
    level3.add(new Block(1200, 1300, 200, 100, "static-2x1"));
    level3.add(new Block(1400, 1300, 200, 100, "static-2x1"));
    level3.add(new Block(1600, 1300, 200, 100, "static-2x1"));
    level3.add(new Block(1800, 1300, 200, 100, "static-2x1"));

    level3.add(new Block(1800, 1800, 200, 200, "static-2x2"));
    level3.add(new Block(1800, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(2000, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(2200, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(2600, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(2400, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(2800, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(3000, 2000, 200, 200, "static-2x2"));

    level3.add(new Block(2000, 1400, 200, 200, "acid"));
    level3.add(new Block(2000, 1600, 200, 200, "acid"));
    level3.add(new Block(2000, 1800, 200, 200, "acid"));
    level3.add(new Block(2200, 1600, 200, 200, "acid"));
    level3.add(new Block(2200, 1800, 200, 200, "acid"));
    level3.add(new Block(2400, 1600, 200, 200, "acid"));
    level3.add(new Block(2400, 1800, 200, 200, "acid"));
    level3.add(new Block(2600, 1600, 200, 200, "acid"));
    level3.add(new Block(2600, 1800, 200, 200, "acid"));
    level3.add(new Block(2800, 1600, 200, 200, "acid"));
    level3.add(new Block(2800, 1800, 200, 200, "acid"));
    level3.add(new Block(3000, 1600, 200, 200, "acid"));
    level3.add(new Block(3000, 1800, 200, 200, "acid"));

    level3.add(new Block(3200, 2000, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 1800, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 1600, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 1400, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 1200, 200, 200, "static-2x2"));

    level3.add(new Block(2000, 1300, 200, 100, "moving-horizontal-2x1", 2000, 2400, 3));
    level3.add(new Block(3000, 1300, 200, 100, "moving-horizontal-2x1", 2600, 3000, 3));

    level3.add(new Block(4000, 2000, 200, 200, "drop-2x2"));
    level3.add(new Block(3505, 2105, 210, 210, "saw"));
    level3.add(new Block(3705, 2105, 210, 210, "saw"));
    level3.add(new Block(3905, 2105, 210, 210, "saw"));
    level3.add(new Block(4305, 2105, 210, 210, "saw"));
    level3.add(new Block(4505, 2105, 210, 210, "saw"));
    level3.add(new Block(4705, 2105, 210, 210, "saw"));

    level3.add(new Block(3400, 1200, 200, 200, "moving-horizontal-2x1", 3400, 4600, 7));
    level3.add(new Block(4000, 700, 210, 210, "moving-vertical-saw", 700, 1000, 3));

    level3.add(new Block(4000, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(4200, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(4400, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(4600, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(3800, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(3600, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(3400, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(3000, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(2800, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(2600, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(2400, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(2200, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(2000, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(1800, 2400, 200, 200, "static-2x2"));

    level3.add(new Block(1600, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(1400, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(1200, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(1000, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(800, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(600, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(400, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(200, 2400, 200, 200, "static-2x2"));

    level3.add(new Block(1505, 1905, 210, 210, "moving-vertical-saw", 1905, 2305, 8));
    level3.add(new Block(1105, 1905, 210, 210, "moving-vertical-saw", 1905, 2305, 8));
    level3.add(new Block(705, 1905, 210, 210, "moving-vertical-saw", 1905, 2305, 8));
    level3.add(new Block(505, 1905, 210, 210, "moving-vertical-saw", 1905, 2305, 8));

    level3.add(new Block(0, 2800, 200, 200, "static-2x2"));
    level3.add(new Block(800, 2800, 200, 200, "static-2x2"));
    level3.add(new Block(0, 3200, 200, 200, "static-2x2"));
    level3.add(new Block(800, 3200, 200, 200, "static-2x2"));
    level3.add(new Block(0, 3600, 200, 200, "static-2x2"));
    level3.add(new Block(800, 3600, 200, 200, "static-2x2"));
    level3.add(new Block(0, 4000, 200, 200, "static-2x2"));
    level3.add(new Block(800, 4000, 200, 200, "static-2x2"));
    level3.add(new Block(0, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(800, 4400, 200, 200, "static-2x2"));

    level3.add(new Block(105, 3105, 210, 210, "moving-sideways-saw", 105, 105+800, 10));
    level3.add(new Block(905, 3505, 210, 210, "moving-sideways-saw", 905-800, 905, 10));
    level3.add(new Block(105, 3905, 210, 210, "moving-sideways-saw", 105, 105+800, 10));
    level3.add(new Block(905, 4305, 210, 210, "moving-sideways-saw", 905-800, 905, 10));

    level3.add(new Block(2000, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(2200, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(2400, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(2600, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(2800, 4400, 200, 200, "static-2x2"));
    level3.add(new Block(3000, 4400, 200, 200, "static-2x2"));

    level3.add(new Block(1505, 4810, 210, 210, "moving-sideways-saw", 1505, 1505+1600, 15));
    level3.add(new Block(3505, 4610, 210, 210, "moving-sideways-saw", 3505, 3505+800, 15));

    level3.add(new Block(3400, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(3000, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(2800, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(2600, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(2400, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(2200, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(2000, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(3600, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(3800, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(4200, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(4000, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(4600, 4600, 200, 200, "static-2x2"));
    level3.add(new Block(3800, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(4000, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(4200, 4200, 200, 200, "static-2x2"));

    level3.add(new Block(4400, 4300, 100, 100, "static-1x1"));
    level3.add(new Block(4700, 4500, 100, 100, "static-1x1"));

    level3.add(new Block(3200, 4100, 200, 100, "static-2x1"));
    level3.add(new Block(3400, 4100, 200, 100, "static-2x1"));
    level3.add(new Block(3600, 4100, 200, 100, "static-2x1"));
    level3.add(new Block(3800, 4100, 200, 100, "static-2x1"));
    level3.add(new Block(3000, 4100, 200, 100, "static-2x1"));

    level3.add(new Block(1500, 4200, 200, 100, "static-2x1"));
    level3.add(new Block(1000, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(1000, 3400, 200, 200, "static-2x2"));
    level3.add(new Block(1000, 3800, 200, 200, "static-2x2"));
    level3.add(new Block(1000, 4200, 200, 200, "static-2x2"));
    level3.add(new Block(1300, 4200, 200, 100, "drop-2x1"));
    level3.add(new Block(1200, 4200, 100, 100, "static-1x1"));
    level3.add(new Block(1200, 3900, 100, 100, "static-1x1"));
    level3.add(new Block(1400, 3700, 100, 100, "static-1x1"));
    level3.add(new Block(1200, 3500, 100, 100, "static-1x1"));
    level3.add(new Block(1400, 3300, 200, 100, "static-2x1"));

    level3.add(new Block(1800, 3200, 200, 200, "static-2x2"));
    level3.add(new Block(1600, 3200, 200, 200, "static-2x2"));
    level3.add(new Block(2000, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(1800, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(2200, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(2600, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(2400, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(2800, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(3000, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(3200, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(3400, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(3600, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(3800, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(4200, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(4000, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(4400, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(4600, 3000, 200, 200, "static-2x2"));

    level3.add(new Block(4800, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(5000, 3000, 200, 200, "static-2x2"));
    level3.add(new Block(4800, 2400, 200, 200, "static-2x2"));
    level3.add(new Block(5000, 2400, 200, 200, "static-2x2"));

    level3.add(new Block(5200, 2400, 200, 200, "invisible"));
    level3.add(new Block(5400, 2400, 200, 200, "invisible"));
    level3.add(new Block(5600, 2400, 200, 200, "invisible"));
    level3.add(new Block(5800, 2400, 200, 200, "invisible"));
    level3.add(new Block(5800, 2600, 200, 200, "invisible"));
    level3.add(new Block(5800, 2800, 200, 200, "invisible"));
    level3.add(new Block(5800, 3000, 200, 200, "invisible"));
    level3.add(new Block(5200, 3000, 200, 200, "invisible"));
    level3.add(new Block(5400, 3000, 200, 200, "invisible"));
    level3.add(new Block(5600, 3000, 200, 200, "invisible"));

    level3.add(new Block(5600, 2600, 100, 400, "final-level-trigger"));




    /*WALLS*/
    for (int i = 0; i < numWalls; i++) {
        level3.add(new Block(0+(i*400), -400, 400, 400, "static-4x4")); //Width
        level3.add(new Block(-400, -400+(i*400), 400, 400, "static-4x4")); //Height
        level3.add(new Block(-400+(i*400), (numWalls-1)*400, 400, 400, "static-4x4")); //Width
    }
    for (int i = 0; i < numWalls; i++) {
        if (i >= 7 && i <= 8) continue;
        level3.add(new Block((numWalls-1)*400, -400+(i*400), 400, 400, "static-4x4")); //Height
    }

    level3.add(new Block(4800, 4800, 400, 400, "static-4x4"));

}