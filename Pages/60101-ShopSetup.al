page 60101 "Shop Setup_DSSS"
{
    Caption = 'Shop Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Shop Setup_DSSS";
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Shop; Rec.Shop)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}