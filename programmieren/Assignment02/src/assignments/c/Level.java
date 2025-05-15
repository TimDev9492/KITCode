package assignments.c;

import java.util.List;

public class Level {
    private int levelNumber;
    private String name;
    private LevelDifficulty difficulty;
    private String objectiveDescription;
    private LevelMap layoutMap;

    private List<GameObject> levelObjects;
    private List<GameEntity> levelEnemies;
}
