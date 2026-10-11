//Not in use.
#define RADIO_FREQ_AI_PRIVATE 1447

#define RADIO_FREQ_SECURITY 1359
#define RADIO_FREQ_ENGINEERING 1357
#define RADIO_FREQ_MEDICAL 1355
#define RADIO_FREQ_COMMAND 1353
#define RADIO_FREQ_SCIENCE 1351
#define RADIO_FREQ_SERVICE 1349
#define RADIO_FREQ_SUPPLY 1347

#define RADIO_FREQ_CENTCOMM 1337




//In use.
#define RADIO_FREQ_MIN 1101

#define RADIO_FREQ_MERCENARY_MIN 1107
#define RADIO_FREQ_MERCENARY_MAX 1153

#define RADIO_FREQ_REVOLUTIONARY_MIN 1155
#define RADIO_FREQ_REVOLUTIONARY_MAX 1211

#define RADIO_FREQ_SYNDICATE_MIN 1213
#define RADIO_FREQ_SYNDICATE_MAX 1335

#define RADIO_FREQ_ALPHA    1451
#define RADIO_FREQ_BRAVO    1453
#define RADIO_FREQ_CHARLIE  1455
#define RADIO_FREQ_DELTA    1457
#define RADIO_FREQ_COMMON   1459

#define RADIO_FREQ_SHIP     1461

#define RADIO_FREQ_DOOR     1809

#define RADIO_FREQ_MAX      1899


/proc/frequency_to_name(var/frequency)

	switch(frequency)
		if(RADIO_FREQ_ALPHA)
			return "Alpha"
		if(RADIO_FREQ_BRAVO)
			return "Bravo"
		if(RADIO_FREQ_CHARLIE)
			return "Charlie"
		if(RADIO_FREQ_DELTA)
			return "Delta"
		if(RADIO_FREQ_COMMON)
			return "Common"
		if(RADIO_FREQ_SHIP)
			return "ShipComm"

	//For some reason switch statements don't accept variables.
	if(frequency == SSradio.radio_syn)
		return "Syndicate"
	if(frequency == SSradio.radio_merc)
		return "Mercenary"
	if(frequency == SSradio.radio_rev)
		return "Revolutionary"

	return "Unknown"

/proc/frequency_to_display_name(var/frequency)
	var/static/list/display_names = list(
		"Alpha"="阿尔法",
		"Bravo"="布拉沃",
		"Charlie"="查理",
		"Delta"="德尔塔",
		"Common"="公共",
		"ShipComm"="舰船通讯",
		"Syndicate"="辛迪加",
		"Mercenary"="佣兵",
		"Revolutionary"="革命者",
		"Unknown"="未知"
	)
	return display_names[frequency_to_name(frequency)]
