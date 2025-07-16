pageextension 60106 "ItemCard_DSSS" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("External Item No"; Rec."External Item No")
            {
                ApplicationArea = all;
                ToolTip = 'This is my custom field';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}