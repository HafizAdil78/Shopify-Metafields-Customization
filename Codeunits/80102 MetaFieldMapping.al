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
        if Metafield.FindSet() then
            repeat

                case Metafield.Name of
                    'external':
                        begin
                            Item."External Item No" := Metafield.Value;
                        end;
                    'test1':
                        begin
                            Item.test1 := Metafield.Value;
                        end;
                    'test2':
                        begin
                            Item.test2 := Metafield.Value;
                        end;
                    'test3':
                        begin
                            Item.test3 := Metafield.Value;
                        end;

                end;
            until Metafield.Next() = 0;
        Item.Modify();
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
        if Metafield.FindSet() then
            repeat

                case Metafield.Name of
                    'external':
                        begin
                            Item."External Item No" := Metafield.Value;
                        end;
                    'test1':
                        begin
                            Item.test1 := Metafield.Value;
                        end;
                    'test2':
                        begin
                            Item.test2 := Metafield.Value;
                        end;
                    'test3':
                        begin
                            Item.test3 := Metafield.Value;
                        end;

                end;
            until Metafield.Next() = 0;
        Item.Modify();
    end;
    //...........................................................................................................

    var
        myInt: Integer;
}