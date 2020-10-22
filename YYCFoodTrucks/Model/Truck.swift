//
//  Truck.swift
//  YYCFoodTrucks
//
//  Created by Jordan on 2020-10-21.
//

import Foundation

//Load image from url

class Truck: Identifiable, Codable {
    var name: String
    var id: Int
    var open: Bool
    var img: String
    var category_id: Int //Foreign key of category.id
    
    var menu: String
    var description: String
    
    init(name: String, id: Int, open: Bool, img: String, category_id: Int, menu: String, description: String) {
        self.name = name
        self.id = id
        self.open = open
        self.img = img
        self.category_id = category_id
        self.menu = menu
        self.description = description
    }
}

let trucks = [
    Truck(name: "Family Squeezed", id: 0, open: true, img:  "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552529678931-1S3EM785SI4JW96FYMBU/ke17ZwdGBToddI8pDm48kIFnNRcat-z6HBP33jPz0PJZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH2pKFwJgjoNrvk9u53ILGcOavgvQAJU-lLkK_XQryR6XKbvmZOpSh_PFG1by1nqTU/FamilySqueezedLogo_2.jpeg", category_id: 0, menu: "null", description: "We have re-engineered what lemonade was. These are made to order; fresh fruit and herbs...with a twist! These fresh ingredients are chopped, assembled, and muddled right before your eyes. No artificial flavours or syrups- all natural, and real fruit... At 32 ounces -  we hope you can handle it. Old-fashioned lemonade elevated to the way it was always meant to be."),
    Truck(name: "Cookie Dough YYC", id: 1, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552529678662-RC8UFH5VPACA9QG9NQFR/ke17ZwdGBToddI8pDm48kAqQVgKwkDmDu2rgOpwgDTFZw-zPPgdn4jUwVcJE1ZvWhcwhEtWJXoshNdA9f1qD7Xj1nVWs2aaTtWBneO2WM-sdqA1CeR_-6uZ_NqB_LHOi8bQA5xdWlGivQBpDV8feVA/Image%2Buploaded%2Bfrom%2BiOS%2B%281%29.jpg?format=300w", category_id: 0, menu: "null", description: "Cookie Dough YYC is a family created and operated, award winning company that ha taken Alberta by storm with marvellously tasty edible cookie dough! We've heard the rumours too, some people will tell you not to eat raw cookie dough, and you don't need that kind of negativity in your life :). This dough is made with love, using heat-treated flour and pasteurized eggs so it's safe to eat raw, and is scooped liked ice cream. Cookie Dough YYC only gives the best to their family and so that is what they’re doing for yours. Every lick of this company is built, mixed, and created by us. They believe in quality and old fashioned treats, elevated. Invite them for your corporate, private, family, or public function. They can roll in on something as small as a cooler trike or something as big as a food truck. They also love to deliver!"),
    Truck(name: "Righteous Gelato", id: 2, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1587598025839-NSAM44VS5XL55SM6L84S/ke17ZwdGBToddI8pDm48kPkB0UXG5uV4bFKzIQ_oT_57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UV8oDwilBhA3PGK6MEO6YhKMvAXpMw_9L1cbaFTVcl8W3WUfc_ZsVm9Mi1E6FasEnQ/righteous-gelato.png?format=300w", category_id: 0, menu: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552074189514-4F0F4DTLUUE8046BW3GL/ke17ZwdGBToddI8pDm48kPCYpSSzyVgHYawjCepQuQJZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpzwC4h-1oavJrxzYC9hL9BlT2-tT6u6Nt3eapfInOwWALRn7n1B0lVbLblGCw2a3qQ/menu.png?format=500w", description:  "Righteous Gelato is Calgary's Artisan Gelato Aficionado's. Offering Hand crafted flavours of gelato and sorbetto, as well as a full scale espresso bar!"),
    Truck(name: "Savino Pizzeria", id: 3, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552530551547-339TXJ7HCQGLU60HM6LT/ke17ZwdGBToddI8pDm48kP06O0_IHyRXSOOiqwgWaApZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEHLRkg2cosQUGLeQ33UzXdgIxPDaVwE3LlEpL74qP4JVW4jCyXLPvvdR287iymYt8/BD_text_Savino.jpg?format=300w", category_id: 1, menu: "null", description: "Growing up in an Italian family, great food was always on the go; and the days we made bread and pizza were charged with, almost insane, excitement. Our goal is to produce true Neapolitan pizza that will invoke that same “insanity”. Buon’ apetito!"),
    Truck(name: "Family Dogs", id: 4, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552531038485-MWGDWX7HMXP1N7GQCPAV/ke17ZwdGBToddI8pDm48kJ0Yrf3tRHNOleGdzjIGFTNZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH4qDBX7rNVQ9_Xqb55ktwjOOKcr5sJBJdzIiSs71W4Jr5tpyAbxcRCI4d96r1ow18/Image%2Buploaded%2Bfrom%2BiOS.jpg?format=300w", category_id: 2, menu: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1558622656231-5QSCDAWJJFRSIXTF4609/ke17ZwdGBToddI8pDm48kJUwGXOlZWYXZ_IJanuAROt7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0h5pVlR7R7gEKWV62QqUYX9xzgtHVkdXkMr5N4xphFjucmA89Ec5LZ05kZCscHbvHw/hot-dog-menu-2019.png?format=500w", description: "We are a cousin truck to Family Squeezed Lemonade and Family Freezed Gourmet Ice Pops. Our passion is to appeal to and then to feed groups of people; large or small. If you are looking for a clan of people who truly love being the back drop for your family, corporate, or friend groups happy memories, then look no further than Family Dogs. We take your old fashioned favourite treats and food - and glorify them. We make your food the way it should be! High quality, fresh ingredients, made just for you with an emphasis on yummy. We know whats its like to feed big groups and we know how to get it done. And oh yeah, these gourmet hotdogs, french fries, and poutine just so happen to be named after all of our very own four- legged friends !"),
    Truck(name: "The Dumpling Hero", id: 5, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552531479275-UA15GQGU9XDN0D1AMSBK/ke17ZwdGBToddI8pDm48kP06O0_IHyRXSOOiqwgWaApZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEHLRkg2cosQUGLeQ33UzXdgIxPDaVwE3LlEpL74qP4JVW4jCyXLPvvdR287iymYt8/dumpling.jpg?format=300w", category_id: 3, menu: "null", description: "The dumping hero serves a variety of succulent dumplings, tasty snacks, and desserts to the streets of Calgary."),
    Truck(name: "Caffeine Me", id: 6, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1581533299366-RR2303XW2CKG7EGBDEX9/ke17ZwdGBToddI8pDm48kLxnK526YWAH1qleWz-y7AFZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH33scGBZjC30S7EYewNF5iKKwhonf2ThqWWOBkLKnojuqYeU1KwPvsAK7Tx5ND4WE/caffeine-and-me-logo.jpg?format=300w", category_id: 4, menu: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1581533155190-O3IV184IN3VDKT58MLSR/ke17ZwdGBToddI8pDm48kBZw6jF4_OvU-ddo_vwqGhp7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Ub61YCrK70I7JIpWiI8ho4Yi1WvVNQtDE81xuRbL1MFKm0sD-Bab7E9MY8W31A7zMQ/caffeine-menu.jpg?format=750w", description: "Welcome to caffeinated adventure! Caffeine Me is your next trendy coffee shop in Calgary. We are a mobile trailer that proudly serves fair trade & organic Ethical Bean coffee"),
    Truck(name: "Kicking Donkey", id: 7, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1559859329260-JH33XMQ4W3SW4PNRTYNP/ke17ZwdGBToddI8pDm48kACcDXMHGNkFM3YDpaU_ssR7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0sofvP-RiTb638-KOMjny0tsWtWqbVPtUr1MJVRcwBc3DuN3HoOLj_qTsxwVfAM8vA/received_661190007666844.jpeg?format=300w", category_id: 5, menu: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1559859481875-Z3MNJQRAIFPK93IM0Z0U/ke17ZwdGBToddI8pDm48kNuVtk8_M2tLeZBIh2uZ6MF7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0p5uBJOnOmCWBN4JfYsIDySpcPMjar3HN08b_FY57Vfj1uTTKay_bC_EpQFXLWSbVQ/donkey-menu.jpg?format=500w", description: "Our truck is fully loaded with the authentic flavours, that will transport you to the streets of Mexico... tacos & quesadillas: beef, chicken, pork, fish & vegetarian options, come to visit, once you try our food you will be a taco lover! Let's taco about!"),

]

