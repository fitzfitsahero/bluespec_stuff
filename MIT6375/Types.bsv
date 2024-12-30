//enum is a data type with "named" values
typedef enum {
    ADD,
    SUB,
    MUL,
    DIV
} Operation deriving(Bits, Eq);



//struct is a "composite" data type
typedef struct {
    Operation op;
    Bit#(32)  val;
} Command deriving(Bits, Eq);



//Example
typedef Server#(Command, Bit#(32)) CalculatorIfc;

module mkCalculator (CalculatorIfc);
    Reg#(Bit#(32))      acc <- mkReg(0);
    FIFO#(Bit#(32)) outfifo <- mkFIFO();

    interface Put request;
        method Action put(Command cmd);
        Bit#(32) upd = ?;
        case (cmd.op)
            ADD: upd = acc + cmd.val;
            SUB: upd = acc - cmd.val;
            MUL: upd = acc * cmd.val;
            DIV: upd = acc / cmd.val;
        endcase

        acc <= upd;
        outfifo.enq(upd);
        endmethod
    endinterface

    interface Get response = toGet(outfifo);
endmodule



//tagged union is a "composite" data type
//contains only one member at a time
typedef union tagged {
    void                                  Clear;
    struct {Operation op; Bit#(32) val;}  Operate;
} Command deriving(Bits, Eq);



//Example
typedef Server#(Command, Bit#(32)) CalculatorIfc;

module mkCalculator (CalculatorIfc);
    Reg#(Bit#(32))      acc <- mkReg(0);
    FIFO#(Bit#(32)) outfifo <- mkFIFO();

    interface Put request;
        method Action put(Command cmd);
            Bit#(32) upd = ?;
            case (cmd) matches
                tagged Clear: upd = 0;
                tagged Operate { op: .op, val: .val }: begin
                    case (op)
                        ADD: upd = acc + val;
                        SUB: upd = acc - val;
                        MUL: upd = acc * val;
                        DIV: upd = acc / val;
                    endcase
                end
            endcase

            acc <= upd;
            outfifo.enq(upd);
        endmethod
    endinterface

    interface Get response = toGet(outfifo);
endmodule

