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
        field(80100; "External Item No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80101; "test1"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80102; "test2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80103; "test3"; Text[50])
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