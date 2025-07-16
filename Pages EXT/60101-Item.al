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
            field("test-1"; Rec."test-1")
            {
                ApplicationArea = All;
            }
            field("External Item No"; Rec."External Item No")
            {
                ApplicationArea = all;
                ToolTip = 'This is my custom field';
            }

            field(test1; Rec.test1)
            {
                ApplicationArea = all;
            }
            field(test2; Rec.test2)
            {
                ApplicationArea = all;
            }
            field(test3; Rec.test3)
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
                    CustomShpfyFieldSync: Codeunit "Custom Shpfy Field Sync";
                    shopisetup: Record "Shop Setup_DSSS";
                    ShopifyShop: Record "Shpfy Shop";
                begin
                    shopisetup.Reset();
                    // shopisetup.Get();
                    // shopisetup.TestField(Shop);
                    ShopifyShop.Reset();
                    ShopifyShop.SetRange(Code, 'BUYSELL');
                    if ShopifyShop.FindFirst() then begin
                        if ShopifyShop."Product Metafields To Shopify" = true then begin
                            ShopifyProduct.Reset();
                            ShopifyProduct.SetRange("Shop Code", ShopifyShop.Code);
                            ShopifyProduct.SetRange("Item No.", Rec."No.");
                            if ShopifyProduct.FindFirst() then
                                CustomShpfyFieldSync.SyncCustomFieldsToShopify(Rec, ShopifyProduct.Id);
                        end
                        else
                            Error('Please enable the Product Metafield syncing on Shop %1', ShopifyShop.Code);
                    end;
                end;
            }
            action("Sync Metafields")
            {
                ApplicationArea = All;
                Caption = 'Sync Metafields to Shopify';
                trigger OnAction()
                var
                    ShopifySync: Codeunit "Custom Shpfy Field Sync";
                begin
                    // ShopifySync.SyncProductMetafields(Rec);
                end;
            }
        }

    }

    var
        myInt: Integer;
}