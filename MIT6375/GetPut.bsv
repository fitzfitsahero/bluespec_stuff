//Get/Put provides simple handshaking mechanism for getting data from a module or putting data into it

//Polymorphic

//Easy to connect together



interface Get#(type t);
    method ActionValue#(t) get();
endinterface

interface Put#(type t);
    method Action put(t x);
endinterface



//Example
import FIFO::*;
import GetPut::*;

interface FooIfc;
   interface Put#(Bit#(32))  request;
   interface Get#(Bit#(32))  response;
endinterface

module mkFoo (FooIfc);
   FIFO#(Bit#(32))  reqQ <- mkFIFO;
   FIFO#(Bit#(32)) respQ <- mkFIFO;

   interface Put request;
      method Action put (Bit#(32) req);
          reqQ.enq (req);
      endmethod
   endinterface

   interface Get response;
      method ActionValue#(Bit#(32)) get ();
          let resp = respQ.first; respQ.deq;
          return resp;
      endmethod
   endinterface
endmodule



//Converting FIFOs to Get/Put
module mkFoo (FooIfc);
   FIFO#(Bit#(32))  reqQ <- mkFIFO;
   FIFO#(Bit#(32)) respQ <- mkFIFO;

   interface request = fifoToPut(reqQ);

   interface response = fifoToGet(respQ);
endmodule



//Server interface
interface Server #(type req_t, type rsp_t);
   interface Put#(req_t)  request;
   interface Get#(rsp_t)  response;
endinterface



//Example
import FIFO::*;
import GetPut::*;
import ClientServer::*;

typedef Server#(Bit#(32), Bit#(32)) FooIfc;

module mkFoo (FooIfc);
   FIFO#(Bit#(32))  reqQ <- mkFIFO;
   FIFO#(Bit#(32)) respQ <- mkFIFO;

   interface Put request = fifoToPut(reqQ);

   interface Get response = fifoToGet(respQ);
endmodule

