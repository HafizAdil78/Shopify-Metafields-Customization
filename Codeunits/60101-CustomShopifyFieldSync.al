codeunit 60101 "Custom Shpfy Field Sync"
{
    procedure SyncCustomFieldsToShopify(Item: Record Item; ShopifyProductID: BigInteger)
    var
        Metafield: Record "Shpfy Metafield";
        LastID: BigInteger;
    begin
        Metafield.Reset();
        Metafield.SetRange("Parent Table No.", 30127);
        Metafield.SetRange("Owner Id", ShopifyProductID);
        Metafield.SetRange("Namespace", 'custom');
        Metafield.SetRange(Name, 'big_ak');

        if not Metafield.IsEmpty() then
            Metafield.DeleteAll();
        Metafield.Init();
        Metafield.Validate("Parent Table No.", 30127);
        Metafield.Validate("Owner Id", ShopifyProductID);
        Metafield.Validate("Namespace", 'custom');
        Metafield.Validate(Name, 'big_ak');
        Metafield.Validate(Type, Metafield.Type::number_integer);
        Metafield.Validate(Value, Format(Item.Metafield_DSS)); // custom field
        Metafield."Last Updated by BC" := CurrentDateTime;
        Metafield.Insert(true);
    end;
}
