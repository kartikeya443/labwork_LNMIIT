
#include "node.h"

Define_Module(Node);

void Node::initialize()
{
    count=0;
    address=par("nodeId");
    in=gate("in");
    out=gate("out");
    if(address==1)
    {
        cMessage *event = new cMessage();
        scheduleAt(0,event);
    }
}

void Node::handleMessage(cMessage *msg)
{
    if(count<=10){
        if(msg->isSelfMessage()){
            cMessage *c1=new cMessage();
            send(c1,"out");
        }
        else
        {
            cMessage *c2=new cMessage();
            send(c2,"out");
        }
        count++;
    }
}

