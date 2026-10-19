//Basic config settings for developers

#define FALLBACK_TURF locate(VIEW_RANGE+1,VIEW_RANGE+1,1) //This shouldn't be touched unless you know what you're doing.
#define DEBUG_TURF locate(1,1,1)

#define WORLD_SIZE 500 //This shouldn't be touched unless you know what you're doing.
#define TILE_SIZE 32 //This shouldn't be touched unless you know what you're doing

#define MAX_INVENTORY_X 8

#define FPS_CLIENT 60 //0 表示与服务器同步。同时也是默认值，玩家可自行修改。
#define FPS_CLIENT_MAX 1000 //玩家可设置的最高客户端帧率。客户端 tick 分辨率为 1ms，因此该上限实际等于不做限制。
#define FPS_SERVER 20

//Soft limit to prevent more than any of this amount of being on a single turf at once. THIS INCLUDES EVERYTHING THAT USES move(). forcemove() is intentionally ignored.
#define TURF_CONTENT_LIMIT 100