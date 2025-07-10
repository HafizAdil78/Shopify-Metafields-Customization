pageextension 60101 "Item Card" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field(Metafield_DSS; Rec.Metafield_DSS)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action(SyncToShopify)
            {
                Caption = 'Sync Metafields to Shopify';
                Image = Export;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ShopifyProduct: Record "Shpfy Product";
                    Code: Codeunit "Custom Shpfy Field Sync";
                    shopisetup: Record "Shop Setup_DSSS";
                    ShopifyShop: Record "Shpfy Shop";
                begin
                    shopisetup.Reset();
                    shopisetup.Get();
                    shopisetup.TestField(Shop);
                    ShopifyShop.Reset();
                    ShopifyShop.SetRange(Code, shopisetup.Shop);
                    if ShopifyShop.FindFirst() then begin
                        if ShopifyShop."Product Metafields To Shopify" = true then begin
                            ShopifyProduct.Reset();
                            ShopifyProduct.SetRange("Shop Code", ShopifyShop.Code);
                            ShopifyProduct.SetRange("Item No.", Rec."No.");
                            if ShopifyProduct.FindFirst() then
                                Code.SyncCustomFieldsToShopify(Rec, ShopifyProduct.Id);
                        end
                        else
                            Error('Please enable the Product Metafield syncing on Shop %1', ShopifyShop.Code);
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}