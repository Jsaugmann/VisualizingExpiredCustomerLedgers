page 50120 "SOL Threshold Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SOL Threshold Setup";
    Caption = 'Threshold setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    Permissions =
        tabledata "SOL Threshold Setup" = RIM;


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Threshold 1 Style"; Rec."Threshold 1 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Style field.';
                }
                field("Threshold 1 Value"; Rec."Threshold 1 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Value field.';
                }
                field("Threshold 2 Style"; Rec."Threshold 2 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Style field.';
                }
                field("Threshold 2 Value"; Rec."Threshold 2 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Value field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        ThresholdSetup: Record "SOL Threshold Setup";
    begin
        if not ThresholdSetup.FindFirst() then begin
            ThresholdSetup.Init();
            ThresholdSetup.Validate("Primary Key", 'SETUP');
            ThresholdSetup.Insert();
        end;
    end;
}