pageextension 50120 "SOL Cust Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(NumberOfDaysExpired; NumberOfDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of days expired';
                ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
                StyleExpr = DaysExpiredStyle;
            }
        }
    }

    views
    {
        addfirst
        {

            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
            }
        }
    }

    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        ThresholdSetup: Record "SOL Threshold Setup";



    trigger OnOpenPage()
    begin

        if not ThresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        NumberOfDaysExpired := rec.GetNumberOfDaysExpired();
        case NumberOfDaysExpired of
            ThresholdSetup."Threshold 1 Value" .. ThresholdSetup."Threshold 2 Value":
                DaysExpiredStyle := format(ThresholdSetup."Threshold 1 Style");
            ThresholdSetup."Threshold 2 Value" .. 99999:
                DaysExpiredStyle := format(ThresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := 'None';
        end;

    end;

    local procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        ThresholdSetupNotificationMsg: Label 'You need to run the Threshold Setup: ';
        ThresholdSetupNotificationActionLbl: Label 'Click here to run the ThresholdSetup';
    begin
        ThresholdSetupNotification.Message(ThresholdSetupNotificationMsg);
        ThresholdSetupNotification.AddAction(ThresholdSetupNotificationActionLbl, Codeunit::"SOL Threshold Setup Management", 'RunThresholdSetup');
        ThresholdSetupNotification.Send();
    end;
}