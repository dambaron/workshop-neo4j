create
    (SacHermes:Product{name:'SacHermes'}),
    (EscarppinsJinny:Product{name:'EscarppinsJinny'}),
    (SacLouisVitton:Product{name:'SacLouisVitton'}),
    (ChaussureLouboutin:Product{name:'ChaussureLouboutin'}),
    
    (ShoppingCart1:ShoppingCart{name:'ShoppingCart1'}),
    (ShoppingCart2:ShoppingCart{name:'ShoppingCart2'}),
    (ShoppingCart3:ShoppingCart{name:'ShoppingCart3'}),

    (Date15_01_2012:Date{name:'Date15_01_2012'}),
    (Date02_01_2000:Date{name:'Date02_01_2000'}),

    (rootCat:Category{name:"Racine"}),
    (handBagCat:Category{name:"Sac à main"}),
    (leatherCat:Category{name:"Maroquinerie"}),
    (luxCat:Category{name:"Marque de luxe"}),
    (frenchCat:Category{name:"Marque de luxe Française"}),

    (Client1:Client{name:'client1'}),
    (Client2:Client{name:'client2'}),
    (Client3:Client{name:'client3'}),
    (Client4:Client{name:'client4'}),
    (Client5:Client{name:'client5'}),

    (Client1-[:HAS_SPONSORED]->Client2),
    (Client2-[:HAS_SPONSORED]->Client3),
    (Client3-[:HAS_SPONSORED]->Client4),
    (Client2-[:HAS_SPONSORED]->Client5),
    (Client1-[:OWN]->ShoppingCart1),
    (Client4-[:OWN]->ShoppingCart2),

    (rootCat-[:SUB_CAT]->luxCat),
    (rootCat-[:SUB_CAT]->leatherCat),
    (luxCat-[:SUB_CAT]->frenchCat-[:SUB_CAT]->handBagCat),
    (leatherCat-[:SUB_CAT]->handBagCat),
    (handBagCat-[:SUB_CAT]->SacHermes),
    (handBagCat-[:SUB_CAT]->SacLouisVitton),

    (ShoppingCart1-[:CONTAINS]->SacHermes),
    (ShoppingCart1-[:CONTAINS]->EscarppinsJinny),

    (ShoppingCart2-[:CONTAINS]->EscarppinsJinny),
    (ShoppingCart2-[:CONTAINS]->ChaussureLouboutin),
    
    (ShoppingCart3-[:CONTAINS]->SacHermes),
    (ShoppingCart3-[:CONTAINS]->SacLouisVitton),
    (ShoppingCart3-[:CONTAINS]->ChaussureLouboutin),

    (ShoppingCart1-[:DATE]->Date15_01_2012),
    (ShoppingCart2-[:DATE]->Date15_01_2012),
    (ShoppingCart3-[:DATE]->Date02_01_2000);

create index on :Client(name);
create index on :Category(name);
create index on :ShoppingCart(name);
