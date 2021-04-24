INDEX
	Week=1..10;
	Clinic=1..3;
DATA
	Demand[Week, Clinic] :=((0,0,0),(0,150,50),(220,30,160),(70,50,40),
				(60,50,200),(150,10,170),(30,450,0),
				(130,100,30),(60,50,30),(60,90,120));
	Cost_Shipping[Clinic]	:= (150, 200, 250); 
	Limit_Inventory[Clinic] := (225, 150, 100);
DECISION VARIABLES
	IL[Week, Clinic]	!Inventory level
	NTL[Week, Clinic]	!Number of trials sended
INTEGER VARIABLES
	NTK[Week, Clinic]	!Number of truck
	TTK[Week]	!Truck in total	
MACRO
	ShippingCost=SUM(Week,Clinic:NTK*Cost_Shipping);
	HoldingCost=0.1*(Sum(Week,Clinic:IL));
MODEL
	Min TotalCost = ShippingCost+HoldingCost;
SUBJECT TO
	IL[1,1]=0; IL[1,2]=0; IL[1,3]=0;
	IL[2,1]=IL[1,1]+NTL[1,1]-Demand[2,1]; IL[2,2]=IL[1,2]+NTL[1,2]-Demand[2,2]; IL[2,3]=IL[1,3]+NTL[1,3]-Demand[2,3];
	IL[3,1]=IL[2,1]+NTL[2,1]-Demand[3,1]; IL[3,2]=IL[2,2]+NTL[2,2]-Demand[3,2]; IL[3,3]=IL[2,3]+NTL[2,3]-Demand[3,3];
	IL[4,1]=IL[3,1]+NTL[3,1]-Demand[4,1]; IL[4,2]=IL[3,2]+NTL[3,2]-Demand[4,2]; IL[4,3]=IL[3,3]+NTL[3,3]-Demand[4,3];
	IL[5,1]=IL[4,1]+NTL[4,1]-Demand[5,1]; IL[5,2]=IL[4,2]+NTL[4,2]-Demand[5,2]; IL[5,3]=IL[4,3]+NTL[4,3]-Demand[5,3];
	IL[6,1]=IL[5,1]+NTL[5,1]-Demand[6,1]; IL[6,2]=IL[5,2]+NTL[5,2]-Demand[6,2]; IL[6,3]=IL[5,3]+NTL[5,3]-Demand[6,3];
	IL[7,1]=IL[6,1]+NTL[6,1]-Demand[7,1]; IL[7,2]=IL[6,2]+NTL[6,2]-Demand[7,2]; IL[7,3]=IL[6,3]+NTL[6,3]-Demand[7,3];
	IL[8,1]=IL[7,1]+NTL[7,1]-Demand[8,1]; IL[8,2]=IL[7,2]+NTL[7,2]-Demand[8,2]; IL[8,3]=IL[7,3]+NTL[7,3]-Demand[8,3];
	IL[9,1]=IL[8,1]+NTL[8,1]-Demand[9,1]; IL[9,2]=IL[8,2]+NTL[8,2]-Demand[9,2]; IL[9,3]=IL[8,3]+NTL[8,3]-Demand[9,3];
	IL[10,1]=IL[9,1]+NTL[9,1]-Demand[10,1]; IL[10,2]=IL[9,2]+NTL[9,2]-Demand[10,2]; IL[10,3]=IL[9,3]+NTL[9,3]-Demand[10,3];
	!Relationship between new week and old week
	NTL[1,1]<=NTK[1,1]*200; NTL[1,2]<=NTK[1,2]*200; NTL[1,3]<=NTK[1,3]*200;
	NTL[2,1]<=NTK[2,1]*200; NTL[2,2]<=NTK[2,2]*200; NTL[2,3]<=NTK[2,3]*200;	
	NTL[3,1]<=NTK[3,1]*200; NTL[3,2]<=NTK[3,2]*200; NTL[3,3]<=NTK[3,3]*200;
	NTL[4,1]<=NTK[4,1]*200; NTL[4,2]<=NTK[4,2]*200; NTL[4,3]<=NTK[4,3]*200;
	NTL[5,1]<=NTK[5,1]*200; NTL[5,2]<=NTK[5,2]*200; NTL[5,3]<=NTK[5,3]*200;
	NTL[6,1]<=NTK[6,1]*200; NTL[6,2]<=NTK[6,2]*200; NTL[6,3]<=NTK[6,3]*200;
	NTL[7,1]<=NTK[7,1]*200; NTL[7,2]<=NTK[7,2]*200; NTL[7,3]<=NTK[7,3]*200;
	NTL[8,1]<=NTK[8,1]*200; NTL[8,2]<=NTK[8,2]*200; NTL[8,3]<=NTK[8,3]*200;	
	NTL[9,1]<=NTK[9,1]*200; NTL[9,2]<=NTK[9,2]*200; NTL[9,3]<=NTK[9,3]*200;
	NTL[10,1]<=NTK[10,1]*200; NTL[10,2]<=NTK[10,2]*200; NTL[10,3]<=NTK[10,3]*200;
	TTK[1]=NTK[1,1]+NTK[1,2]+NTK[1,3];TTK[2]=NTK[2,1]+NTK[2,2]+NTK[2,3];TTK[3]=NTK[3,1]+NTK[3,2]+NTK[3,3];TTK[4]=NTK[4,1]+NTK[4,2]+NTK[4,3];
	TTK[5]=NTK[5,1]+NTK[5,2]+NTK[5,3];TTK[6]=NTK[6,1]+NTK[6,2]+NTK[6,3];TTK[7]=NTK[7,1]+NTK[7,2]+NTK[7,3];TTK[8]=NTK[8,1]+NTK[8,2]+NTK[8,3];
	TTK[9]=NTK[9,1]+NTK[9,2]+NTK[9,3];TTK[10]=NTK[10,1]+NTK[10,2]+NTK[10,3];
Bounds
	
	
	IL[Week=1..10,Clinic]<=Limit_Inventory[Clinic];
	TTK[Week]<=3
	
END
