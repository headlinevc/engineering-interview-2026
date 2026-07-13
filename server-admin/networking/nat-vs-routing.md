# Q2: NAT vs routing between two private networks

Network A: `10.0.0.0/24` (hosts behind router R1)
Network B: `192.168.100.0/24` (hosts behind router R2)

## Setup 1 — NAT (masquerade) on R1

```bash
# on R1
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth1 -j MASQUERADE
```

Hosts on network A can reach out to network B (their source IP gets
rewritten to R1's), but a host on network B cannot initiate a connection
back to a specific host on network A — there's no route back to
`10.0.0.0/24`, only to R1 itself.

## Setup 2 — static routing between R1 and R2

```bash
# on R1
ip route add 192.168.100.0/24 via <R2's address on the shared link>

# on R2
ip route add 10.0.0.0/24 via <R1's address on the shared link>
```

Now hosts on both networks can reach each other directly by their real
IPs, in either direction, with no address rewriting.
