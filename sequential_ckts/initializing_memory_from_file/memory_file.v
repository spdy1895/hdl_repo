//>hdl module to write memory from
//*an existing file
module memory_file (

);
reg [7:0] memory [7:0];
//declare an 8 byte memory

integer i;
initial begin
    //read the memory file data.mem address locations
    //given in memory
    $readmemb("memory.mem", memory);
    //display the content of memory
    for(i=0; i<8; i=i+1)
    $display("Memory[%0d]= %b", i, memory[i]);
    // %0dsupports minimum width
end
endmodule //memory_file
