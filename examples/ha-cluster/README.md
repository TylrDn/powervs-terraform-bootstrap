# HA Cluster Example
Creates two instances across two private VLANs. Optional public network via `enable_public_network`.

To test failover with keepalived: stop keepalived on node-a and observe VIP moving to node-b.
