
#ifndef __LAB4_NODE_H_
#define __LAB4_NODE_H_

#include <omnetpp.h>

using namespace omnetpp;

/**
 * TODO - Generated class
 */
class Node : public cSimpleModule
{
    int address;
    int count=0;
    cGate *in;
    cGate *out;
  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

#endif
