(* METADATA
{
	"v3Meta": {
		"objectGuid": "22705885-661a-4139-896e-dc432d02e96c"
	}
}
*)
PROGRAM PLC_PRG
VAR
    uiCounter : UINT := 0;
    oSecondTimer : TON;
    oSecondPulse : R_TRIG;
END_VAR
oSecondTimer(IN := (NOT oSecondTimer.Q) AND (uiCounter < 100), PT := T#1s);
oSecondPulse(CLK := oSecondTimer.Q);

IF oSecondPulse.Q THEN
    uiCounter := uiCounter + 1;
END_IF;
END_PROGRAM