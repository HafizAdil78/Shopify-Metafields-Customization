codeunit 60101 "Custom Shpfy Field Sync"
{
    //implements("Shopify Entity Mapping");

    procedure SyncCustomFieldsToShopify(Item: Record Item; ShopifyProductID: BigInteger)
    var
        Metafield: Record "Shpfy Metafield";
        LastID: BigInteger;
    begin
        Metafield.Reset();
        Metafield.SetRange("Parent Table No.", 30127);
        Metafield.SetRange("Owner Id", ShopifyProductID);
        Metafield.SetRange("Namespace", 'custom');
        Metafield.SetRange(Name, 'Metafield_DSS');

        if not Metafield.IsEmpty() then
            Metafield.DeleteAll();
        Metafield.Init();
        Metafield.Validate("Parent Table No.", 30127);
        Metafield.Validate("Owner Id", ShopifyProductID);
        Metafield.Validate("Namespace", 'custom');
        Metafield.Validate(Name, 'Metafield_DSS');
        Metafield.Validate(Type, Metafield.Type::number_integer);
        Metafield.Validate(Value, Format(Item.Metafield_DSS)); // custom field
        Metafield."Last Updated by BC" := CurrentDateTime;
        Metafield.Insert(true);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnBeforeFindMapping', '', true, true)]
    local procedure OnBeforeFindMapping(Direction: Enum "Shpfy Mapping Direction"; ItemVariant: Record "Item Variant"; var Item: Record Item;
                                        var ShopifyProduct: Record "Shpfy Product"; var ShopifyVariant: Record "Shpfy Variant"
    )
    begin
        Message('');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", 'OnAfterMapCustomer', '', true, true)]
    local procedure OnAfterUpdateItem(var ShopifyOrderHeader: Record "Shpfy Order Header")
    begin
        Message('');
    end;

    local procedure CollectMetafieldsInBC(ParentTableId: Integer; OwnerId: BigInteger; var TempMetafieldSet: Record "Shpfy Metafield" temporary; MetafieldIds: Dictionary of [BigInteger, DateTime])
    var
        Metafield: Record "Shpfy Metafield";
        UpdatedAt: DateTime;
    begin
        Metafield.SetRange("Parent Table No.", ParentTableId);
        Metafield.SetRange("Owner Id", OwnerId);
        Metafield.SetFilter(Type, '<>%1&<>%2', Metafield.Type::string, Metafield.Type::integer);
        Metafield.SetFilter(Value, '<>%1', '');
        if Metafield.FindSet() then
            repeat
                if MetafieldIds.Get(Metafield.Id, UpdatedAt) then begin
                    if Metafield."Last Updated by BC" > UpdatedAt then begin
                        TempMetafieldSet := Metafield;
                        TempMetafieldSet.Insert(false);
                    end;
                end else begin
                    TempMetafieldSet := Metafield;
                    TempMetafieldSet.Insert(false);
                end;
            until Metafield.Next() = 0;
    end;

    procedure OnGetProductMetafields(Item: Record Item; var Metafields: List of [JsonObject])
    var
        tbl_ShpfyShop: Record "Shpfy Shop";
    begin
        if not tbl_ShpfyShop."Product Metafields To Shopify" then
            exit;


        MetafieldJson.Add('namespace', 'custom');
        MetafieldJson.Add('key', 'material');
        MetafieldJson.Add('value', Item."Description");
        MetafieldJson.Add('type', 'single_line_text_field');

        Metafields.Add(MetafieldJson);
    end;


    var
        MetafieldJson: JsonObject;
    // JsonHelper: Codeunit "Shpfy Json Helper";
    //cu_abc: Codeunit "Shpfy Metafield API";
}
