#define MEAT (1<<0)
#define VEGETABLES (1<<1)
#define RAW (1<<2)
#define JUNKFOOD (1<<3)
#define GRAIN (1<<4)
#define FRUIT (1<<5)
#define DAIRY (1<<6)
#define FRIED (1<<7)
#define ALCOHOL (1<<8)
#define SUGAR (1<<9)
#define GROSS (1<<10)
#define TOXIC (1<<11)
#define PINEAPPLE (1<<12)
#define BREAKFAST (1<<13)
#define CLOTH (1<<14)
#define GRILLED (1<<15)
/*#define NUTS (1<<16)
#define SEAFOOD (1<<17)
#define ORANGES (1<<18)
#define BUGS (1<<19)*/
#define GORE (1<<20)

/// IC meaning (more or less) for food flags
#define FOOD_FLAGS_IC list( \
	"Meat", \
	"Vegetables", \
	"Raw food", \
	"Junk food", \
	"Grain", \
	"Fruits", \
	"Dairy products", \
	"Fried food", \
	"Alcohol", \
	"Sugary food", \
	"Gross food", \
	"Toxic food", \
	"Pineapples", \
	"Breakfast food", \
	"Clothing", \
	"Nuts", \
	"Seafood", \
	"Oranges", \
	"Bugs", \
)

#define DRINK_NICE 1
#define DRINK_GOOD 2
#define DRINK_VERYGOOD 3
#define DRINK_FANTASTIC 4
#define FOOD_AMAZING 5

#define FOOD_IN_CONTAINER (1<<0)

#define STOP_SERVING_BREAKFAST (15 MINUTES)

#define WEIGHT_STAGE(weight) (round(sqrt(weight / 30)))

#define WEIGHT_STAGE_NORMAL 0
#define WEIGHT_STAGE_FAT 1
#define WEIGHT_STAGE_FATTER 2
#define WEIGHT_STAGE_VERYFAT 3
#define WEIGHT_STAGE_OBESE 4
#define WEIGHT_STAGE_MORBIDLYOBESE 5
#define WEIGHT_STAGE_EXTREMELYOBESE 6
#define WEIGHT_STAGE_BARELYMOBILE 7
#define WEIGHT_STAGE_IMMOBILE 8
#define WEIGHT_STAGE_BLOB 9
