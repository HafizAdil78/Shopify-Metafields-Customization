tableextension 60102 ShopifyProduct extends "Shpfy Product"
{
    fields
    {
        field(60100; Metafield_DSS; Integer)
        {
            Caption = 'Metafield_DSS';
            DataClassification = ToBeClassified;
        }
        field(60101; "test-1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Sync Metafields to Shopify"; Boolean)
        {
            Caption = 'Sync Product/Variant Metafields to Shopify';
            ToolTip = 'Specifies whether product/variant metafields are synchronized to Shopify.';
        }
    }
}
