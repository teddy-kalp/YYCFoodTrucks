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
    
    init(name: String, id: Int, open: Bool, img: String, category_id: Int) {
        self.name = name
        self.id = id
        self.open = open
        self.img = img
        self.category_id = category_id
    }
}

let trucks = [
    Truck(name: "Family Squeezed", id: 0, open: true, img:  "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552529678931-1S3EM785SI4JW96FYMBU/ke17ZwdGBToddI8pDm48kIFnNRcat-z6HBP33jPz0PJZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH2pKFwJgjoNrvk9u53ILGcOavgvQAJU-lLkK_XQryR6XKbvmZOpSh_PFG1by1nqTU/FamilySqueezedLogo_2.jpeg", category_id: 0),
    Truck(name: "Cookie Dough YYC", id: 1, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552529678662-RC8UFH5VPACA9QG9NQFR/ke17ZwdGBToddI8pDm48kAqQVgKwkDmDu2rgOpwgDTFZw-zPPgdn4jUwVcJE1ZvWhcwhEtWJXoshNdA9f1qD7Xj1nVWs2aaTtWBneO2WM-sdqA1CeR_-6uZ_NqB_LHOi8bQA5xdWlGivQBpDV8feVA/Image%2Buploaded%2Bfrom%2BiOS%2B%281%29.jpg?format=300w", category_id: 0),
    Truck(name: "Righteous Gelato", id: 2, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1587598025839-NSAM44VS5XL55SM6L84S/ke17ZwdGBToddI8pDm48kPkB0UXG5uV4bFKzIQ_oT_57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UV8oDwilBhA3PGK6MEO6YhKMvAXpMw_9L1cbaFTVcl8W3WUfc_ZsVm9Mi1E6FasEnQ/righteous-gelato.png?format=300w", category_id: 0),
    Truck(name: "Savino Pizzeria", id: 3, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552530551547-339TXJ7HCQGLU60HM6LT/ke17ZwdGBToddI8pDm48kP06O0_IHyRXSOOiqwgWaApZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEHLRkg2cosQUGLeQ33UzXdgIxPDaVwE3LlEpL74qP4JVW4jCyXLPvvdR287iymYt8/BD_text_Savino.jpg?format=300w", category_id: 1),
    Truck(name: "Family Dogs", id: 4, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552531038485-MWGDWX7HMXP1N7GQCPAV/ke17ZwdGBToddI8pDm48kJ0Yrf3tRHNOleGdzjIGFTNZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH4qDBX7rNVQ9_Xqb55ktwjOOKcr5sJBJdzIiSs71W4Jr5tpyAbxcRCI4d96r1ow18/Image%2Buploaded%2Bfrom%2BiOS.jpg?format=300w", category_id: 2),
    Truck(name: "The Dumpling Hero", id: 5, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1552531479275-UA15GQGU9XDN0D1AMSBK/ke17ZwdGBToddI8pDm48kP06O0_IHyRXSOOiqwgWaApZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEHLRkg2cosQUGLeQ33UzXdgIxPDaVwE3LlEpL74qP4JVW4jCyXLPvvdR287iymYt8/dumpling.jpg?format=300w", category_id: 3),
    Truck(name: "Caffeine Me", id: 6, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1581533299366-RR2303XW2CKG7EGBDEX9/ke17ZwdGBToddI8pDm48kLxnK526YWAH1qleWz-y7AFZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVH33scGBZjC30S7EYewNF5iKKwhonf2ThqWWOBkLKnojuqYeU1KwPvsAK7Tx5ND4WE/caffeine-and-me-logo.jpg?format=300w", category_id: 4),
    Truck(name: "Kicking Donkey", id: 7, open: true, img: "https://images.squarespace-cdn.com/content/v1/53f43705e4b03f018aae7cf3/1559859329260-JH33XMQ4W3SW4PNRTYNP/ke17ZwdGBToddI8pDm48kACcDXMHGNkFM3YDpaU_ssR7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0sofvP-RiTb638-KOMjny0tsWtWqbVPtUr1MJVRcwBc3DuN3HoOLj_qTsxwVfAM8vA/received_661190007666844.jpeg?format=300w", category_id: 5),

]

