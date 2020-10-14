//user defined prinmitive for jk flip flop
primitive jkff_udp(q, j, k, clock, clear);
output q;
reg q;
input j, k, clock, clear;
table
//j  k  clock  clear  q  :  q+
?  ?  ?  1  :  ?  :  0;         //clear
?  ?  ?  (10)  :  ?  :  -;      //ignore negedge of clear

0  0  (01)  0  :  ?  :  -;      //at posedge hold
0  1  (01)  0  :  ?  :  0;      //at posedge reset
1  0  (01)  0  :  ?  :  1;      //at posedge set
1  1  (01)  0  :  1  :  0;      //at posedge toggle
1  1  (01)  0  :  0  :  1;      //at posedge toggle

?  ?  (1?)  0  :  ?  :  -;      //ignore negedge
?  ?  (x0)  0  :  ?  :  -;      //ignore negedge
*  ?  ?  0  :  ?  :  -;         //steady clock ignore changes
?  *  ?  0  :  ?  :  -;         //steady clock ignore changes
endtable
endprimitive