module module_3::hero; 
    // ========= IMPORTS =========
    use std::string::String;
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::event;
    use sui::transfer::{public_freeze_object, public_share_object, public_transfer};

    const EInvalidPayment: u64 = 1;
    
    // ========= STRUCTS =========
    public struct Hero has key, store {
        id: UID,
        name: String,
        image_url: String,
        power: u64,
    }

    public struct ListHero has key, store {
        id: UID,
        nft: Hero,
        price: u64,
        seller: address
    }

    public struct HeroMetadata has key, store {
        id: UID,
        timestamp: u64,
    }

    // ========= EVENTS =========

    public struct HeroListed has copy, drop {
        listing_id: ID,
        price: u64,
        seller: address,
        timestamp: u64
    }

    public struct HeroBought has copy, drop {
        listing_id: ID,
        price: u64,
        buyer: address,
        seller: address,
        timestamp: u64
    }

    // ========= FUNCTIONS =========
    #[allow(lint(self_transfer))]
    public entry fun create_hero(name: String, image_url: String, power: u64, ctx: &mut TxContext) {
        let hero = Hero {
            id: object::new(ctx),
            name,
            image_url,
            power,
        };

        let hero_metadata = HeroMetadata {
            id: object::new(ctx),
            timestamp: ctx.epoch_timestamp_ms(),
        };

        transfer::transfer(hero, ctx.sender());

        // TODO: Freeze the HeroMetadata object
        public_freeze_object(hero_metadata)
    }

    public entry fun list_hero(nft: Hero, price: u64, ctx: &mut TxContext) {
        let list_hero = ListHero {
            id: object::new(ctx),
            nft,
            price,
            seller: ctx.sender(),
        };

        let listing_id = object::id(&list_hero);

        event::emit(HeroListed {
            listing_id,
            price,
            seller: ctx.sender(),
            timestamp: ctx.epoch_timestamp_ms(),
        });

        public_share_object(list_hero)
    }

    public entry fun buy_hero(list_hero: ListHero, coin: Coin<SUI>, ctx: &mut TxContext) {
        let listing_id = object::id(&list_hero);

        let ListHero {
            id,
            nft,
            price,
            seller,
        } = list_hero;

        assert!(price == coin.value(), EInvalidPayment);

        event::emit(HeroBought {
            listing_id,
            price,
            buyer: ctx.sender(),
            seller,
            timestamp: ctx.epoch_timestamp_ms(),
        });

        public_transfer(coin, seller);
        public_transfer(nft, ctx.sender());

        id.delete()
    }
    public entry fun transfer_hero(hero: Hero, to: address) {
        transfer::public_transfer(hero, to);
    }

    // ========= GETTER FUNCTIONS =========
    
    #[test_only]
    public fun hero_name(hero: &Hero): String {
        hero.name
    }

    #[test_only]
    public fun hero_image_url(hero: &Hero): String {
        hero.image_url
    }

    #[test_only]
    public fun hero_power(hero: &Hero): u64 {
        hero.power
    }

    #[test_only]
    public fun hero_id(hero: &Hero): ID {
        object::id(hero)
    }





