/obj/machinery/vending/cafomat
    name = "Caf-O-Mat"
    desc = "The cafe variety of the Booze-O-Mat. Probably has significantly less alcohol."
    icon_state = "boozeomat"
    products = list(/obj/item/weapon/reagent_containers/food/drinks/glass2/square = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/glass2/shake = 10,
                    /obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/glass2/pint = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/glass2/carafe = 3,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/grapejuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/metaglass = 10,
                    /obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 10,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine = 5,
                    /obj/item/weapon/reagent_containers/food/condiment/cookingoil = 5,
                    /obj/item/weapon/reagent_containers/food/condiment/cornoil = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/cans/alecan = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/lemonjuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/applejuice = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/milk = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/cream = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/cola = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/decaf_cola = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/space_up = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/space_mountain_wind = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/dr_gibb = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/small/cola = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/small/space_up = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/small/space_mountain_wind = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/bottle/small/dr_gibb = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/cans/sodawater = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/cans/gingerale = 15,
                    /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask = 5,
                    /obj/item/weapon/reagent_containers/food/drinks/ice = 10,
                    /obj/item/weapon/reagent_containers/food/drinks/tea = 15,
                    /obj/item/weapon/glass_extra/stick = 30,
                    /obj/item/weapon/glass_extra/straw = 30)
    contraband = list()
    vend_delay = 15
    idle_power_usage = 200
    product_slogans = "Bad day? How about a nice cup of tea?;Coffee is a quick way to boost your energy, need a lift?;Quite delighted to serve you!;Is nobody thirsty on this station?"
    product_ads = "Drink up!;Tea is good for you!;A bit of sugar never hurt anyone.;Quite delighted to serve you!;Care for a nice, hot cuppa?;Need energy? Coffee.;Have a sip!;Have a drink!;Have a shake!;Juice is good for you!;Only the finest drinks!;Best quality juices since 2053!;Award-winning beans!;Caffeine free options!;Sugar free options!;A toast for progress!"
    req_access = list(access_bar)
    req_log_access = access_bar
    has_logs = 1
    vending_sound = "machines/vending/vending_cans.ogg"
