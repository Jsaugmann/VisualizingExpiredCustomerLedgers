table 50120 "SOL Threshold Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Threshold Setup';

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';

        }
        field(2; "Threshold 1 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 Value';

        }
        field(3; "Threshold 2 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 Value';

        }
        field(4; "Threshold 1 Style"; Enum "SOL Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 Style';
        }
        field(5; "Threshold 2 Style"; Enum "SOL Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 Style';
        }



    }
    keys
    {

        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}