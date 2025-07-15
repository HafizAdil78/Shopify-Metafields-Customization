tableextension 60101 "Item" extends Item
{
    fields
    {
        field(60101; "Metafield_DSS"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60100; "test-1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}