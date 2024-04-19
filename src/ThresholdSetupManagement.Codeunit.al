codeunit 50120 "SOL Threshold Setup Management"
{


    var
        myInt: Integer;

    procedure RunThresholdSetup(var ThresholdSetupNotification: notification)
    var
        ThresholdSetupPage: page "SOL Threshold Setup";
    begin
        ThresholdSetupPage.Run();
    end;
}