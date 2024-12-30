
import GetPut::*;
import FIFO::*;

typedef enum { MIT, HARVARD } DEST_ID deriving(Bits, Eq);

typedef Bit#(32) DATA;

typedef struct {
    DEST_ID dst;
    DATA data;
} Packet deriving(Bits, Eq);

interface Switch;
    interface Put#(Packet) ucla;
    interface Put#(Packet) usc;

    interface Get#(DATA) mit;
    interface Get#(DATA) harvard;
endinterface

function Put#(Packet) toput(Reg#(Maybe#(Packet)) r);
    return (interface Put;
        method Action put(Packet p) if (!isValid(r));
            r <= tagged Valid p;
        endmethod
    endinterface);
endfunction

function Get#(DATA) toget(Reg#(Maybe#(DATA)) r);
    return (interface Get;
        method ActionValue#(DATA) get() if (r matches tagged Valid .x);
            r <= tagged Invalid;
            return x;
        endmethod
    endinterface);
endfunction


(* synthesize *)
module mkSwitch (Switch);

    Reg#(Maybe#(Packet)) m_ucla <- mkReg(tagged Invalid);
    Reg#(Maybe#(Packet)) m_usc <- mkReg(tagged Invalid);
    
    Reg#(Maybe#(DATA)) m_mit <- mkReg(tagged Invalid);
    Reg#(Maybe#(DATA)) m_harvard <- mkReg(tagged Invalid);

    // uclapending: keeps track of how many cycles ucla has had a message
    // waiting to be delivered.
    Reg#(int) m_uclapending <- mkReg(0);

    // mituclawait: keeps track of how many cycles have elapsed since the last
    // message from ucla was forwarded to mit.
    Reg#(int) m_mituclawait <- mkReg(0);

    function Bool isempty(Maybe#(DATA) x) = !isValid(x);

    rule usc2harvard (m_usc matches tagged Valid .d &&& d.dst == HARVARD
            &&& isempty(m_harvard));

        m_harvard <= tagged Valid d.data;
        m_usc <= tagged Invalid;
    endrule

    rule ucla2harvard (m_ucla matches tagged Valid .d &&& d.dst == HARVARD
            &&& isempty(m_harvard));

        m_harvard <= tagged Valid d.data;
        m_ucla <= tagged Invalid;
    endrule

    rule usc2mit (m_usc matches tagged Valid .d &&& d.dst == MIT
            &&& isempty(m_mit));

        m_mit <= tagged Valid d.data;
        m_usc <= tagged Invalid;
    endrule

    (* descending_urgency="ucla2mit, usc2mit" *)
    rule ucla2mit (m_ucla matches tagged Valid .d &&& d.dst == MIT
            &&& isempty(m_mit));

        m_mit <= tagged Valid d.data;
        m_ucla <= tagged Invalid;
        m_mituclawait <= 0;
    endrule

    rule uclapending (isValid(m_ucla));
        m_uclapending <= m_uclapending + 1;
    endrule

    rule mitucla_wait (True);
        m_mituclawait <= m_mituclawait + 1;
    endrule

    interface Put ucla = toput(m_ucla);
    interface Put usc = toput(m_usc);
    interface Get mit = toget(m_mit);
    interface Get harvard = toget(m_harvard);
endmodule
