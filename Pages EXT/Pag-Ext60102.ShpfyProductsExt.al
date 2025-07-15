pageextension 60102 ShpfyProductsExt extends "Shpfy Products"
{
    layout
    {
        addafter(Description)
        {
            field(Metafield_DSS; Rec.Metafield_DSS)
            {
                ApplicationArea = All;
            }
            field("test-1"; Rec."test-1")
            {
                ApplicationArea = All;
            }
        }
    }
}
