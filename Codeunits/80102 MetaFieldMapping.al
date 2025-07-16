codeunit 60102 "MetaFieldMapping"
{
    trigger OnRun()
    begin

    end;

    //mapping shopify metafield with Business central Custom Field..

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", OnAfterCreateItem, '', false, false)]
    procedure MapItemMetafieldOnAfterCreateItem(var Item: Record Item; var ShopifyProduct: Record "Shpfy Product")
    var
        Metafield: Record "Shpfy Metafield";
        ItemSubstitution: Record "Item Substitution";
    begin
        Metafield.SetRange("Owner Type", Metafield."Owner Type"::Product);
        Metafield.SetRange("Owner ID", ShopifyProduct.Id);
        Metafield.SetRange(Name, 'external');
        if Metafield.FindFirst() then begin
            Item."External Item No" := Metafield.Value;
        end;

    end;

    //mapping shopify metafield with Business central Custom Field..

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", OnAfterUpdateItem, '', false, false)]
    procedure MapItemMetafieldOnAfterCreateItem1(var Item: Record Item; var ShopifyProduct: Record "Shpfy Product")
    var
        Metafield: Record "Shpfy Metafield";
        ItemSubstitution: Record "Item Substitution";
    begin
        Metafield.SetRange("Owner Type", Metafield."Owner Type"::Product);
        Metafield.SetRange("Owner ID", ShopifyProduct.Id);
        Metafield.SetRange(Name, 'external');
        if Metafield.FindFirst() then begin
            Item."External Item No" := Metafield.Value;

            Item.Modify();
        end;
    end;
    //...........................................................................................................

    var
        myInt: Integer;
}