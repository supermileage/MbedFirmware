#include "mbed.h"

DigitalOut myled(LED1);
Serial pc(USBTX, USBRX);
CAN can(D10, D2);

void read();
void send(const char* data);

int main() {
    while(true) {  
        // send("some data");
        read();
    }
}

void read() {
    CANMessage msg;
    pc.printf("Checking \n");
    if(can.read(msg)) {
        pc.printf("Recieved, \n");
        myled = !myled; 
    }
}

void send(const char* data) {
    pc.printf("Sending \n");
    can.write(CANMessage(1,data,8));
    myled = 1; 
    wait(1); 
    myled = 0;
    wait(1); 
}
